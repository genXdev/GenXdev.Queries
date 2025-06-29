################################################################################
<#
.SYNOPSIS
Opens all possible query types for given search terms or URLs.

.DESCRIPTION
Executes all cmdlets that handle webpage queries, processing both URLs and search
terms. For URLs, it performs site-specific queries, and for search terms it
executes general web queries.

.PARAMETER Queries
The search terms or URLs to query.

.PARAMETER Monitor
Monitor selection: 0=default, -1=discard, -2=secondary monitor.

.EXAMPLE
Open-AllPossibleQueries -Queries "powershell scripting" -Monitor 0

.EXAMPLE
qq "https://github.com" -m -1
#>
function Open-AllPossibleQueries {

    [CmdletBinding()]
    [Alias("qq")]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]

    param(
        ########################################################################
        [Alias("q", "Value", "Name", "Text", "Query")]
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The query to execute.'
        )]
        [string[]] $Queries,
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
            Position = 2,
            HelpMessage = "The language of the returned search results"
        )]
        [string] $Language,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Opens in incognito/private browsing mode"
        )]
        [Alias("incognito", "inprivate")]
        [switch] $Private,

        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Force enable debugging port, stopping existing browsers if needed"
        )]
        [switch] $Force,

        ###############################################################################
        [Alias("e")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Opens in Microsoft Edge"
        )]
        [switch] $Edge,

        ###############################################################################
        [Alias("ch")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Opens in Google Chrome"
        )]
        [switch] $Chrome,
        ###############################################################################
        [Alias("c")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Opens in Microsoft Edge or Google Chrome, depending on what the default browser is"
        )]
        [switch] $Chromium,

        ###############################################################################
        [Alias("ff")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Opens in Firefox"
        )]
        [switch] $Firefox,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Opens in all registered modern browsers"
        )]
        [switch] $All,

        ###############################################################################
        [Alias("m", "mon")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to -1, no positioning"
        )]
        [int] $Monitor = -1,
        ###############################################################################
        [Alias("fs", "f")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Opens in fullscreen mode"
        )]
        [switch] $FullScreen,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The initial width of the webbrowser window"
        )]
        [int] $Width = -1,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The initial height of the webbrowser window"
        )]
        [int] $Height = -1,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The initial X position of the webbrowser window"
        )]
        [int] $X = -999999,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "The initial Y position of the webbrowser window"
        )]
        [int] $Y = -999999,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place browser window on the left side of the screen"
        )]
        [switch] $Left,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place browser window on the right side of the screen"
        )]
        [switch] $Right,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place browser window on the top side of the screen"
        )]
        [switch] $Top,

        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place browser window on the bottom side of the screen"
        )]
        [switch] $Bottom,

        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Place browser window in the center of the screen"
        )]
        [switch] $Centered,

        ###############################################################################
        [Alias("a", "app", "appmode")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode,

        ###############################################################################
        [Alias("de", "ne", "NoExtensions")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Prevent loading of browser extensions"
        )]
        [switch] $NoBrowserExtensions,

        ###############################################################################
        [Alias("lang", "locale")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Set the browser accept-lang http header"
        )]
        [string] $AcceptLang = $null,

        ###############################################################################
        [Alias("bg")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Restore PowerShell window focus"
        )]
        [switch] $RestoreFocus,

        ###############################################################################
        [Alias("nw", "new")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't re-use existing browser window, instead, create a new one"
        )]
        [switch] $NewWindow,

        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Returns a [System.Diagnostics.Process] object of the browserprocess"
        )]
        [switch] $PassThru,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't open webbrowser, just return the url"
        )]
        [switch] $ReturnURL,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "After opening webbrowser, return the url"
        )]
        [switch] $ReturnOnlyURL
        ########################################################################
    )

    begin {
        Microsoft.PowerShell.Utility\Write-Verbose "Initializing query handler"

        # prepare parameters for Open-Webbrowser
        if (-not $PSBoundParameters.ContainsKey("Queries")) {

            $null = $PSBoundParameters.Add("Queries", $Queries)
        }
        if (-not $PSBoundParameters.ContainsKey("Query")) {

            $null = $PSBoundParameters.Add("Query", $null)
        }
    }


process {

        # process each search query
        foreach ($query in $Queries) {

            $PSBoundParameters["Queries"] = @($query)
            $PSBoundParameters["Query"] = $query

            try {
                # attempt to parse query as uri
                [Uri] $uri = $null
                $queryTrimmed = $query.Trim('"').Trim("'")

                # check if query is a valid uri
                $isUri = (
                    [Uri]::TryCreate($queryTrimmed, "absolute", [ref] $uri) -or (
                        $query.ToLowerInvariant().StartsWith("www.") -and
                        [Uri]::TryCreate("https://$queryTrimmed", "absolute",
                            [ref] $uri)
                    )
                ) -and $uri.IsWellFormedOriginalString() -and $uri.Scheme -like "http*"

                if ($isUri) {

                    # process uri queries
                    Microsoft.PowerShell.Core\Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
                    Microsoft.PowerShell.Core\ForEach-Object "$($_.ModuleName)\$($_.Name)" |
                    Microsoft.PowerShell.Core\ForEach-Object {

                        if ($PSItem -like "Open-WebsiteAndPerformQuery") {
                            return
                        }

                        if ($PSItem.EndsWith("SiteInfo") -and $PSItem.StartsWith("Open-")) {

                            # execute host-based query
                            $null = & $PSItem $uri.DnsSafeHost

                            # process full url if not host-only query
                            if (-not $PSItem.EndsWith("HostSiteInfo")) {

                                $safeUrl = $query.Split("#")[0]
                                if ($uri.Query.Length -gt 0) {
                                    $safeUrl = $safeUrl.Replace($uri.Query, "")
                                }

                                if (-not $PSBoundParameters.ContainsKey("Url")) {
                                    $null = $PSBoundParameters.Add("Url",
                                        $safeUrl)
                                }
                                else {
                                    $PSBoundParameters["Url"] = $safeUrl
                                }

                                try {
                                    $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                                        -BoundParameters $PSBoundParameters `
                                        -FunctionName $PSItem `
                                        -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable -Scope Local -Name * -ErrorAction SilentlyContinue)
                                    & $PSItem @invocationParams
                                }
                                catch {
                                    Microsoft.PowerShell.Utility\Write-Warning @"
Error: $($PSItem.Exception)
At: $($PSItem.InvocationInfo.PositionMessage)
Line: $($PSItem.InvocationInfo.Line)
"@
                                }
                            }
                        }
                    }
                    return
                }
            }
            catch {
                throw
            }

            Microsoft.PowerShell.Core\Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
            Microsoft.PowerShell.Core\ForEach-Object "$($_.ModuleName)\$($_.Name)" |
            Microsoft.PowerShell.Core\ForEach-Object {

                if ($PSItem -like "Open-WebsiteAndPerformQuery") { return }
                if ($PSItem -like "Open-Query") { return }

                if ($PSItem.EndsWith("Query") -and
                    $PSItem.StartsWith("Open-")) {

                    $query = $query.Replace("`"", "```"");
                    try {

                        $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                            -BoundParameters $PSBoundParameters `
                            -FunctionName $PSItem `
                            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable -Scope Local -Name * -ErrorAction SilentlyContinue)

                        & $PSItem @invocationParams
                    }
                    Catch {
                        Microsoft.PowerShell.Utility\Write-Warning @"
Error: $($PSItem.Exception)
At: $($PSItem.InvocationInfo.PositionMessage)
Line: $($PSItem.InvocationInfo.Line)
"@
                    }
                }
            }
        }
    }

    end {
        Microsoft.PowerShell.Utility\Write-Verbose "Completed processing all queries"
    }
}