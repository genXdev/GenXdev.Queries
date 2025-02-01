###############################################################################

<#
.SYNOPSIS
Opens and controls YouTube videos in a browser window with keyboard shortcuts.

.DESCRIPTION
Performs an infinite auto opening YouTube search in a new fullscreen browser
window on second monitor. The console window shows video info and keyboard
shortcuts for controlling currently playing video.

.PARAMETER Queries
The search terms to find videos for. Opens all videos matching each term.

.PARAMETER Subscriptions
Opens all videos from subscribed channels.

.PARAMETER WatchLater
Opens all videos from the watch-later playlist.

.PARAMETER Recommended
Opens all videos that YouTube recommends.

.PARAMETER Trending
Opens all videos currently trending on YouTube.

.PARAMETER Edge
Use Microsoft Edge browser.

.PARAMETER Chrome
Use Google Chrome browser.

.EXAMPLE
Open-AllYoutubeVideos -Queries "PowerShell tutorial","vscode tips" -Edge

.EXAMPLE
qvideos PowerShell tutorial, vscode tips
#>
function Open-AllYoutubeVideos {

    [CmdletBinding()]
    [Alias("qvideos", "qyt")]

    param(
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $true,
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
        ########################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Use Microsoft Edge browser"
        )]
        [Alias("e")]
        [switch] $Edge,
        ########################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "Use Google Chrome browser"
        )]
        [Alias("ch")]
        [switch] $Chrome
        ########################################################################
    )

    begin {

        $lastVideo = ""

        # get the main powershell window for positioning
        $powershellProcess = Get-PowershellMainWindowProcess
        $powershellWindow = [GenXdev.Helpers.WindowObj]::GetMainWindow(
            $powershellProcess)

        Write-Verbose "Starting YouTube video browser"
    }

    process {

        # fix casing consistency
        [bool] $currentTab = ($Recommended -ne $true) -and
            ($Subscriptions -ne $true) -and
            ($Trending -ne $true) -and
            ($WatchLater -ne $true) -and
            (($Queries.Count -eq 0) -or [String]::IsNullOrWhiteSpace($queries[0]))


        function go($Url = $null, $Query) {

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

            $AllScreens = @([WpfScreenHelper.Screen]::AllScreens | ForEach-Object { $PSItem });
            $hostInfo = & { $H = Get-Host; $H.ui.rawui; }
            $size = "$($hostInfo.WindowSize.Width)x$($hostInfo.WindowSize.Height)";
            Clear-Host
            Write-Host "Hold on.. launching query".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
            $browser = $null;

            if (-not $currentTab) {

                if ($PowershellWindow.Count -gt 0) {

                    $PowershellScreen = [WpfScreenHelper.Screen]::FromPoint(@{X = $PowershellWindow.Position().X; Y = $PowershellWindow.Position().Y });
                    $PowershellScreenIndex = $AllScreens.IndexOf($PowershellScreen) + 1;

                    [int] $defaultMonitor = 1;

                    if ([int]::TryParse($Global:DefaultSecondaryMonitor, [ref] $defaultMonitor)) {

                        $Monitor = $defaultMonitor % ($AllScreens.Length + 1);
                    }
                    else {

                        $Monitor = 2 % ($AllScreens.AllScreens.Length + 1);
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
                            $browser = Open-Webbrowser -NewWindow -RestoreFocus -Chromium -Edge:$Edge -Chrome:$Chrome -Right -Url $Url -PassThru -Force -NoBrowserExtensions
                            $null = Start-Sleep 1
                            $Global:chrome = $null
                        }
                        else {

                            Set-WindowPosition -Bottom -Monitor $Monitor
                            $browser = Open-Webbrowser -NewWindow -RestoreFocus -Chromium -Edge:$Edge -Chrome:$Chrome -Top -Url $Url -PassThru -Force -NoBrowserExtensions
                            $null = Start-Sleep 1
                            $Global:chrome = $null
                        }
                    }
                }

                if ($null -eq $browser) {

                    $browser = Open-Webbrowser -NewWindow -FullScreen -RestoreFocus -Chromium -Edge:$Edge -Chrome:$Chrome -Url $Url -PassThru -Force -NoBrowserExtensions
                    $null = Start-Sleep 1
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
            }

            $completed = $false;
            $job = [System.IO.File]::ReadAllText("$PSScriptRoot\..\..\Open-AllYoutubeVideos.js");
            [int] $scrollPosition = -1;
            [int] $scrollPosition2 = -1;

            $page = $Global:chromeController
            $reference = Get-ChromiumSessionReference

            # Add error handling for async operations
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
                    # $null = Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome -Force
                    # $null = Stop-WebbrowserVideos
                    # $page = $Global:chromeController
                    # $reference = Get-ChromiumSessionReference
                    $null = Set-ForegroundWindow ($powershellWindow.handle)
                }
            }

            while ((-not $completed) -and ($null -ne $page) -and ($null -ne $reference)) {

                try {
                    $hostInfo = & { $H = Get-Host; $H.ui.rawui; }
                    [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2); [Console]::ResetColor();

                    $null = Invoke-WebbrowserEvaluation "$job;" -Page $Page -ByReference $reference;

                    checkOpened

                    if ($completed) { return; }

                    try {

                        $newsize = "$($hostInfo.WindowSize.Width)x$($hostInfo.WindowSize.Height)";
                        if ($newsize -ne $size) {

                            $size = $newsize;
                            $LastVideo = $null;
                        }
                        $sub = "";
                        $pause = " [P]ause | ";
                        $header = "[Q]uit | $sub$pause SPACE=Next | S = $(($data.subscribeTitle)) | F = Toggle fullscreen | [0]..[9] = skip | ◀ -20s | +20s ▶ | ".PadRight($hostInfo.WindowSize.Width, " ");

                        if ($header.Length -gt $hostInfo.WindowSize.Width) {

                            $scrollPosition = ($scrollPosition + 1) % $header.length;
                            try {
                                $header = "$header $header".Substring($scrollPosition, $hostInfo.WindowSize.Width);
                            }
                            catch {
                                try {
                                    $header = "$header $header".Substring(0, $hostInfo.WindowSize.Width);
                                }
                                catch {
                                }
                            }
                        }

                        $scrollPosition = -1;
                        $scrollPosition2 = -1;
                        $videoInfo = "$($Global:data.title)$($Global:data.description)"

                        if ($videoInfo -ne $LastVideo) {
                            Clear-Host;
                            Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                            $header = "$($Global:data.title)".Replace("`r", "").Replace("`n", "`r").Replace("`t", " ").Trim().PadRight($hostInfo.WindowSize.Width, " ");
                            if ($header.Length -gt $hostInfo.WindowSize.Width) {

                                $scrollPosition2 = ($scrollPosition2 + 1) % $header.length;
                                try {
                                    $header = "$header $header".Substring($scrollPosition, $hostInfo.WindowSize.Width);
                                }
                                catch {
                                    try {
                                        $header = "$header $header".Substring(0, $hostInfo.WindowSize.Width);
                                    }
                                    catch {
                                    }
                                }
                            }

                            Write-Host $header -ForegroundColor ([ConsoleColor]::black) -BackgroundColor ([ConsoleColor]::Gray)
                            [int] $nn = 0;

                            if ($Global:data.description.Contains("\n1")) {

                                $Global:data.description = "loading.."
                            }

                            $txt = "$($Global:data.description)".Replace("Show less", "").Replace("Show more", "").Replace("`r", "").Replace("`n", "`r").Replace("`t", " ").Trim();
                            Write-Host ((($txt -Split "`r"  | ForEach-Object -ErrorAction SilentlyContinue {
                                            if ([string]::IsNullOrWhiteSpace($PSItem)) {
                                                $nn = $nn + 1;
                                            }
                                            else {
                                                $nn = 0
                                            }
                                            if ($nn -lt 2) {
                                                $s = $PSItem.Trim();
                                                for ([int] $i = $hostInfo.WindowSize.Width - 1; $i -lt $s.length - 1; $i += $hostInfo.WindowSize.Width - 3) {

                                                    $s = $s.substring(0, $i) + "`r" + $s.substring($i);
                                                }

                                                $s
                                            }
                                        }
                                    ) -Join "`r" -Split "`r" | Select-Object -First ($hostInfo.WindowSize.Height - 3)) -Join "`r`n")

                            $LastVideo = $videoInfo
                        }

                        [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 1);
                        [Console]::BackgroundColor = [ConsoleColor]::Blue;
                        [Console]::ForegroundColor = [ConsoleColor]::Yellow;
                        try { [Console]::Write([System.TimeSpan]::FromSeconds([Math]::Round($Global:data.Position, 0)).ToString()) } catch {}
                        [Console]::SetCursorPosition($hostInfo.WindowSize.Width - 9, $hostInfo.WindowSize.Height - 1);
                        try { [Console]::Write([System.TimeSpan]::FromSeconds([Math]::Round($Global:data.Duration - $Global:data.Position, 0)).ToString()) } catch {}
                        $hostInfo = & { $H = Get-Host; $H.ui.rawui; }
                        [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2);
                        [Console]::ResetColor();

                        while ([Console]::KeyAvailable) {

                            [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2);
                            $c = [Console]::ReadKey();

                            switch ("$($c.KeyChar)".ToLowerInvariant()) {

                                "q" {
                                    $completed = $true;
                                    [Console]::SetCursorPosition(0, 0);
                                    Write-Host "Quiting..".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                    if ($null -ne $browser) {

                                        $browser.CloseMainWindow() | Out-Null
                                    }
                                    return;
                                }

                                " " {

                                    [Console]::SetCursorPosition(0, 0);
                                    Write-Host "Skipping to next video".PadRight($hostInfo.WindowSize.Width - 2, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                    [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2);
                                    $Page.CloseAsync().Wait()
                                    $null = Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome
                                    $page = $Global:chromeController
                                    $reference = Get-ChromiumSessionReference
                                    $LastVideo = "";
                                    [Console]::SetCursorPosition(0, 0);
                                    Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                    continue;
                                }

                                "s" {

                                    [Console]::SetCursorPosition(0, 0);
                                    Write-Host "Toggling subscription".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                    $null = Invoke-WebbrowserEvaluation "$job;await toggleSubscribeToChannel();" -Page $Page -ByReference $reference | Out-Null
                                    $null = Start-Sleep 1
                                    checkOpened
                                    [Console]::SetCursorPosition(0, 0);
                                    Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                }

                                "f" {

                                    [Console]::SetCursorPosition(0, 0);
                                    Write-Host "Toggling fullscreen".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                    $null = Invoke-WebbrowserEvaluation "$job;await toggleFullscreenVideo();" -Page $Page -ByReference $reference | Out-Null
                                    $null = Start-Sleep 1
                                    checkOpened
                                    [Console]::SetCursorPosition(0, 0);
                                    Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                }

                                "p" {

                                    [Console]::SetCursorPosition(0, 0);
                                    Write-Host "Toggling pause video".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                    $LastVideo = "";
                                    $null = Invoke-WebbrowserEvaluation "$job;await togglePauseVideo();" -Page $Page -ByReference $reference | Out-Null
                                    $null = Start-Sleep 1
                                    checkOpened
                                    [Console]::SetCursorPosition(0, 0);
                                    Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                }

                                default {

                                    [int] $n = 0;
                                    if ([int]::TryParse("$($c.KeyChar)", [ref] $n)) {

                                        [Console]::SetCursorPosition(0, 0);
                                        Write-Host "Skipping to position".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                        $null = Invoke-WebbrowserEvaluation "$job;await setVideoPosition($n);" -Page $Page -ByReference $reference | Out-Null
                                        $null = Start-Sleep 1
                                        checkOpened
                                        [Console]::SetCursorPosition(0, 0);
                                        Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                    }
                                    else {
                                        if ($c.Key -eq [ConsoleKey]::RightArrow) {

                                            [Console]::SetCursorPosition(0, 0);
                                            Write-Host "Skipping 20 seconds forward".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                            $null = Invoke-WebbrowserEvaluation "$job;await forwardInVideo();" -Page $Page -ByReference $reference | Out-Null
                                            $null = Start-Sleep 1
                                            checkOpened
                                            [Console]::SetCursorPosition(0, 0);
                                            Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                        }
                                        else {
                                            if ($c.Key -eq [ConsoleKey]::LeftArrow) {

                                                [Console]::SetCursorPosition(0, 0);
                                                Write-Host "Skipping 20 seconds backwards".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                                $null = Invoke-WebbrowserEvaluation "$job;await backwardsInVideo();" -Page $Page -ByReference $reference | Out-Null
                                                $null = Start-Sleep 1
                                                checkOpened
                                                [Console]::SetCursorPosition(0, 0);
                                                Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    catch {

                        if ($LastVideo -ne "") {
                            $completed = $true;
                            return;
                        }
                    }
                    $hostInfo = & { $H = Get-Host; $H.ui.rawui; }
                    [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2); [Console]::ResetColor();
                    $null = Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome
                    $page = $Global:chromeController
                    $reference = Get-ChromiumSessionReference

                    if ((@($Global:chromeSessions).Count -eq 0) -or ($null -eq $Global:chrome)) {

                        throw "No active session"
                    }
                }
                catch {

                    $completed = $true;
                }
            }
        }

        $OldVerbosePreference = $VerbosePreference
        $VerbosePreference = 'SilentlyContinue'
        try {

            if ($currentTab) {

                go
                return;
            }

            if ($Queries.Count -gt 0) {

                foreach ($Query in $Queries) {

                    if ([string]::IsNullOrWhiteSpace($Query) -eq $false) {

                        go "https://www.youtube.com/results?search_query=$([Uri]::EscapeUriString($Query))" $Query
                    }
                }
            }

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
            $VerbosePreference = $OldVerbosePreference
        }
    }

    end {
        Write-Verbose "YouTube video browser session ended"
    }
}
