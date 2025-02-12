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

        Write-Verbose "Initializing query handler"

        # prepare parameters for Open-Webbrowser
        $null = $PSBoundParameters.Remove("Queries")

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

            $null = $PSBoundParameters.Add("Monitor", $Monitor)
        }

        if ($PSBoundParameters.ContainsKey("ReturnUrl")) {

            $null = $PSBoundParameters.Remove("ReturnUrl")
        }
    }

    process {

        # process each search query
        foreach ($query in $Queries) {

            try {
                # attempt to parse query as uri
                [Uri] $uri = $null
                $queryTrimmed = $query.Trim('"').Trim("'")

                # check if query is a valid uri
                $isUri = (
                    [Uri]::TryCreate($queryTrimmed, "absolute", [ref] $uri) -or (
                        $query.ToLowerInvariant().StartsWith("www.") -and
                        [Uri]::TryCreate("http://$queryTrimmed", "absolute",
                            [ref] $uri)
                    )
                ) -and $uri.IsWellFormedOriginalString() -and
                    $uri.Scheme -like "http*"

                if ($isUri) {
                    # process uri queries
                    Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
                        ForEach-Object Name |
                        ForEach-Object {

                            if ($PSItem -like "Open-WebsiteAndPerformQuery") {
                                return
                            }

                            if ($PSItem.EndsWith("SiteInfo") -and
                                $PSItem.StartsWith("Open-")) {

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
                                        & $PSItem @PSBoundParameters
                                    }
                                    catch {
                                        Write-Warning @"
Error: $($PSItem.Exception)
At: $($PSItem.InvocationInfo.PositionMessage)
Line: $($PSItem.InvocationInfo.Line)
"@
                                    }
                                    $null = $PSBoundParameters.Remove("Url")
                                }
                            }
                        }
                    return
                }
            }
            catch {
                throw
            }


            if ($PSBoundParameters.ContainsKey("Url")) {

                $PSBoundParameters.Remove("Url") | Out-Null;
            }

            Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
                ForEach-Object Name |
                ForEach-Object {

                    if ($PSItem -like "Open-WebsiteAndPerformQuery") { return }

                    if ($PSItem.EndsWith("Query") -and
                        $PSItem.StartsWith("Open-")) {

                    $Query = $Query.Replace("`"", "```"");
                    try {
                        if ($PSBoundParameters.ContainsKey("Queries")) {

                            $PSBoundParameters.Remove("Queries") | Out-Null;
                        }

                        if (-not $PSBoundParameters.ContainsKey("Query")) {

                            $null = $PSBoundParameters.Add("Query", $Query)
                        }
                        else {

                            $PSBoundParameters["Query"] = $Query
                        }

                        & $PSItem @PSBoundParameters

                        $PSBoundParameters.Remove("Queries") | Out-Null;
                    }
                    Catch {
                        Write-Warning @"
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
        Write-Verbose "Completed processing all queries"
    }
}
