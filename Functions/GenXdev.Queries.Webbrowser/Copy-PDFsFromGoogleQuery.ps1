###############################################################################

<#
.SYNOPSIS
Downloads PDF files found through Google search results.

.DESCRIPTION
Performs a Google query in the previously selected webbrowser tab and downloads
all found PDF files into the current directory. Supports multiple queries and
language filtering.

.PARAMETER Queries
The search terms to query Google for PDF files.

.PARAMETER Max
Maximum number of results to retrieve (default: 200).

.PARAMETER Language
Optional language filter for search results.

.EXAMPLE
Open-Webbrowser
Select-WebbrowserTab
$null = New-Item -ItemType Directory -Name pdfs
Set-Location pdfs
Copy-PDFsFromGoogleQuery "scientific paper co2" -Max 50 -Language "English"
#>
function Copy-PDFsFromGoogleQuery {

    [CmdletBinding()]
    param(
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The search terms to query Google for PDF files"
        )]
        [string[]] $Queries,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "Maximum number of results to retrieve (default: 200)"
        )]
        [int] $Max = 200,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = "Optional language filter for search results"
        )]
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
            "Zulu"
        )]
        [string] $Language
        ########################################################################
    )

    begin {
        Write-Verbose "Starting PDF download operation"
    }

    process {
        foreach ($query in $Queries) {
            Write-Verbose "Processing query: $query"

            # construct search query with pdf filter
            $searchQuery = "filetype:pdf $query"

            # get search results
            $urls = if ($Language) {
                Get-GoogleSearchResultUrls -Max $Max -Query $searchQuery -Language $Language
            }
            else {
                Get-GoogleSearchResultUrls -Max $Max -Query $searchQuery
            }

            Write-Verbose "Found $($urls.Count) PDF URLs to process"

            # process urls in parallel
            $urls | ForEach-Object -ThrottleLimit 64 -Parallel {
                try {
                    # construct safe filename
                    $safeName = [Uri]::UnescapeDataString(
                        [IO.Path]::GetFileName($PSItem)
                    ).Split("#")[0].Split("?")[0]

                    $safeName = $safeName -replace '[\\/:*?"<>|\s]', '_'

                    # create unique filename
                    $destination = Join-Path $using:PWD (
                        "{0}_{1}_{2}.pdf" -f $safeName,
                        [DateTime]::UtcNow.Ticks,
                        [Threading.Thread]::CurrentThread.ManagedThreadId
                    )

                    Write-Verbose "Downloading to: $destination"

                    # download pdf
                    $null = Invoke-WebRequest -Uri $PSItem -OutFile $destination

                    Get-Item $destination
                }
                catch {
                    Write-Warning "Failed to download: $PSItem"
                }
            }
        }
    }
}
################################################################################
