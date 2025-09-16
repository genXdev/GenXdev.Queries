<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Open-AllYoutubeVideos.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.270.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
###############################################################################
<#
.SYNOPSIS
Opens and controls YouTube videos in a browser window with keyboard shortcuts.

.DESCRIPTION
Opens YouTube videos matching search terms or from various YouTube sections in a
browser window. Provides keyboard controls for video playback and navigation
through an interactive interface. Supports multiple browsers and various YouTube
content types including search results, subscriptions, watch later, recommended
videos, and trending content.

.PARAMETER Queries
YouTube search terms to find videos for. Opens all videos matching each search
term provided. Accepts multiple query strings to search for different topics.

.PARAMETER Subscriptions
Opens all videos from subscribed channels feed on YouTube.

.PARAMETER WatchLater
Opens all videos from the watch-later playlist.

.PARAMETER Recommended
Opens all recommended videos from YouTube homepage.

.PARAMETER Trending
Opens all currently trending videos on YouTube.

.PARAMETER Private
Opens browser in incognito/private browsing mode to prevent saving history.

.PARAMETER Edge
Use Microsoft Edge browser instead of default browser.

.PARAMETER Chrome
Use Google Chrome browser instead of default browser.

.PARAMETER NoFullScreen
Prevents opening the browser in fullscreen mode.

.PARAMETER ApplicationMode
Hide the browser controls for a cleaner viewing experience.

.PARAMETER AcceptLang
Set the browser accept-lang http header for language preferences.

.EXAMPLE
Open-AllYoutubeVideos -Queries "PowerShell tutorial","vscode tips" -Edge

.EXAMPLE
qvideos "PowerShell tutorial" -e
#>
function Open-AllYoutubeVideos {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Alias('qvideos', 'qyt')]
    param(
        ###############################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'YouTube search terms to find videos'
        )]
        [Alias('q', 'Name', 'Text', 'Query')]
        [string[]] $Queries = @(''),
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Open videos from subscribed channels'
        )]
        [switch] $Subscriptions,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Open videos from watch later playlist'
        )]
        [switch] $WatchLater,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Open recommended videos'
        )]
        [switch] $Recommended,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Open trending videos'
        )]
        [switch] $Trending,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in incognito/private browsing mode'
        )]
        [Alias('incognito', 'inprivate')]
        [switch] $Private,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Microsoft Edge'
        )]
        [Alias('e')]
        [switch] $Edge,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Google Chrome'
        )]
        [Alias('ch')]
        [switch] $Chrome,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Prevents opening in fullscreen mode'
        )]
        [Alias('nofs', 'nf')]
        [switch] $NoFullScreen,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Hide the browser controls'
        )]
        [Alias('a', 'app', 'appmode')]
        [switch] $ApplicationMode,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser accept-lang http header'
        )]
        [Alias('lang', 'locale')]
        [string] $AcceptLang = $null
    )

    begin {

        # tracks which video was last displayed to avoid redrawing unchanged content
        $lastVideo = ''

        # obtain main powershell window handle for proper window positioning
        $powershellProcess = GenXdev.Windows\Get-PowershellMainWindowProcess

        $powershellWindow = GenXdev.Windows\Get-PowershellMainWindow

        Microsoft.PowerShell.Utility\Write-Verbose 'Starting YouTube video browser'

        # store bound parameters for passing to other functions
        $boundParams = $PSBoundParameters

        try {
            # attempt to select existing browser tab
            $null = GenXdev.Webbrowser\Select-WebbrowserTab -Chrome:$chrome -Edge:$edge

            # check if browser session exists
            if ($null -eq $Global:chromeSession) {

                throw 'No active web browser session found.'
            }
        }
        catch {

            # close browser if selection fails to ensure clean state
            $null = GenXdev.Webbrowser\Close-Webbrowser -force -Chromium -Chrome:$chrome -Edge:$edge
        }
    }

    process {

        # determine if we're working with current tab or need to open new one
        [bool] $currentTab = ($Recommended -ne $true) -and
            ($Subscriptions -ne $true) -and
            ($Trending -ne $true) -and
            ($WatchLater -ne $true) -and
            (($Queries.Count -eq 0) -or [String]::IsNullOrWhiteSpace($queries[0]))

        # internal function that handles video navigation and control interface
        function goNext($Url = $null, $Query) {

            # initialize state tracking for current video session
            $Global:data = @{
                query          = $Query
                urls           = @()
                description    = ''
                title          = ''
                subscribeTitle = ''
                playing        = $true
                duration       = 0
                position       = 0
            }

            # detect and configure multi-monitor setup
            $AllScreens = @([WpfScreenHelper.Screen]::AllScreens |
                Microsoft.PowerShell.Core\ForEach-Object { $PSItem })

            # get console dimensions for UI layout
            $hostInfo = & { $H = Microsoft.PowerShell.Utility\Get-Host; $H.ui.rawui }

            $size = "$($hostInfo.WindowSize.Width)x$($hostInfo.WindowSize.Height)"

            Clear-Host

            Microsoft.PowerShell.Utility\Write-Host (
                "Hold on.. $(($currentTab ? 'connecting to existing tab' : 'initializing browser'))"
            ).PadRight($hostInfo.WindowSize.Width, ' ') -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)

            $browser = $null;

            if (-not $currentTab) {

                try {
                    # select existing browser tab if available
                    $null = GenXdev.Webbrowser\Select-WebbrowserTab -Edge:$Edge -Chrome:$Chrome
                }
                catch {

                    # close browser if tab selection fails
                    $null = GenXdev.Webbrowser\Close-Webbrowser -Chromium -Edge:$Edge -Chrome:$Chrome -Force
                }

                if ($null -eq $browser) {

                    # copy parameters for browser invocation
                    $invocationParams = GenXdev.Helpers\Copy-IdenticalParamValues `
                        -BoundParameters $boundParams `
                        -FunctionName 'GenXdev.Webbrowser\Open-Webbrowser';

                    # configure browser window settings
                    $invocationParams.FullScreen = !$NoFullScreen -and ($AllScreens.Count -ne 1)

                    $invocationParams.SideBySide = $AllScreens.Count -eq 1

                    $invocationParams.Chromium = $true

                    $invocationParams.Url = $Url

                    $invocationParams.PassThru = $true

                    $invocationParams.Force = $true

                    $invocationParams.NewWindow = $true

                    $invocationParams.RestoreFocus = $true

                    $invocationParams.NoBrowserExtensions = $true

                    $invocationParams.DisablePopupBlocker = $true

                    $invocationParams.Monitor = $AllScreens.Count -eq 1 ? 0 : -2;

                    # open new browser window with configured settings
                    $browser = GenXdev.Webbrowser\Open-Webbrowser @invocationParams

                    $null = Microsoft.PowerShell.Utility\Start-Sleep 1

                    $Global:chrome = $null
                }

                try {
                    # select youtube tab if it exists
                    $null = GenXdev.Webbrowser\Select-WebbrowserTab -Name '*youtube*' -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome

                    # pause all videos in chrome sessions
                    $ChromeSessions |
                        Microsoft.PowerShell.Core\ForEach-Object {
                            GenXdev.Webbrowser\Select-WebbrowserTab -Chrome:$Chrome -Edge:$Edge;
                            GenXdev.Webbrowser\Get-WebbrowserTabDomNodes 'video' 'e.pause()' -Page ($Global:chromeController) -ByReference:$reference -Chrome:$chrome -Edge:$Edge
                        }
                }
                catch {

                }

                # ensure youtube tab is selected
                $null = GenXdev.Webbrowser\Select-WebbrowserTab -Name '*youtube*' -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome
            }
            else {
                # use existing tab - clear chrome session and stop videos
                $Global:chrome = $null

                $null = GenXdev.Webbrowser\Select-WebbrowserTab -Name '*youtube*' -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome

                $null = GenXdev.Webbrowser\Stop-WebbrowserVideos -Chrome:$chrome -Edge:$Edge
            }

            # loads and executes the JavaScript controller code
            $job = [System.IO.File]::ReadAllText("$PSScriptRoot\..\..\Open-AllYoutubeVideos.js")

            # track scroll positions for header animations
            [int] $scrollPosition = -1

            [int] $scrollPosition2 = -1

            # get chrome automation interfaces
            $page = $Global:chromeController

            $reference = GenXdev.Webbrowser\Get-ChromiumSessionReference

            # handles asynchronous tab opening and video pausing
            function checkOpened() {

                $opened = $false

                try {
                    $i = 0
                    if ($null -ne $Global:data.open) {
                        $Global:data.open |
                            Microsoft.PowerShell.Core\ForEach-Object {
                                $i++

                                $opened = $true

                                # create new page for each video link
                                $page = $Global:chromeController.Context.NewPageAsync().GetAwaiter().GetResult()

                                # navigate to the video url
                                $null = $page.GoToAsync($PSItem).GetAwaiter().GetResult()

                                try {
                                    # click show more button if available
                                    $page.FindByTextAsync('...more').ClickAsync().Wait();
                                }
                                catch {

                                }

                                try {
                                    # switch back to youtube tab
                                    $null = GenXdev.Webbrowser\Select-WebbrowserTab -Name '*youtube*' -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome -Force

                                    $reference = GenXdev.Webbrowser\Get-ChromiumSessionReference

                                    $page = $Global:chromeController

                                    # execute javascript controller code
                                    $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation "$job" -Page:$page -ByReference:$reference -Chrome:$chrome -Edge:$Edge

                                    # pause any playing videos
                                    $null = GenXdev.Webbrowser\Get-WebbrowserTabDomNodes 'video' 'e.pause()' -Page:$page -ByReference:$reference

                                    $null = GenXdev.Webbrowser\Get-WebbrowserTabDomNodes 'video' 'e.pause()' -Chrome:$chrome -Edge:$Edge
                                }
                                catch {
                                    Microsoft.PowerShell.Utility\Write-Warning "Error in checkOpened: $_"
                                }
                            }
                    }
                }
                catch {

                    Microsoft.PowerShell.Utility\Write-Warning "Error in checkOpened: $_"
                }

                if ($opened) {

                    # clear opened video list after processing
                    $Global:data.open = @();

                    # restore focus to powershell window
                    $null = GenXdev.Windows\Set-ForegroundWindow ($powershellWindow.handle)
                }
            }

            if ($null -ne $powershellWindow) {

                # ensure powershell window has focus
                $null = GenXdev.Windows\Set-ForegroundWindow ($powershellWindow.handle)

                $null = $PowerShellWindow.Focus();
            }

            # main event loop - handles UI updates and keyboard input
            while ((-not $completed) -and ($null -ne $page) -and ($null -ne $reference)) {

                try {
                    # reset cursor position and colors for status line
                    $hostInfo = & { $H = Microsoft.PowerShell.Utility\Get-Host; $H.ui.rawui }

                    [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2)

                    [Console]::ResetColor()

                    # execute JavaScript controller code
                    $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation "$job;" -Page $page -ByReference $reference -Chrome:$chrome -Edge:$Edge

                    # process any pending tab operations
                    if (($Global:data.isViewPage -or $Global:data.isShortsPage) -and ($Global:data.ended -or (($Global:data.position -gt 0 -and ($Global:data.position -gt $Global:data.duration - 2))))) {

                        [Console]::SetCursorPosition(0, 0)

                        Microsoft.PowerShell.Utility\Write-Host (
                            'Skipping to next video'
                        ).PadRight($hostInfo.WindowSize.Width - 2, ' ') -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                        [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2)

                        # close current video and navigate to next
                        $page.CloseAsync().Wait()

                        $null = GenXdev.Webbrowser\Select-WebbrowserTab -Name '*youtube*' -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome

                        $reference = GenXdev.Webbrowser\Get-ChromiumSessionReference

                        $page = $Global:chromeController

                        $LastVideo = ''

                        [Console]::SetCursorPosition(0, 0)

                        Microsoft.PowerShell.Utility\Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)

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
                        $sub = ''

                        $pause = ' [P]ause | '

                        $header = ("[Q]uit | $sub$pause SPACE=Next | S = $($data.subscribeTitle) | " +
                            "[F]ullscreen | [0]..[9] = skip | ◀ -20s | +20s ▶ | ").PadRight($hostInfo.WindowSize.Width, ' ')

                        if ($header.Length -gt $hostInfo.WindowSize.Width) {

                            # scroll header if too long for window
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
                                    # stop all videos and start current one
                                    $null = GenXdev.Webbrowser\Stop-WebbrowserVideos -Chrome:$chrome -Edge:$Edge -WarningAction SilentlyContinue

                                    [Console]::SetCursorPosition(0, 0)

                                    Microsoft.PowerShell.Utility\Write-Host (
                                        'Starting video playback'
                                    ).PadRight($hostInfo.WindowSize.Width, ' ') -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                    $LastVideo = ''

                                    # resume video playback
                                    $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation "$job;resumeVideo();" -Page $page -ByReference $reference -Chrome:$chrome -Edge:$Edge |
                                        Microsoft.PowerShell.Core\Out-Null

                                    $null = Microsoft.PowerShell.Utility\Start-Sleep 1

                                    checkOpened
                                }
                            }
                            else {
                                [Console]::SetCursorPosition(0, 0)

                                Microsoft.PowerShell.Utility\Write-Host (
                                    'Scanning for videos'
                                ).PadRight($hostInfo.WindowSize.Width, ' ') -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                $LastVideo = ''

                                # scan page for video links
                                $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation "$job;pageScanned = false; scanPageForLinks();" -Page $page -ByReference $reference -Chrome:$chrome -Edge:$Edge |
                                    Microsoft.PowerShell.Core\Out-Null

                                $null = Microsoft.PowerShell.Utility\Start-Sleep 1

                                checkOpened
                            }

                            Clear-Host

                            Microsoft.PowerShell.Utility\Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)

                            # format and display video title
                            $header = "$($Global:data.title)".Replace("`r", '').Replace("`n", "`r").Replace("`t", ' ').Trim().PadRight($hostInfo.WindowSize.Width, ' ')
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

                            Microsoft.PowerShell.Utility\Write-Host $header -ForegroundColor ([ConsoleColor]::black) -BackgroundColor ([ConsoleColor]::Gray)

                            [int] $nn = 0

                            if ($Global:data.description.Contains('\n1')) {

                                $Global:data.description = 'loading..'
                            }

                            # format video description for display
                            $txt = "$($Global:data.description)".Replace('Show less', '').Replace('Show more', '').Replace("`r", '').Replace("`n", "`r").Replace("`t", ' ').Trim()

                            Microsoft.PowerShell.Utility\Write-Host ((($txt -Split "`r" |
                                        Microsoft.PowerShell.Core\ForEach-Object -ErrorAction SilentlyContinue {
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
                                    ) -Join "`r" -Split "`r" |
                                    Microsoft.PowerShell.Utility\Select-Object -First ($hostInfo.WindowSize.Height - 3)) -Join "`r`n")

                            $LastVideo = $videoInfo
                        }

                        [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 1)

                        [Console]::BackgroundColor = [ConsoleColor]::Blue

                        [Console]::ForegroundColor = [ConsoleColor]::Yellow

                        # display current video position
                        try { [Console]::Write([System.TimeSpan]::FromSeconds([Math]::Round($Global:data.Position, 0)).ToString()) } catch {}

                        [Console]::SetCursorPosition($hostInfo.WindowSize.Width - 9, $hostInfo.WindowSize.Height - 1)

                        # display remaining video time
                        try { [Console]::Write([System.TimeSpan]::FromSeconds([Math]::Round($Global:data.Duration - $Global:data.Position, 0)).ToString()) } catch {}

                        $hostInfo = & { $H = Microsoft.PowerShell.Utility\Get-Host; $H.ui.rawui }

                        [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2)

                        [Console]::ResetColor()

                        checkOpened

                        # process keyboard input when available
                        while ([Console]::KeyAvailable) {

                            [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2)

                            $c = [Console]::ReadKey()

                            switch ("$($c.KeyChar)".ToLowerInvariant()) {

                                'q' {
                                    # quit the application
                                    $completed = $true

                                    [Console]::SetCursorPosition(0, 0)

                                    Microsoft.PowerShell.Utility\Write-Host (
                                        'Quiting..'
                                    ).PadRight($hostInfo.WindowSize.Width, ' ') -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                    if ($null -ne $browser) {

                                        $browser.CloseMainWindow() |
                                            Microsoft.PowerShell.Core\Out-Null
                                    }
                                    return
                                }

                                ' ' {

                                    # skip to next video
                                    [Console]::SetCursorPosition(0, 0)

                                    Microsoft.PowerShell.Utility\Write-Host (
                                        'Skipping to next video'
                                    ).PadRight($hostInfo.WindowSize.Width - 2, ' ') -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                    [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2)

                                    $page.CloseAsync().Wait()

                                    $null = GenXdev.Webbrowser\Select-WebbrowserTab -Name '*youtube*' -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome

                                    $page = $Global:chromeController

                                    $reference = GenXdev.Webbrowser\Get-ChromiumSessionReference

                                    $LastVideo = ''

                                    [Console]::SetCursorPosition(0, 0)

                                    Microsoft.PowerShell.Utility\Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)

                                    continue
                                }

                                's' {

                                    # toggle subscription to current channel
                                    [Console]::SetCursorPosition(0, 0)

                                    Microsoft.PowerShell.Utility\Write-Host (
                                        'Toggling subscription'
                                    ).PadRight($hostInfo.WindowSize.Width, ' ') -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                    $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation "$job;await toggleSubscribeToChannel();" -Page $page -ByReference $reference -Chrome:$chrome -Edge:$Edge |
                                        Microsoft.PowerShell.Core\Out-Null

                                    $null = Microsoft.PowerShell.Utility\Start-Sleep 1

                                    checkOpened

                                    [Console]::SetCursorPosition(0, 0)

                                    Microsoft.PowerShell.Utility\Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)

                                    break;
                                }

                                'f' {

                                    # toggle fullscreen mode
                                    [Console]::SetCursorPosition(0, 0)

                                    Microsoft.PowerShell.Utility\Write-Host (
                                        'Toggling fullscreen'
                                    ).PadRight($hostInfo.WindowSize.Width, ' ') -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                    $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation "$job;await toggleFullscreenVideo();" -Page $page -ByReference $reference -Chrome:$chrome -Edge:$Edge |
                                        Microsoft.PowerShell.Core\Out-Null

                                    $null = Microsoft.PowerShell.Utility\Start-Sleep 1

                                    checkOpened

                                    [Console]::SetCursorPosition(0, 0)

                                    Microsoft.PowerShell.Utility\Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)

                                    break;
                                }

                                'p' {

                                    # toggle pause/play
                                    [Console]::SetCursorPosition(0, 0)

                                    Microsoft.PowerShell.Utility\Write-Host (
                                        'Toggling pause video'
                                    ).PadRight($hostInfo.WindowSize.Width, ' ') -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                    $LastVideo = ''

                                    $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation "$job;await togglePauseVideo();" -Page $page -ByReference $reference -Chrome:$chrome -Edge:$Edge |
                                        Microsoft.PowerShell.Core\Out-Null

                                    $null = Microsoft.PowerShell.Utility\Start-Sleep 1

                                    checkOpened

                                    [Console]::SetCursorPosition(0, 0)

                                    Microsoft.PowerShell.Utility\Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)

                                    break;
                                }

                                default {

                                    # handle numeric keys for position jumping
                                    [int] $n = 0
                                    if ([int]::TryParse("$($c.KeyChar)", [ref] $n)) {

                                        [Console]::SetCursorPosition(0, 0)

                                        Microsoft.PowerShell.Utility\Write-Host (
                                            'Skipping to position'
                                        ).PadRight($hostInfo.WindowSize.Width, ' ') -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                        $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation "$job;await setVideoPosition($n);" -Page $page -ByReference $reference -Chrome:$chrome -Edge:$Edge |
                                            Microsoft.PowerShell.Core\Out-Null

                                        $null = Microsoft.PowerShell.Utility\Start-Sleep 1

                                        checkOpened

                                        [Console]::SetCursorPosition(0, 0)

                                        Microsoft.PowerShell.Utility\Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                    }
                                    else {
                                        if ($c.Key -eq [ConsoleKey]::RightArrow) {

                                            # skip forward 20 seconds
                                            [Console]::SetCursorPosition(0, 0)

                                            Microsoft.PowerShell.Utility\Write-Host (
                                                'Skipping 20 seconds forward'
                                            ).PadRight($hostInfo.WindowSize.Width, ' ') -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                            $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation "$job;await forwardInVideo();" -Page $page -ByReference $reference -Chrome:$chrome -Edge:$Edge |
                                                Microsoft.PowerShell.Core\Out-Null

                                            $null = Microsoft.PowerShell.Utility\Start-Sleep 1

                                            checkOpened

                                            [Console]::SetCursorPosition(0, 0)

                                            Microsoft.PowerShell.Utility\Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                        }
                                        else {
                                            if ($c.Key -eq [ConsoleKey]::LeftArrow) {

                                                # skip backward 20 seconds
                                                [Console]::SetCursorPosition(0, 0)

                                                Microsoft.PowerShell.Utility\Write-Host (
                                                    'Skipping 20 seconds backwards'
                                                ).PadRight($hostInfo.WindowSize.Width, ' ') -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                                $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation "$job;await backwardsInVideo();" -Page $page -ByReference $reference -Chrome:$chrome -Edge:$Edge |
                                                    Microsoft.PowerShell.Core\Out-Null

                                                $null = Microsoft.PowerShell.Utility\Start-Sleep 1

                                                checkOpened

                                                [Console]::SetCursorPosition(0, 0)

                                                Microsoft.PowerShell.Utility\Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                            }
                                        }
                                    }

                                    break;
                                }
                            }
                        }
                    }
                    catch {

                        if ($LastVideo -ne '') {
                            $completed = $true
                            return
                        }
                    }

                    # refresh chrome automation interfaces
                    $hostInfo = & { $H = Microsoft.PowerShell.Utility\Get-Host; $H.ui.rawui }

                    [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2)

                    [Console]::ResetColor()

                    $null = GenXdev.Webbrowser\Select-WebbrowserTab -Name '*youtube*' -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome

                    $page = $Global:chromeController

                    $reference = GenXdev.Webbrowser\Get-ChromiumSessionReference

                    # verify chrome session is still active
                    if ((@($Global:chromeSessions).Count -eq 0) -or ($null -eq $Global:chrome)) {
                        throw 'No active session'
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
                $null = goNext
                return
            }

            # process search queries if provided
            if ($Queries.Count -gt 0) {
                foreach ($Query in $Queries) {
                    if ([string]::IsNullOrWhiteSpace($Query) -eq $false) {
                        # open youtube search results for each query
                        $null = goNext (
                            "https://www.youtube.com/results?search_query=$([Uri]::EscapeUriString($query))"
                        ) $Query
                    }
                }
            }

            # handle special feed types
            if ($Subscriptions -eq $true) {
                $null = goNext 'https://www.youtube.com/feed/subscriptions'
            }

            if ($Recommended -eq $true) {
                $null = goNext 'https://www.youtube.com/'
            }

            if ($WatchLater -eq $true) {
                $null = goNext 'https://www.youtube.com/playlist?list=WL'
            }

            if ($Trending -eq $true) {
                $null = goNext 'https://www.youtube.com/feed/trending'
            }
        }
        finally {
            Clear-Host
        }
    }

    end {

        Microsoft.PowerShell.Utility\Write-Verbose 'YouTube video browser session ended'
    }
}
###############################################################################