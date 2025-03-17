###############################################################################

<#
.SYNOPSIS
Performs a google search and returns the links

.DESCRIPTION
Performs a google search and returns the links

.PARAMETER Query
The google query to perform

.PARAMETER Max
The maximum number of results to obtain, defaults to 200

.EXAMPLE
PS C:\> $Urls = Get-GoogleSearchResultUrls "site:github.com PowerShell module"; $Urls

.NOTES
Requires the Windows 10+ Operating System
#>
################################################################################

function Get-GoogleSearchResultUrls {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidGlobalVars", "")]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseDeclaredVarsMoreThanAssignments", "")]
    [Alias("qlinksget")]
    param(
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
        )]
        [Alias("q", "Value", "Name", "Text", "Query")]
        [string[]] $Queries,
        ################################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "The maximum number of results to obtain, defaults to 200"
        )]
        [int] $Max = 200,
        ###############################################################################
        [ValidateSet(
            "Afrikaans",
            "Akan",
            "Albanian",
            "Amharic",
            "Arabic",
            "Armenian",
            "Azerbaijani",
            "Basque",
            "Belarusian",
            "Bemba",
            "Bengali",
            "Bihari",
            "Bork, bork, bork!",
            "Bosnian",
            "Breton",
            "Bulgarian",
            "Cambodian",
            "Catalan",
            "Cherokee",
            "Chichewa",
            "Chinese (Simplified)",
            "Chinese (Traditional)",
            "Corsican",
            "Croatian",
            "Czech",
            "Danish",
            "Dutch",
            "Elmer Fudd",
            "English",
            "Esperanto",
            "Estonian",
            "Ewe",
            "Faroese",
            "Filipino",
            "Finnish",
            "French",
            "Frisian",
            "Ga",
            "Galician",
            "Georgian",
            "German",
            "Greek",
            "Guarani",
            "Gujarati",
            "Hacker",
            "Haitian Creole",
            "Hausa",
            "Hawaiian",
            "Hebrew",
            "Hindi",
            "Hungarian",
            "Icelandic",
            "Igbo",
            "Indonesian",
            "Interlingua",
            "Irish",
            "Italian",
            "Japanese",
            "Javanese",
            "Kannada",
            "Kazakh",
            "Kinyarwanda",
            "Kirundi",
            "Klingon",
            "Kongo",
            "Korean",
            "Krio (Sierra Leone)",
            "Kurdish",
            "Kurdish (Soranî)",
            "Kyrgyz",
            "Laothian",
            "Latin",
            "Latvian",
            "Lingala",
            "Lithuanian",
            "Lozi",
            "Luganda",
            "Luo",
            "Macedonian",
            "Malagasy",
            "Malay",
            "Malayalam",
            "Maltese",
            "Maori",
            "Marathi",
            "Mauritian Creole",
            "Moldavian",
            "Mongolian",
            "Montenegrin",
            "Nepali",
            "Nigerian Pidgin",
            "Northern Sotho",
            "Norwegian",
            "Norwegian (Nynorsk)",
            "Occitan",
            "Oriya",
            "Oromo",
            "Pashto",
            "Persian",
            "Pirate",
            "Polish",
            "Portuguese (Brazil)",
            "Portuguese (Portugal)",
            "Punjabi",
            "Quechua",
            "Romanian",
            "Romansh",
            "Runyakitara",
            "Russian",
            "Scots Gaelic",
            "Serbian",
            "Serbo-Croatian",
            "Sesotho",
            "Setswana",
            "Seychellois Creole",
            "Shona",
            "Sindhi",
            "Sinhalese",
            "Slovak",
            "Slovenian",
            "Somali",
            "Spanish",
            "Spanish (Latin American)",
            "Sundanese",
            "Swahili",
            "Swedish",
            "Tajik",
            "Tamil",
            "Tatar",
            "Telugu",
            "Thai",
            "Tigrinya",
            "Tonga",
            "Tshiluba",
            "Tumbuka",
            "Turkish",
            "Turkmen",
            "Twi",
            "Uighur",
            "Ukrainian",
            "Urdu",
            "Uzbek",
            "Vietnamese",
            "Welsh",
            "Wolof",
            "Xhosa",
            "Yiddish",
            "Yoruba",
            "Zulu")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The language of the returned search results"
        )]
        [string] $Language = $null
    )

    begin {
        [bool] $more = $true;
        [int] $i = 0;
        Write-Verbose "Starting Google search operation"
    }

    process {
        foreach ($Query in $Queries) {
            Write-Verbose "Processing query: $Query"

            # initialize script-scoped data structure
            $Global:Data = @{
                urls   = @()
                query  = ""
                more   = $false
                done   = @{}
                source = @{ url = "" }
            }

            # prepare language key for search URL
            $langKey = "&hl=en"
            if (![string]::IsNullOrWhiteSpace($Language)) {
                $langKey = "&hl=en&lr=lang_$([Uri]::EscapeUriString(
                (Get-WebLanguageDictionary)[$Language]
            ))"
            }

            # prepare search URL
            $encodedQuery = [Uri]::EscapeUriString($Query)
            $url = "https://www.google.com/search?q=$encodedQuery$langKey"
            $results = [System.Collections.Generic.List[System.Uri]]::new()

            # navigate to search page
            Write-Verbose "Navigating to: $url"
            Set-WebbrowserTabLocation $url
            do {
                Write-Verbose "Scanning page for URLs..."
                Get-WebbrowserTabDomNodes a "e.getAttribute('href')" | Where-Object { -not ("$PSItem" -like "*google*") } | Where-Object { "$PSItem" -like "http?://*" } |
                ForEach-Object {
                    try {
                        Write-Verbose "Trying to parse url: $_"
                        [System.Uri] $uri = [System.Uri]::new($_);
                        Write-Verbose "Processing URL: $uri"

                        if ($uri.IsAbsoluteUri) {

                            [bool] $exists = @($results | Where-Object { $PSItem.AbsoluteUri -eq $uri.AbsoluteUri }).Count -gt 0

                            if (-not $exists) {

                                if ($Max-- -gt 0) {

                                    Write-Verbose "Adding new unique URL: $uri"
                                    $results.Add($uri)
                                }
                                else {
                                    Write-Verbose "Reached maximum results limit"
                                }
                            }
                            else {
                                Write-Verbose "Skipping duplicate URL: $uri"
                            }
                        }
                    }
                    catch {
                        Write-Verbose "Failed to process URL: $_"
                    }
                }


                try {
                    $Global:chromeController.GetByText("Next")[0].ClickAsync().Wait();
                    $Global:chromeController.WaitForNavigationAsync().Wait();
                    $more = $true
                }
                catch {
                    $more = $i++ -gt 3;
                }

                Start-Sleep -Seconds 1

            } while ($more -and ($Max -gt 0))

            Write-Verbose "Found $($results.Count) unique URLs"
            $results | ForEach-Object { $PSItem }
        }
    }
}
################################################################################