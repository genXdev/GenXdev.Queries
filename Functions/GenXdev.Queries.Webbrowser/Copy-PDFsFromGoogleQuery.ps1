###############################################################################

<#
.SYNOPSIS
Performs a Google query in the previously selected webbrowser tab, and download all found pdf's into current directory

.DESCRIPTION
Performs a Google query in the previously selected webbrowser tab, and download all found pdf's into current directory

.PARAMETER Query
Parameter description

.PARAMETER Max
The maximum number of results to obtain, defaults to 200

.EXAMPLE
PS D:\Downloads>

    Open-Webbrowser
    Select-WebbrowserTab

    mkdir pdfs;
    cd pdfs;

    Copy-PDFsFromGoogleQuery scientific, paper, co2
.EXAMPLE
PS D:\Downloads>

    Open-Webbrowser
    Select-WebbrowserTab

    mkdir pdfs;
    cd pdfs;

    Copy-PDFsFromGoogleQuery -Query "scientific paper co2" | Select-Object -First 10 | Open-Webbrowser

.NOTES
Requires the Windows 10+ Operating System
#>
function Copy-PDFsFromGoogleQuery {

    [CmdletBinding()]

    param(
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
        )]
        [string[]] $Queries,
        ###############################################################################

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


    }

    process {

        foreach ($Query in $Queries) {

            if ([string]::IsNullOrWhiteSpace($Language)) {

                $list = Get-GoogleSearchResultUrls -Max $Max -Query "filetype:pdf $Query"
            }
            else {
                $list = Get-GoogleSearchResultUrls -Max $Max -Query "filetype:pdf $Query" -Language $Language
            }

            $list | ForEach-Object -ThrottleLimit 64 -Parallel {

                try {

                    $destination = [IO.Path]::Combine(
                        $PWD,
                        (
                            [IO.Path]::ChangeExtension(
                                [Uri]::UnescapeDataString(
                                    [IO.Path]::GetFileName($PSItem).Split("#")[0].Split("?")[0]
                                ).Replace("\", "_").Replace("/", "_").Replace("?", "_").Replace("*", "_").Replace(" ", "_").Replace("__", "_") +
                                "_$([DateTime]::UtcNow.Ticks)_$([System.Threading.Thread]::CurrentThread.ManagedThreadId)",
                                ".pdf"
                            )
                        )
                    );

                    Invoke-WebRequest -Uri $PSItem -OutFile $destination

                    Get-ChildItem $destination
                }
                catch {

                }
            }
        }
    }
}
