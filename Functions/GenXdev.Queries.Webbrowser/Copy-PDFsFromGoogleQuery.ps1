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
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The search terms to query Google for PDF files"
        )]
        [Alias("q", "Value", "Name", "Text", "Query")]
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
        Microsoft.PowerShell.Utility\Write-Verbose "Starting PDF download operation in directory: $PWD"
    }

    process {
        foreach ($query in $Queries) {
            Microsoft.PowerShell.Utility\Write-Verbose "Processing query: $query with language: $($Language ?? 'default')"

            # construct search query with pdf filter
            $searchQuery = "filetype:pdf $query"
            Microsoft.PowerShell.Utility\Write-Verbose "Using search query: $searchQuery"

            # get search results
            $urls = if ($Language) {
                Microsoft.PowerShell.Utility\Write-Verbose "Searching with language filter: $Language"
                GenXdev.Queries\Get-GoogleSearchResultUrls -Max $Max -Query $searchQuery -Language $Language
            }
            else {
                Microsoft.PowerShell.Utility\Write-Verbose "Searching without language filter"
                GenXdev.Queries\Get-GoogleSearchResultUrls -Max $Max -Query $searchQuery
            }

            Microsoft.PowerShell.Utility\Write-Verbose "Found $($urls.Count) PDF URLs to process"
            Microsoft.PowerShell.Utility\Write-Verbose "Starting parallel download with throttle limit: 64"

            # process urls in parallel
            $urls | Microsoft.PowerShell.Core\ForEach-Object -ThrottleLimit 64 -Parallel {
                try {
                    Microsoft.PowerShell.Utility\Write-Verbose "Processing URL: $PSItem"

                    # construct safe filename
                    $safeName = [Uri]::UnescapeDataString(
                        [IO.Path]::GetFileName($PSItem)
                    ).Split("#")[0].Split("?")[0]

                    $safeName = $safeName -replace '[\\/:*?"<>|\s]', '_'
                    Microsoft.PowerShell.Utility\Write-Verbose "Sanitized filename: $safeName"

                    # create unique filename
                    $destination = Microsoft.PowerShell.Management\Join-Path $using:PWD (
                        "{0}_{1}_{2}.pdf" -f $safeName,
                        [DateTime]::UtcNow.Ticks,
                        [Threading.Thread]::CurrentThread.ManagedThreadId
                    )

                    Microsoft.PowerShell.Utility\Write-Verbose "Downloading to: $destination"

                    # download pdf
                    $response = Microsoft.PowerShell.Utility\Invoke-WebRequest -Uri $PSItem -OutFile $destination
                    Microsoft.PowerShell.Utility\Write-Verbose "Download completed: $($response.StatusCode) - $($response.StatusDescription)"

                    $fileInfo = Microsoft.PowerShell.Management\Get-Item $destination
                    Microsoft.PowerShell.Utility\Write-Verbose "Saved file: $($fileInfo.FullName) ($($fileInfo.Length) bytes)"
                    $fileInfo
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Warning "Failed to download: $PSItem. Error: $($_.Exception.Message)"
                }
            }

            Microsoft.PowerShell.Management\Get-ChildItem .\*.pdf | Microsoft.PowerShell.Core\ForEach-Object {

                $newName = [System.Text.RegularExpressions.Regex]::Replace(($_.Name), "\.pdf_\d*_\d*\.pdf", ".pdf")
                if ($newName -eq $_.Name) { return }

                if ([IO.File]::Exists((GenXdev.FileSystem\Expand-Path ".\$newName"))) {

                    $null = Microsoft.PowerShell.Management\Remove-Item $_.FullName -Force
                    return;
                }

                $null = Microsoft.PowerShell.Management\Rename-Item $_ $newName -Force
            }
        }
    }
    ################################################################################
}