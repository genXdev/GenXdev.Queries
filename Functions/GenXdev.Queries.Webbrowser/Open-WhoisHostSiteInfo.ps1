################################################################################
<#
.SYNOPSIS
Opens a Whois host information query in a web browser.

.DESCRIPTION
Opens Whois host information queries in a web browser for domain names or IP
addresses. Supports configurable monitor selection and multiple queries.

.PARAMETER Queries
One or more domain names or IP addresses to look up Whois information for.
Accepts pipeline input.

.PARAMETER Monitor
Specifies which monitor to display results on:
0 = Default monitor
-1 = Discard
-2 = Configured secondary monitor

.EXAMPLE
Open-WhoisHostSiteInfo -Queries "example.com", "example.org" -Monitor 0

.EXAMPLE
whois example.com -m 1
#>
function Open-WhoisHostSiteInfo {

    [CmdletBinding()]
    [Alias("whois")]
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

        if (-not $PSBoundParameters.ContainsKey("Url")) {
            $null = $PSBoundParameters.Add("Url", "Url")
        }

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

            Write-Verbose "Processing query: $query"

            # construct the whois query url with escaped query string
            $PSBoundParameters["Url"] = "https://whois.domaintools.com/$([Uri]::`
                EscapeUriString($query))"

            # open search in browser with inherited parameters
            Open-Webbrowser @PSBoundParameters
        }
    }

    end {
    }
}
################################################################################
