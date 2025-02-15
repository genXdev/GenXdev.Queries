################################################################################

<#
.SYNOPSIS
Opens and controls YouTube videos in a browser window with keyboard shortcuts.

.DESCRIPTION
Opens YouTube videos matching search terms or from various YouTube sections in a
browser window. Provides keyboard controls for video playback and navigation.

.PARAMETER Queries
YouTube search terms to find videos for. Opens all videos matching each term.

.PARAMETER Subscriptions
Opens all videos from subscribed channels.

.PARAMETER WatchLater
Opens all videos from the watch-later playlist.

.PARAMETER Recommended
Opens all recommended videos from YouTube homepage.

.PARAMETER Trending
Opens all currently trending videos on YouTube.

.PARAMETER Edge
Use Microsoft Edge browser instead of default.

.PARAMETER Chrome
Use Google Chrome browser instead of default.

.EXAMPLE
Open-AllYoutubeVideos -Queries "PowerShell tutorial","vscode tips" -Edge

.EXAMPLE
qvideos "PowerShell tutorial" -e
#>
function Open-AllYoutubeVideos {

    [CmdletBinding()]
    [Alias("qvideos", "qyt")]
    param(
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "YouTube search terms to find videos"
        )]
        [Alias("q", "Value", "Name", "Text", "Query")]
        [string[]] $Queries = @(""),
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Open videos from subscribed channels"
        )]
        [switch] $Subscriptions,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Open videos from watch later playlist"
        )]
        [switch] $WatchLater,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Open recommended videos"
        )]
        [switch] $Recommended,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Open trending videos"
        )]
        [switch] $Trending,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Opens in incognito/private browsing mode"
        )]
        [Alias("incognito", "inprivate")]
        [switch] $Private,

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
        [Alias("lang", "locale")]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Set the browser accept-lang http header"
        )]
        [string] $AcceptLang = $null
        ########################################################################
    )

    begin {
        # tracks which video was last displayed to avoid redrawing unchanged content
        $lastVideo = ""

        # obtain main powershell window handle for proper window positioning
        $powershellProcess = Get-PowershellMainWindowProcess
        $powershellWindow = [GenXdev.Helpers.WindowObj]::GetMainWindow($powershellProcess)

        Write-Verbose "Starting YouTube video browser"

        $boundParams = $PSBoundParameters
    }

    process {
        # determine if we're working with current tab or need to open new one
        [bool] $currentTab = ($Recommended -ne $true) -and
            ($Subscriptions -ne $true) -and
            ($Trending -ne $true) -and
            ($WatchLater -ne $true) -and
            (($Queries.Count -eq 0) -or [String]::IsNullOrWhiteSpace($queries[0]))

        # internal function that handles video navigation and control interface
        function go($Url = $null, $Query) {

            # initialize state tracking for current video session
            $Global:data = @{
                query          = $Query
                urls           = @()
                description    = ""
                title          = ""
                subscribeTitle = ""
                playing        = $true
                duration       = 0
                position       = 0
            }

            # detect and configure multi-monitor setup
            $AllScreens = @([WpfScreenHelper.Screen]::AllScreens | ForEach-Object { $PSItem })

            # get console dimensions for UI layout
            $hostInfo = & { $H = Get-Host; $H.ui.rawui }
            $size = "$($hostInfo.WindowSize.Width)x$($hostInfo.WindowSize.Height)"

            Clear-Host
            Write-Host "Hold on.. launching query".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
            $browser = $null;

            if (-not $currentTab) {

                if ($PowershellWindow.Count -gt 0) {

                    $PowershellScreen = [WpfScreenHelper.Screen]::FromPoint(@{X = $PowershellWindow.Position().X; Y = $PowershellWindow.Position().Y });
                    $PowershellScreenIndex = $AllScreens.IndexOf($PowershellScreen) + 1;

                    [int] $defaultMonitor = 1;

                    if ($Monitor -eq -2) {

                        if ([int]::TryParse($Global:DefaultSecondaryMonitor, [ref] $defaultMonitor)) {

                            $Monitor = $defaultMonitor % ($AllScreens.Length + 1);
                        }
                        else {

                            $Monitor = 2 % ($AllScreens.AllScreens.Length + 1);
                        }
                    }

                    if ($monitor -lt 1) {

                        if ($monitor -lt 0) {

                            $monitor = $PowershellWindow;
                        }
                        else {

                            $monitor = $AllScreens.IndexOf([WpfScreenHelper.Screen]::PrimaryScreen) + 1;
                        }
                    }

                    if ($PowershellScreenIndex -eq $Monitor) {

                        if ($PowershellScreen.WorkingArea.Width -gt $PowershellScreen.WorkingArea.Height) {

                            Set-WindowPosition -Left -Monitor $Monitor
                            $FullScreen = $true
                            $invocationParams = Copy-IdenticalParamValues `
                                -BoundParameters $boundParams `
                                -FunctionName "Open-Webbrowser" `
                                -DefaultValues @(Get-Variable -Scope Local -Name * -ErrorAction SilentlyContinue)
                            $invocationParams.Chromium = $true
                            $invocationParams.Url = $Url
                            $invocationParams.PassThru = $true
                            $invocationParams.Force = $true
                            $invocationParams.NewWindow = $true
                            $invocationParams.RestoreFocus = $true
                            $invocationParams.Right = $true
                            $invocationParams.NoBrowserExtensions = $true
                            $browser = Open-Webbrowser @invocationParams
                            $null = Start-Sleep 1
                            $Global:chrome = $null
                        }
                        else {

                            Set-WindowPosition -Bottom -Monitor $Monitor
                            $invocationParams = Copy-IdenticalParamValues `
                                -BoundParameters $boundParams `
                                -FunctionName "Open-Webbrowser" `
                                -DefaultValues @(Get-Variable -Scope Local -Name * -ErrorAction SilentlyContinue)
                            $invocationParams.Chromium = $true
                            $invocationParams.Url = $Url
                            $invocationParams.PassThru = $true
                            $invocationParams.Force = $true
                            $invocationParams.NewWindow = $true
                            $invocationParams.RestoreFocus = $true
                            $invocationParams.Top = $true
                            $invocationParams.NoBrowserExtensions = $true
                            $browser = Open-Webbrowser @invocationParams
                            $null = Start-Sleep 1
                            $Global:chrome = $null
                        }
                    }
                }
                try {
                    $null = Select-WebbrowserTab -Edge:$Edge -Chrome:$Chrome
                }
                catch {

                    $null = Close-Webbrowser -Chromium -Edge:$Edge -Chrome:$Chrome -Force
                }

                if ($null -eq $browser) {

                    $FullScreen = $false
                    $invocationParams = Copy-IdenticalParamValues `
                        -BoundParameters $boundParams `
                        -FunctionName "Open-Webbrowser" `
                        -DefaultValues @(Get-Variable -Scope Local -Name * -ErrorAction SilentlyContinue)
                    $invocationParams.Chromium = $true
                    $invocationParams.Url = $Url
                    $invocationParams.PassThru = $true
                    $invocationParams.Force = $true
                    $invocationParams.NewWindow = $true
                    $invocationParams.RestoreFocus = $false
                    $invocationParams.NoBrowserExtensions = $true
                    $browser = Open-Webbrowser @invocationParams
                    $null = Start-Sleep 1

                    # restore it
                    $PowerShellWindow = Get-PowershellMainWindow

                    if ($null -ne $PowerShellWindow) {

                        # wait a little
                        [System.Threading.Thread]::Sleep(500) | Out-Null

                        $PowerShellWindow.Show() | Out-Null;
                        $PowerShellWindow.SetForeground() | Out-Null;

                        Set-ForegroundWindow ($PowerShellWindow.Handle) | Out-Null;
                    }

                    $Global:chrome = $null
                }

                try {
                    $null = Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome
                    $ChromeSessions | ForEach-Object { Select-WebbrowserTab -ByReference $_; Get-WebbrowserTabDomNodes "video" "e.pause()" }
                }
                catch {

                }

                $null = Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome
            }
            else {
                $Global:chrome = $null
                $null = Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome
                $null = Stop-WebbrowserVideos;
            }

            # loads and executes the JavaScript controller code
            $job = [System.IO.File]::ReadAllText("$PSScriptRoot\..\..\Open-AllYoutubeVideos.js")

            # track scroll positions for header animations
            [int] $scrollPosition = -1
            [int] $scrollPosition2 = -1

            # get chrome automation interfaces
            $page = $Global:chromeController
            $reference = Get-ChromiumSessionReference

            # handles asynchronous tab opening and video pausing
            function checkOpened() {

                $opened = $false

                try {
                    $i = 0
                    if ($null -ne $Global:data.open) {
                        $Global:data.open | ForEach-Object {
                            $i++
                            $opened = $true
                            $page = $page.Context.NewPageAsync().GetAwaiter().GetResult()
                            $null = $page.GoToAsync($PSItem).GetAwaiter().GetResult()
                            try {
                                $null = Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome -Force
                                $reference = Get-ChromiumSessionReference
                                $page = $Global:chromeController
                                $null = Invoke-WebbrowserEvaluation "$job"
                                $null = Get-WebbrowserTabDomNodes "video" "e.pause()"
                            }
                            catch {
                                Write-Warning "Error in checkOpened: $_"
                            }
                        }
                    }

                }
                catch {

                    Write-Warning "Error in checkOpened: $_"
                }

                if ($opened) {

                    $Global:data.open = @();
                    $null = Set-ForegroundWindow ($powershellWindow.handle)
                }
            }

            # main event loop - handles UI updates and keyboard input
            while ((-not $completed) -and ($null -ne $page) -and ($null -ne $reference)) {

                try {
                    # reset cursor position and colors for status line
                    $hostInfo = & { $H = Get-Host; $H.ui.rawui }
                    [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2)
                    [Console]::ResetColor()

                    # execute JavaScript controller code
                    $null = Invoke-WebbrowserEvaluation "$job;" -Page $Page -ByReference $reference

                    # process any pending tab operations
                    checkOpened
                    if ($Global:data.isViewPage -and $Global:data.position -gt 0 -and ($Global:data.position -gt $Global:data.duration - 2)) {

                        [Console]::SetCursorPosition(0, 0)
                        Write-Host "Skipping to next video".PadRight($hostInfo.WindowSize.Width - 2, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                        [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2)
                        $Page.CloseAsync().Wait()
                        $null = Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome
                        $page = $Global:chromeController
                        $reference = Get-ChromiumSessionReference
                        $LastVideo = ""
                        [Console]::SetCursorPosition(0, 0)
                        Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                        continue
                    }

                    if ($completed) { return }

                    try {

                        # handle console window resizing
                        $newsize = "$($hostInfo.WindowSize.Width)x$($hostInfo.WindowSize.Height)"
                        if ($newsize -ne $size) {
                            $size = $newsize
                            $LastVideo = $null
                        }

                        # construct and display control header
                        $sub = ""
                        $pause = " [P]ause | "
                        $header = "[Q]uit | $sub$pause SPACE=Next | S = $(($data.subscribeTitle)) | F = Toggle fullscreen | [0]..[9] = skip | ◀ -20s | +20s ▶ | ".PadRight($hostInfo.WindowSize.Width, " ")

                        if ($header.Length -gt $hostInfo.WindowSize.Width) {

                            $scrollPosition = ($scrollPosition + 1) % $header.length
                            try {
                                $header = "$header $header".Substring($scrollPosition, $hostInfo.WindowSize.Width)
                            }
                            catch {
                                try {
                                    $header = "$header $header".Substring(0, $hostInfo.WindowSize.Width)
                                }
                                catch {
                                }
                            }
                        }

                        $scrollPosition = -1
                        $scrollPosition2 = -1
                        $videoInfo = "$($Global:data.title)$($Global:data.description)"

                        if ($videoInfo -ne $LastVideo) {

                            if ($Global:data.isViewPage) {

                                if (-not $Global:data.playing) {

                                    [Console]::SetCursorPosition(0, 0)
                                    Write-Host "Starting video playback".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                    $LastVideo = ""
                                    $null = Invoke-WebbrowserEvaluation "$job;resumeVideo();" -Page $Page -ByReference $reference | Out-Null
                                    $null = Start-Sleep 1
                                    checkOpened
                                }
                            }
                            else {
                                [Console]::SetCursorPosition(0, 0)
                                Write-Host "Scanning for videos".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                $LastVideo = ""
                                $null = Invoke-WebbrowserEvaluation "$job;pageScanned = false; scanPageForLinks();" -Page $Page -ByReference $reference | Out-Null
                                $null = Start-Sleep 1
                                checkOpened
                            }

                            Clear-Host
                            Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                            $header = "$($Global:data.title)".Replace("`r", "").Replace("`n", "`r").Replace("`t", " ").Trim().PadRight($hostInfo.WindowSize.Width, " ")
                            if ($header.Length -gt $hostInfo.WindowSize.Width) {

                                $scrollPosition2 = ($scrollPosition2 + 1) % $header.length
                                try {
                                    $header = "$header $header".Substring($scrollPosition, $hostInfo.WindowSize.Width)
                                }
                                catch {
                                    try {
                                        $header = "$header $header".Substring(0, $hostInfo.WindowSize.Width)
                                    }
                                    catch {
                                    }
                                }
                            }

                            Write-Host $header -ForegroundColor ([ConsoleColor]::black) -BackgroundColor ([ConsoleColor]::Gray)
                            [int] $nn = 0

                            if ($Global:data.description.Contains("\n1")) {

                                $Global:data.description = "loading.."
                            }

                            $txt = "$($Global:data.description)".Replace("Show less", "").Replace("Show more", "").Replace("`r", "").Replace("`n", "`r").Replace("`t", " ").Trim()
                            Write-Host ((($txt -Split "`r"  | ForEach-Object -ErrorAction SilentlyContinue {
                                            if ([string]::IsNullOrWhiteSpace($PSItem)) {
                                                $nn = $nn + 1
                                            }
                                            else {
                                                $nn = 0
                                            }
                                            if ($nn -lt 2) {
                                                $s = $PSItem.Trim()
                                                for ([int] $i = $hostInfo.WindowSize.Width - 1; $i -lt $s.length - 1; $i += $hostInfo.WindowSize.Width - 3) {

                                                    $s = $s.substring(0, $i) + "`r" + $s.substring($i)
                                                }

                                                $s
                                            }
                                        }
                                    ) -Join "`r" -Split "`r" | Select-Object -First ($hostInfo.WindowSize.Height - 3)) -Join "`r`n")

                            $LastVideo = $videoInfo
                        }

                        [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 1)
                        [Console]::BackgroundColor = [ConsoleColor]::Blue
                        [Console]::ForegroundColor = [ConsoleColor]::Yellow
                        try { [Console]::Write([System.TimeSpan]::FromSeconds([Math]::Round($Global:data.Position, 0)).ToString()) } catch {}
                        [Console]::SetCursorPosition($hostInfo.WindowSize.Width - 9, $hostInfo.WindowSize.Height - 1)
                        try { [Console]::Write([System.TimeSpan]::FromSeconds([Math]::Round($Global:data.Duration - $Global:data.Position, 0)).ToString()) } catch {}
                        $hostInfo = & { $H = Get-Host; $H.ui.rawui }
                        [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2)
                        [Console]::ResetColor()

                        # process keyboard input when available
                        while ([Console]::KeyAvailable) {

                            [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2)
                            $c = [Console]::ReadKey()

                            switch ("$($c.KeyChar)".ToLowerInvariant()) {

                                "q" {
                                    $completed = $true
                                    [Console]::SetCursorPosition(0, 0)
                                    Write-Host "Quiting..".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                    if ($null -ne $browser) {

                                        $browser.CloseMainWindow() | Out-Null
                                    }
                                    return
                                }

                                " " {

                                    [Console]::SetCursorPosition(0, 0)
                                    Write-Host "Skipping to next video".PadRight($hostInfo.WindowSize.Width - 2, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                    [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2)
                                    $Page.CloseAsync().Wait()
                                    $null = Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome
                                    $page = $Global:chromeController
                                    $reference = Get-ChromiumSessionReference
                                    $LastVideo = ""
                                    [Console]::SetCursorPosition(0, 0)
                                    Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                    continue
                                }

                                "s" {

                                    [Console]::SetCursorPosition(0, 0)
                                    Write-Host "Toggling subscription".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                    $null = Invoke-WebbrowserEvaluation "$job;await toggleSubscribeToChannel();" -Page $Page -ByReference $reference | Out-Null
                                    $null = Start-Sleep 1
                                    checkOpened
                                    [Console]::SetCursorPosition(0, 0)
                                    Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)

                                    break;
                                }

                                "f" {

                                    [Console]::SetCursorPosition(0, 0)
                                    Write-Host "Toggling fullscreen".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                    $null = Invoke-WebbrowserEvaluation "$job;await toggleFullscreenVideo();" -Page $Page -ByReference $reference | Out-Null
                                    $null = Start-Sleep 1
                                    checkOpened
                                    [Console]::SetCursorPosition(0, 0)
                                    Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)

                                    break;
                                }

                                "p" {

                                    [Console]::SetCursorPosition(0, 0)
                                    Write-Host "Toggling pause video".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                    $LastVideo = ""
                                    $null = Invoke-WebbrowserEvaluation "$job;await togglePauseVideo();" -Page $Page -ByReference $reference | Out-Null
                                    $null = Start-Sleep 1
                                    checkOpened
                                    [Console]::SetCursorPosition(0, 0)
                                    Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)

                                    break;
                                }

                                default {

                                    [int] $n = 0
                                    if ([int]::TryParse("$($c.KeyChar)", [ref] $n)) {

                                        [Console]::SetCursorPosition(0, 0)
                                        Write-Host "Skipping to position".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                        $null = Invoke-WebbrowserEvaluation "$job;await setVideoPosition($n);" -Page $Page -ByReference $reference | Out-Null
                                        $null = Start-Sleep 1
                                        checkOpened
                                        [Console]::SetCursorPosition(0, 0)
                                        Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                    }
                                    else {
                                        if ($c.Key -eq [ConsoleKey]::RightArrow) {

                                            [Console]::SetCursorPosition(0, 0)
                                            Write-Host "Skipping 20 seconds forward".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                            $null = Invoke-WebbrowserEvaluation "$job;await forwardInVideo();" -Page $Page -ByReference $reference | Out-Null
                                            $null = Start-Sleep 1
                                            checkOpened
                                            [Console]::SetCursorPosition(0, 0)
                                            Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                        }
                                        else {
                                            if ($c.Key -eq [ConsoleKey]::LeftArrow) {

                                                [Console]::SetCursorPosition(0, 0)
                                                Write-Host "Skipping 20 seconds backwards".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                                $null = Invoke-WebbrowserEvaluation "$job;await backwardsInVideo();" -Page $Page -ByReference $reference | Out-Null
                                                $null = Start-Sleep 1
                                                checkOpened
                                                [Console]::SetCursorPosition(0, 0)
                                                Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                            }
                                        }
                                    }

                                    break;
                                }
                            }
                        }
                    }
                    catch {

                        if ($LastVideo -ne "") {
                            $completed = $true
                            return
                        }
                    }

                    # refresh chrome automation interfaces
                    $hostInfo = & { $H = Get-Host; $H.ui.rawui }
                    [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2)
                    [Console]::ResetColor()
                    $null = Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome
                    $page = $Global:chromeController
                    $reference = Get-ChromiumSessionReference

                    # verify chrome session is still active
                    if ((@($Global:chromeSessions).Count -eq 0) -or ($null -eq $Global:chrome)) {
                        throw "No active session"
                    }
                }
                catch {

                    $completed = $true
                }
            }
        }

        try {
            # handle different video source scenarios based on parameters
            if ($currentTab) {
                go
                return
            }

            # process search queries if provided
            if ($Queries.Count -gt 0) {
                foreach ($Query in $Queries) {
                    if ([string]::IsNullOrWhiteSpace($Query) -eq $false) {
                        go "https://www.youtube.com/results?search_query=$([Uri]::EscapeUriString($query))" $Query
                    }
                }
            }

            # handle special feed types
            if ($Subscriptions -eq $true) {
                go "https://www.youtube.com/feed/subscriptions"
            }

            if ($Recommended -eq $true) {
                go "https://www.youtube.com/"
            }

            if ($WatchLater -eq $true) {
                go "https://www.youtube.com/playlist?list=WL"
            }

            if ($Trending -eq $true) {
                go "https://www.youtube.com/feed/trending"
            }
        }
        finally {
            Clear-Host
        }
    }

    end {
        Write-Verbose "YouTube video browser session ended"
    }
}

################################################################################
