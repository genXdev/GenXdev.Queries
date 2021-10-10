
###############################################################################

<#
.SYNOPSIS
Performs a google search and returns the links

.DESCRIPTION
Performs a google search and returns the links

.PARAMETER Query
The google query to perform

.PARAMETER Max
The maximum number of results to obtain, defaults to 200

.EXAMPLE
PS C:\> $Urls = Get-GoogleSearchResultUrls "site:github.com PowerShell module"; $Urls

.NOTES
Requires the Windows 10+ Operating System
#>
function Get-GoogleSearchResultUrls {

    [CmdletBinding()]
    [Alias("qlinksget")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The maximum number of results to obtain, defaults to 200"
        )]
        [int] $Max = 200
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        foreach ($Query in $Queries) {

            $Global:Data = @{

                urls  = @();
                query = $Query
            }

            $Query = "$([Uri]::EscapeUriString($Query))"
            $Url = "https://www.google.com/search?q=$Query"

            Invoke-WebbrowserEvaluation "document.location.href='$Url'" | Out-Null

            do {
                Start-Sleep 5 | Out-Null

                Invoke-WebbrowserEvaluation -Scripts @("$PSScriptRoot\Get-GoogleSearchResultUrls.js") | Out-Null

                $Global:data.urls | ForEach-Object -ErrorAction SilentlyContinue {

                    if ($Max-- -gt 0) {

                        $_;
                    }
                }
            }

            while ($Global:data.more -and ($Max-- -gt 0))
        }
    }
}

###############################################################################

<#
.SYNOPSIS
Performs an infinite auto opening google search .

.DESCRIPTION
Performs a google search .
Opens 10 tabs each times, pauses until initial tab is revisited
Close initial tab to stop

.PARAMETER Query
The google query to perform

.EXAMPLE
PS C:\>

    Open-AllGoogleLinks "site:github.com PowerShell module"

.NOTES
Requires the Windows 10+ Operating System
#>
function Open-AllGoogleLinks {

    [CmdletBinding()]
    [Alias("qlinks")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries
    )

    begin {

        $Query = Build-InvocationArguments $MyInvocation $Queries -SingleString
    }

    process {

        $Global:data = @{

            urls  = @();
            query = $Query
        }

        Invoke-WebbrowserTabPollingScript -Scripts @("$PSScriptRoot\Open-AllGoogleLinks.js") -InitialUrl "https://www.google.com/search?q=$([Uri]::EscapeUriString($Query))"
    }
}

###############################################################################

<#
.SYNOPSIS
Performs an infinite auto opening youtube search in a new fullscreen browser window on second monitor.

.DESCRIPTION
Performs an infinite auto opening youtube search in a new fullscreen browser window on second monitor.
The console window will show info about the video and keyboard shortcuts for controlling current playing video

.PARAMETER Queries
Opens all videos of each searchterm provided

.PARAMETER Subscriptions
Opens all videos of subscribed channels

.PARAMETER WatchLater
Opens all videos of the watch-later playlist

.PARAMETER Recommended
Opens all videos that youtube recommends

.NOTES
The very first time, you will need to allow youtube to open pop-ups, using the appropiate button in the addressbar of the browser.

If no parameters are provided, it will provide the UI for any youtube tab that has focus

.EXAMPLE
PS C:\>

    Open-AllYoutubeVideos "PowerShell Windows Terminal"

.EXAMPLE
PS C:\>

    qvideos PowerShell tutorial, vscode tips

    qvideos -Queries "PowerShell tutorials", "vscode tips"

.NOTES
Requires the Windows 10+ Operating System
#>
function Open-AllYoutubeVideos {

    [CmdletBinding()]
    [Alias("qvideos")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries = @(""),

        [parameter(
            Mandatory = $false
        )]
        [switch] $Subscriptions,

        [parameter(
            Mandatory = $false
        )]
        [switch] $WatchLater,

        [parameter(
            Mandatory = $false
        )]
        [switch] $Recommended
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
        $PowershellProcess = [System.Diagnostics.Process]::GetCurrentProcess();
        if ($null -ne $PowershellProcess.Parent -and [GenXdev.Helpers.WindowObj]::GetMainWindow($PowershellProcess.Parent).Count -gt 0) {
            $PowershellProcess = $PowershellProcess.Parent;
        }
        $PowershellWindow = [GenXdev.Helpers.WindowObj]::GetMainWindow($PowershellProcess);
    }

    process {

        [bool] $CurrentTab = ($Recommended -ne $true) -and ($Subscriptions -ne $true) -and ($WatchLater -ne $true) -and (($Queries.Count -eq 0) -or [String]::IsNullOrWhiteSpace($queries[0]));

        $Global:data = @{

            urls           = @();
            query          = $Query;
            description    = "";
            title          = "";
            subscribeTitle = "";
            playing        = $true;
            duration       = 0;
            position       = 0;
        }

        function go($Url = $null) {

            $hostInfo = & { $H = Get-Host; $H.ui.rawui; }
            Clear-Host
            Write-Host "Hold on.. launching query".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
            $browser = $null;

            if ([string]::IsNullOrWhiteSpace($Url)) {
                if ($CurrentTab -ne $true) {

                    $browser = Open-Webbrowser -PassThrough -RestoreFocus
                }
            }
            else {

                if ($PowershellWindow.Count -gt 0) {

                    $PowershellScreen = [System.Windows.Forms.Screen]::FromPoint($PowershellWindow.Position());
                    $PowershellMonitorNr = [System.Windows.Forms.Screen]::AllScreens.IndexOf($PowershellScreen);

                    if ($PowershellMonitorNr -eq 1) {

                        if ($PowershellScreen.WorkingArea.Width -gt $PowershellScreen.WorkingArea.Height) {

                            $browser = Open-Webbrowser -NewWindow -RestoreFocus -Chromium -Right -Url $Url -PassThrough
                            1..3 | ForEach-Object {
                                $PowershellWindow[0].Resize($PowershellScreen.WorkingArea.Width / 2, $PowershellScreen.WorkingArea.Height) | Out-Null
                                $PowershellWindow[0].Move($PowershellScreen.WorkingArea.X, $PowershellScreen.WorkingArea.Y) | Out-Null
                            }
                        }
                        else {

                            $browser = Open-Webbrowser -NewWindow -RestoreFocus -Chromium -Top -Url $Url -PassThrough
                            1..3 | ForEach-Object {
                                $PowershellWindow[0].Resize($PowershellScreen.WorkingArea.Width, $PowershellScreen.WorkingArea.Height / 2) | Out-Null
                                $PowershellWindow[0].Move($PowershellScreen.WorkingArea.X, $PowershellScreen.WorkingArea.Y + $PowershellScreen.WorkingArea.Height / 2) | Out-Null
                            }
                        }
                    }
                }
            }

            if ($CurrentTab -ne $true) {

                if ($null -eq $browser) {

                    if ([System.Windows.Forms.Screen]::AllScreens.Length -lt 2) {

                        $browser = Open-Webbrowser -NewWindow -RestoreFocus -Chromium -Right -Url $Url -PassThrough
                    }
                    else {
                        $browser = Open-Webbrowser -NewWindow -FullScreen -RestoreFocus -Chromium -Url $Url -PassThrough
                    }
                }
                Start-Sleep 3
            }

            Select-WebbrowserTab -Name "*youtube*" | Out-Null
            $job = $null;
            if ($CurrentTab -ne $true) {

                $job = Invoke-WebbrowserTabPollingScript -Scripts @("$PSScriptRoot\Open-AllYoutubeVideos.js")

                while ([Console]::KeyAvailable) { [Console]::ReadKey(); }
            }

            [int] $scrollPosition = -1;
            [int] $scrollPosition2 = -1;

            while ($true) {

                try {

                    $hostInfo = & { $H = Get-Host; $H.ui.rawui; }
                    Clear-Host
                    $sub = ""; if (![string]::IsNullOrWhiteSpace($Global:data.subscribeTitle)) { $sub = " S = $($Global:data.subscribeTitle) |" }
                    if ($Global:data.playing) { $pause = " [P]ause |" } else { $pause = " [R]esume |" }
                    $header = "[Q]uit |$sub$pause SPACE=Next | [0]..[9] = skip | ◀ -20sec | +20sec ▶ | ".PadRight($hostInfo.WindowSize.Width, " ");
                    if ($header.Length -gt $hostInfo.WindowSize.Width) {

                        $scrollPosition = ($scrollPosition + 1) % $header.length;
                        $header = "$header $header".Substring($scrollPosition, $hostInfo.WindowSize.Width);
                    }

                    Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)

                    $header = "$($Global:data.title)".Replace("`r", "").Replace("`n", "`r").Replace("`t", " ").Trim().PadRight($hostInfo.WindowSize.Width, " ");
                    if ($header.Length -gt $hostInfo.WindowSize.Width) {

                        $scrollPosition2 = ($scrollPosition2 + 1) % $header.length;
                        $header = "$header $header".Substring($scrollPosition, $hostInfo.WindowSize.Width);
                    }

                    Write-Host $header -ForegroundColor ([ConsoleColor]::black) -BackgroundColor ([ConsoleColor]::Gray)
                    [int] $nn = 0;
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
                    [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 1);
                    [Console]::BackgroundColor = [ConsoleColor]::Blue;
                    [Console]::ForegroundColor = [ConsoleColor]::Yellow;
                    try { [Console]::Write([TimeSpan]::FromSeconds([Math]::Round($Global:data.Position, 0)).ToString()) } catch {}
                    [Console]::SetCursorPosition($hostInfo.WindowSize.Width - 9, $hostInfo.WindowSize.Height - 1);
                    try { [Console]::Write([TimeSpan]::FromSeconds([Math]::Round($Global:data.Duration - $Global:data.Position, 0)).ToString()) } catch {}
                    [Console]::SetCursorPosition(0, 0);
                    [Console]::ResetColor();

                    if ([Console]::KeyAvailable) {

                        [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2);
                        $c = [Console]::ReadKey();

                        switch ("$($c.KeyChar)".ToLowerInvariant()) {

                            "q" {
                                if ($null -ne $Job) {

                                    Stop-Job $job.Name -ErrorAction SilentlyContinue | Out-Null

                                    $browser.CloseMainWindow();
                                }
                                Clear-Host;
                                return;
                            }

                            " " {

                                Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                                Invoke-WebbrowserEvaluation "window.close()" -ErrorAction SilentlyContinue | Out-Null
                                Start-Sleep 1
                                Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                            }

                            "s" {

                                Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                                Invoke-WebbrowserEvaluation "
                        window.fakeClick = function (anchorObj, event) {
                            try {

                                if (anchorObj.click) {
                                    anchorObj.click()
                                } else if (document.createEvent) {
                                    if (!event || event.target !== anchorObj) {
                                        var evt = document.createEvent(`"MouseEvents`");
                                        evt.initMouseEvent(`"click`", true, true, window,
                                            0, 0, 0, 0, 0, false, false, false, false, 0, null);
                                        var allowDefault = anchorObj.dispatchEvent(evt);
                                    }
                                }
                            } catch (e) { }
                        }
                        " -ErrorAction SilentlyContinue | Out-Null
                                Invoke-WebbrowserEvaluation "fakeClick(document.querySelector('#subscribe-button tp-yt-paper-button'))" -ErrorAction SilentlyContinue | Out-Null
                                Invoke-WebbrowserEvaluation "fakeClick(document.querySelector('#confirm-button tp-yt-paper-button'))" -ErrorAction SilentlyContinue | Out-Null
                            }

                            "p" {

                                Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                                Invoke-WebbrowserEvaluation "

                                    window.video = document.getElementsByTagName('video')[0];
                                    if (window.video.paused) {
                                        window.video.play();
                                    }
                                    else {
                                    window.video.pause();
                                    }
                                    data.playing = !window.video.paused;
                                    data.position = window.video.currentTime;
                                    data.duration = window.video.duration;

                                    " -ErrorAction SilentlyContinue | Out-Null
                            }

                            "r" {

                                Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                                Invoke-WebbrowserEvaluation "

                                    window.video = document.getElementsByTagName('video')[0];
                                    window.video.play();
                                    data.playing = !window.video.paused;
                                    data.position = window.video.currentTime;
                                    data.duration = window.video.duration;

                                    " -ErrorAction SilentlyContinue | Out-Null
                            }

                            default {

                                [int] $n = 0;
                                if ([int]::TryParse("$($c.KeyChar)", [ref] $n)) {

                                    Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                                    Invoke-WebbrowserEvaluation "
                                        window.video = document.getElementsByTagName('video')[0];
                                        window.video.currentTime = Math.round(window.video.duration * ($n/10));
                                        window.video.play();
                                        data.playing = !window.video.paused;
                                        data.position = window.video.currentTime;
                                        data.duration = window.video.duration;
                                    " -ErrorAction SilentlyContinue | Out-Null;
                                }
                                else {
                                    if ($c.Key -eq [ConsoleKey]::RightArrow) {

                                        Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                                        Invoke-WebbrowserEvaluation "
                                            window.video = document.getElementsByTagName('video')[0];
                                            window.video.currentTime = Math.min(window.video.duration, window.video.currentTime+20);
                                            window.video.play();
                                            data.playing = !window.video.paused;
                                            data.position = window.video.currentTime;
                                            data.duration = window.video.duration;
                                            " -ErrorAction SilentlyContinue | Out-Null;
                                    }
                                    else {
                                        if ($c.Key -eq [ConsoleKey]::LeftArrow) {

                                            Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                                            Invoke-WebbrowserEvaluation "
                                                window.video = document.getElementsByTagName('video')[0];
                                                window.video.currentTime = Math.max(0, window.video.currentTime-20);
                                                window.video.play();
                                                data.playing = !window.video.paused;
                                                data.position = window.video.currentTime;
                                                data.duration = window.video.duration;
                                            " -ErrorAction SilentlyContinue | Out-Null;
                                        }
                                    }
                                }
                            }
                        }
                        while ([Console]::KeyAvailable) {

                            [Console]::ReadKey() | Out-Null
                        }
                    }

                    Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                    Invoke-WebbrowserEvaluation "

                    let isSuggestionPage = window.location.href === 'https://www.youtube.com/';
                    let isSubscriptionsPage = window.location.href.indexOf('https://www.youtube.com/feed/subscriptions') === 0;
                    let isViewPage = window.location.href.indexOf('https://www.youtube.com/watch?v') === 0;
                    let isSearchPage = window.location.href.indexOf('https://www.youtube.com/results?search_query=') === 0;
                    let isWatchLaterPage = window.location.href.indexOf('https://www.youtube.com/playlist?list=WL') === 0;

                    if (!isViewPage){

                        data.description = document.title;
                        data.title = isSearchPage ? 'Search page' :
                            isSuggestionPage ? 'Recommended' :
                            isSubscriptionsPage ? 'Subscriptions' :
                            isWatchLaterPage ? 'Watch later' : 'Unknown page';
                        data.subscribeTitle = '         ';
                        data.playing = false;
                        data.position = 0;
                        data.duration = 0;
                    }
                    else {

                        window.video = document.getElementsByTagName('video')[0];
                        if (window.video) {

                            window.video.setAttribute('style','position:fixed;left:0;top:0;bottom:0;right:0;z-index:10000;width:100vw;height:100vh');

                            if (!document.getElementById('genxbackground')) {

                                window.video.onended = () => { window.close() };
                                let div = document.createElement('div'); document.body.appendChild(div);div.setAttribute('style', 'position:fixed;left:0;top:0;bottom:0;right:0;z-index:9999;width:100vw;height:100vh;background-color:black;');
                                div.setAttribute('id', 'genxbackground');
                                document.body.appendChild(window.video);
                                document.body.setAttribute('style', 'overflow:hidden');
                            }

                            window.video.setAttribute('style','position:fixed;left:0;top:0;bottom:0;right:0;z-index:10000;width:100vw;height:100vh');
                            data.playing = !window.video.paused;
                            data.position = window.video.currentTime;
                            data.duration = window.video.duration;
                        }
                        else {
                            data.playing = false;
                            data.position = 0;
                            data.duration = 0;
                        }

                        try { data.description = document.querySelector('#content').querySelector('#description').innerText; } catch { data.description = ''; }
                        try { data.title = document.title; } catch { data.title = ''; }
                        try { data.subscribeTitle = document.querySelector('#subscribe-button').innerText.trim(); } catch { data.subscribeTitle = '           ' }
                    }
                " -ErrorAction SilentlyContinue | Out-Null;

                }
                catch {

                    Clear-Host
                }
            }
        }

        try {

            if ($CurrentTab) {

                go
                return;
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

            if ($Queries.Count -gt 0) {

                foreach ($Query in $Queries) {

                    if ([string]::IsNullOrWhiteSpace($Query) -eq $false) {

                        go "https://www.youtube.com/results?search_query=$([Uri]::EscapeUriString($Query))"
                    }
                }
            }
        }
        finally {
            Clear-Host
        }
    }
}

###############################################################################

function Open-GoogleQuery {

    # DESCRIPTION Open-GoogleQuery: Opens a google query in a webbrowser, in a configurable manner, using commandline switches

    [Alias("q")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.google.com/search?q=$([Uri]::EscapeUriString($Query))";

            Open-Webbrowser @PSBoundParameters
        }
    }
}

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

    Copy-PDFsFromGoogleQuery scientific paper co2
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
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [parameter(
            Mandatory = $false,
            HelpMessage = "The maximum number of results to obtain, defaults to 200"
        )]
        [int] $Max = 200
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        foreach ($Query in $Queries) {

            Get-GoogleSearchResultUrls -Max $Max -Query "filetype:pdf $Query" |
            ForEach-Object -ThrottleLimit 64 -Parallel {

                try {

                    $destination = [IO.Path]::Combine(
                        $PWD,
                        (
                            [IO.Path]::ChangeExtension(
                                [Uri]::UnescapeDataString(
                                    [IO.Path]::GetFileName($_).Split("#")[0].Split("?")[0]
                                ).Replace("\", "_").Replace("/", "_").Replace("?", "_").Replace("*", "_").Replace(" ", "_").Replace("__", "_") +
                                "_$([DateTime]::UtcNow.Ticks)_$([System.Threading.Thread]::CurrentThread.ManagedThreadId)",
                                ".pdf"
                            )
                        )
                    );

                    Invoke-WebRequest -Uri $_ -OutFile $destination

                    Get-ChildItem $destination
                }
                catch {

                }
            }
        }
    }
}

###############################################################################

<#
.SYNOPSIS
Opens a Wikipedia query in a webbrowser

.DESCRIPTION
Opens a Wikipedia query in a webbrowser, in a configurable manner, using commandline switches

#>
function Open-WikipediaQuery {

    [CmdletBinding()]
    [Alias("wiki")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {
        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://en.wikipedia.org/wiki/Special:Search?search=$([Uri]::EscapeUriString($Query))";

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-WikipediaNLQuery {

    # DESCRIPTION Open-WikipediaNLQuery: Opens a 'Wikipedia - The Netherlands' query in a webbrowser, in a configurable manner, using commandline switches

    [Alias("wikinl")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://nl.wikipedia.org/wiki/Special:Search?search=$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-YoutubeQuery {

    # DESCRIPTION Open-YoutubeQuery: Opens a Youtube query in a webbrowser, in a configurable manner, using commandline switches

    [Alias("youtube")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.youtube.com/results?search_query=$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-IMDBQuery {

    # DESCRIPTION Open-IMDBQuery: Opens a "Internet Movie Database" query in a webbrowser, in a configurable manner, using commandline switches

    [Alias("imdb")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.imdb.com/find?q=$([Uri]::EscapeUriString($Query))&ref_=nv_sr_sm="

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-InstantStreetViewQuery {

    # DESCRIPTION Open-InstantStreetViewQuery: Opens a "InstantStreetView" query in a webbrowser, in a configurable manner, using commandline switches

    [Alias("isv")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.instantstreetview.com/s/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-StackOverflowQuery {

    # DESCRIPTION Open-StackOverflowQuery: Opens a "Stack Overflow" query in a webbrowser, in a configurable manner, using commandline switches

    [Alias("qso")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://stackoverflow.com/search?q=$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-WolframAlphaQuery {

    # DESCRIPTION Open-WolframAlphaQuery: Opens a "Wolfram Alpha" query in a webbrowser, in a configurable manner, using commandline switches

    [Alias("qalpha")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.wolframalpha.com/input/?i=$([Uri]::EscapeUriString($Query))";

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-GithubQuery {

    # DESCRIPTION Open-GithubQuery: Opens a Github query in a webbrowser, in a configurable manner, using commandline switches

    [Alias("qgit")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        [parameter(
            Mandatory = $false
        )]
        [string] $Language = "",
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ([string]::IsNullOrWhiteSpace($Language)) {

            $Language = ""
        }
        else {

            $Language = "l=$([Uri]::EscapeUriString($Language))&"
        }

        if ($PSBoundParameters.ContainsKey("Language")) {

            $PSBoundParameters.Remove("Language") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://github.com/search?q=$([Uri]::EscapeUriString($Query))$Language&type=repositories"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-GoogleSiteInfo {

    # DESCRIPTION Open-GoogleSiteInfo: Opens a "Google siteinfo" query in a webbrowser, in a configurable manner, using commandline switches

    [Alias()]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Queries"] = @("site:$Query", "link:$Query", "related:$Query");

            Open-GoogleQuery @PSBoundParameters
        }
    }
}

###############################################################################

function Open-BuiltWithSiteInfo {

    # DESCRIPTION Open-BuiltWithSiteInfo: Opens a BuildWith query in a webbrowser, in a configurable manner, using commandline switches

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://builtwith.com/?$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-WhoisHostSiteInfo {

    # DESCRIPTION Open-WhoisHostSiteInfo: Opens a "Whois HostInfo" query in a webbrowser, in a configurable manner, using commandline switches

    [Alias()]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://whois.domaintools.com/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-WaybackMachineSiteInfo {

    # DESCRIPTION Open-WaybackMachineSiteInfo: Opens a Waybackmachine query in a webbrowser, in a configurable manner, using commandline switches

    [Alias("wayback")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://web.archive.org/web/*/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-SimularWebSiteInfo {

    # DESCRIPTION Open-SimularWebSiteInfo: Opens a "Simular web" query in a webbrowser, in a configurable manner, using commandline switches

    [Alias("simularsite")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.similarweb.com/website/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}
