################################################################################
<#
.SYNOPSIS
Opens a viral simulation game in a web browser.

.DESCRIPTION
Opens the viral simulation game in a specified web browser with configurable
window settings. Supports multiple browsers and various display options.

.PARAMETER Private
Opens in incognito/private browsing mode.

.PARAMETER Force
Force enable debugging port, stopping existing browsers if needed.

.PARAMETER Edge
Opens in Microsoft Edge.

.PARAMETER Chrome
Opens in Google Chrome.

.PARAMETER Chromium
Opens in Microsoft Edge or Google Chrome, depending on default browser.

.PARAMETER Firefox
Opens in Firefox.

.PARAMETER All
Opens in all registered modern browsers.

.PARAMETER Monitor
The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor.

.PARAMETER NoFullScreen
Don't open in fullscreen mode.

.PARAMETER Width
The initial width of the webbrowser window.

.PARAMETER Height
The initial height of the webbrowser window.

.PARAMETER X
The initial X position of the webbrowser window.

.PARAMETER Y
The initial Y position of the webbrowser window.

.PARAMETER Left
Place browser window on the left side of the screen.

.PARAMETER Right
Place browser window on the right side of the screen.

.PARAMETER Top
Place browser window on the top side of the screen.

.PARAMETER Bottom
Place browser window on the bottom side of the screen.

.PARAMETER Centered
Place browser window in the center of the screen.

.PARAMETER NoApplicationMode
Do show the browser controls.

.PARAMETER BrowserExtensions
Don't prevent loading of browser extensions.

.PARAMETER AcceptLang
Set the browser accept-lang http header.

.PARAMETER RestoreFocus
Restore PowerShell window focus.

.PARAMETER NewWindow
Don't re-use existing browser window, create a new one.

.PARAMETER PassThru
Returns a [System.Diagnostics.Process] object of the browserprocess.

.PARAMETER SpectateOnly
Don't start a new game, just watch the AI play.

.PARAMETER ReturnURL
Don't open webbrowser, just return the url.

.PARAMETER ReturnOnlyURL
After opening webbrowser, return the url.

.EXAMPLE
Open-ViralSimulation -Chrome -Private -NoFullScreen

.EXAMPLE
viral -ch -incognito -nfs
#>
function Open-ViralSimulation {

    [CmdletBinding()]
    [Alias("viral")]

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

        Write-Verbose "Initializing viral simulation parameters"
    }

    process {

        # define the base url for the viral simulation
        $url = "https://viral.genxdev.net/"


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
