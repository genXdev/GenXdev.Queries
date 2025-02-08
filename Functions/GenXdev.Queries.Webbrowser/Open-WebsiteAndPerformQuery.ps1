################################################################################
<#
.SYNOPSIS
Opens a webpage in a webbrowser and performs one or more queries.

.DESCRIPTION
Opens a website by URL in the default web browser, enters one or more queries
and submits them. Supports monitor selection and window positioning.

.PARAMETER Url
The URL of the website to open.

.PARAMETER Query
One or more queries to perform on the opened website.

.PARAMETER Monitor
The monitor to display the browser on. 0 = default, -1 = discard,
-2 = configured secondary monitor.

.EXAMPLE
Open-WebsiteAndPerformQuery -Url "https://www.google.com" -Query "PowerShell"

.EXAMPLE
owaq google.com "PowerShell tutorials" -Monitor 0
#>
function Open-WebsiteAndPerformQuery {

    [CmdletBinding()]
    [Alias("owaq")]

    param(
        ########################################################################
        [Alias("u", "uri", "link", "address", "site")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The URL of the website to open"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $Url,
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 1,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The queries to perform"
        )]
        [ValidateNotNullOrEmpty()]
        [string] $Query,
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
        [switch] $PassThru
    )


    begin {

        if (-not $PSBoundParameters.ContainsKey("PassThru")) {

            $null = $PSBoundParameters.Add("PassThru", $true);
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

            $null = $PSBoundParameters.Add("Monitor", $Monitor);
        }

        if (-not $PSBoundParameters.ContainsKey("PassThru")) {

            $null = $PSBoundParameters.Add("PassThru", $true);
        }
        else {

            $PSBoundParameters["PassThru"] = $true
        }

        if ($PSBoundParameters.ContainsKey("Query")) {

            $null = $PSBoundParameters.Remove("Query");
        }

        if (-not $PSBoundParameters.ContainsKey("RestoreFocus")) {

            $null = $PSBoundParameters.Add("RestoreFocus", $false)
        }
        else {

            $PSBoundParameters["RestoreFocus"] = $false;
        }
    }

    process {

        $process = Open-Webbrowser @PSBoundParameters | Select-Object -First 1

        Start-Sleep 6 | Out-Null

        if ($null -ne $process) {

            # [Console]::WriteLine("Process found: {0}", $p.Id)
            Set-ForegroundWindow ($process.MainWindowHandle) | Out-Null
            Send-Keys -Keys $Query -Escape -ShiftEnter
        }
        else {

            # [Console]::WriteLine("No Process found");
            Send-Keys -Keys $Query -Escape -ShiftEnter
        }

        Send-Keys "{ENTER}";

        if ($PassThru) {

            return $process
        }
    }

    end {
        if ($RestoreFocus) {

            try {
                $pw = Get-PowershellMainWindow

                $pw.SetForegroundWindow()

                $null = Set-ForegroundWindow -WindowHandle $pw.MainWindowHandle
            }
            catch {

                Write-Warning "Failed to restore focus to PowerShell window"
            }
        }
    }
}
################################################################################
