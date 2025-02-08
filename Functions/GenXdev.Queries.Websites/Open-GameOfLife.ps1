################################################################################
<#
.SYNOPSIS
Opens Conway's Game of Life simulation in a web browser.

.DESCRIPTION
Opens an interactive Conway's Game of Life simulation in a web browser window.
Supports monitor selection and provides options for URL handling.

.PARAMETER Monitor
The monitor to display the game on.
0 = default monitor
-1 = discard display
-2 = configured secondary monitor

.PARAMETER ReturnURL
When specified, returns the URL without opening the browser.

.PARAMETER ReturnOnlyURL
When specified, opens the browser and also returns the URL.

.EXAMPLE
Open-GameOfLife -Monitor 1

.EXAMPLE
gameoflife
#>
function Open-GameOfLife {

    [CmdletBinding()]
    [Alias("gameoflife", "conway")]

    param(
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
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to `Global:DefaultSecondaryMonitor or 2 if not found"
        )]
        [int] $Monitor = -2,

        ###############################################################################
        [Alias("nfs", "nf")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't open in fullscreen mode"
        )]
        [switch] $NoFullScreen,

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
        [Alias("na", "napp", "noappmode")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Do show the browser controls"
        )]
        [switch] $NoApplicationMode,

        ###############################################################################
        [Alias("ext", "Extensions")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't prevent loading of browser extensions"
        )]
        [switch] $BrowserExtensions,

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
            HelpMessage = "Don't start a new game, just watch the AI play"
        )]
        [switch] $SpectateOnly,
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

        Write-Verbose "Initializing Game of Life launcher"
        $url = "https://conway.genxdev.net/"
    }

    process {

        # handle return url only scenario
        if ($ReturnOnlyURL) {
            Write-Output $url
            return
        }

        if (-not $PSBoundParameters.ContainsKey("NoApplicationMode")) {

            $null = $PSBoundParameters.Add("ApplicationMode", $true);

            if (-not $PSBoundParameters.ContainsKey("NewWindow")) {

                $null = $PSBoundParameters.Add("-NewWindow", $true);
            }

            if (-not $PSBoundParameters.ContainsKey("FullScreen")) {

                $null = $PSBoundParameters.Add("FullScreen", $true);
            }
        }

        if ($PSBoundParameters.ContainsKey("NoFullScreen")) {

            $null = $PSBoundParameters.Remove("NoFullScreen") | Out-Null;
        }
        if ($PSBoundParameters.ContainsKey("NoFullScreen")) {

            $null = $PSBoundParameters.Remove("NoFullScreen") | Out-Null;
        }
        if ($PSBoundParameters.ContainsKey("NoApplicationMode")) {

            $null = $PSBoundParameters.Remove("NoApplicationMode")
        }

        if (-not $PSBoundParameters.ContainsKey("BrowserExtensions")) {

            $PSBoundParameters.Add("NoBrowserExtensions", $true);
        }
        else {

            $null = $PSBoundParameters.Remove("BrowserExtensions")
        }

        if ($PSBoundParameters.ContainsKey("ReturnUrl")) {

            $null = $PSBoundParameters.Remove("ReturnUrl")
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $null = $PSBoundParameters.Add("Url", $url)
        }

        # launch browser
        Open-Webbrowser @PSBoundParameters

        # return url if requested
        if ($ReturnURL) {

            Write-Output $url
        }
    }

    end {
    }
}
################################################################################
