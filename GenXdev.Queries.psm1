
##############################################################################################################
##############################################################################################################

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
        ###################################################################
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

##############################################################################################################
##############################################################################################################

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

##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Performs an infinite auto opening youtube search in a new fullscreen browser window on second monitor

.DESCRIPTION
Performs an infinite auto opening youtube search in a new fullscreen browser window on second monitor
Console window will show info about the video and keyboard shortcuts for controlling current playing video

.PARAMETER Query
The youtube query to perform

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
        [switch] $WatchLater
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

        function go($Url) {

            $hostInfo = & { $H = Get-Host; $H.ui.rawui; }
            Clear-Host
            Write-Host "Hold on.. launching query".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
            $browser = $null;
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

            if ($null -eq $browser) {

                if ([System.Windows.Forms.Screen]::AllScreens.Length -lt 2) {

                    $browser = Open-Webbrowser -NewWindow -RestoreFocus -Chromium -Right -Url $Url -PassThrough
                }
                else {
                    $browser = Open-Webbrowser -NewWindow -FullScreen -RestoreFocus -Chromium -Url $Url -PassThrough
                }
            }

            Start-Sleep 3
            Select-WebbrowserTab -Name "*youtube*" | Out-Null

            $job = Invoke-WebbrowserTabPollingScript -Scripts @("$PSScriptRoot\Open-AllYoutubeVideos.js")

            while ([Console]::KeyAvailable) { [Console]::ReadKey(); }

            while ($null -ne $job -and $job.State -ne "Running") {
                Start-Sleep 1
                $job = Get-Job $job.Name -ErrorAction SilentlyContinue
            }
            [int] $scrollPosition = -1;
            [int] $scrollPosition2 = -1;
            while ($null -ne $job -and $job.State -eq "Running") {

                do {
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

                    $header = "$($Global:data.title)".PadRight($hostInfo.WindowSize.Width, " ");
                    if ($header.Length -gt $hostInfo.WindowSize.Width) {

                        $scrollPosition2 = ($scrollPosition2 + 1) % $header.length;
                        $header = "$header $header".Substring($scrollPosition, $hostInfo.WindowSize.Width);
                    }

                    Write-Host $header -ForegroundColor ([ConsoleColor]::black) -BackgroundColor ([ConsoleColor]::Gray)
                    [int] $nn = 0; Write-Host ((("$($Global:data.description)".Replace("Show less", "").Replace("Show more", "").Replace("`r", "").Replace("`n", "`r").Replace("`t", " ") -Split "`r"  | ForEach-Object -ErrorAction SilentlyContinue { if ([string]::IsNullOrWhiteSpace($PSItem)) { $nn = $nn + 1; } else { $nn = 0 } if ($nn -lt 2) { $s = $PSItem.Trim(); for ([int] $i = $hostInfo.WindowSize.Width - 1; $i -lt $s.length - 1; $i += $hostInfo.WindowSize.Width - 3) { $s = $s.substring(0, $i) + "`r" + $s.substring($i); } $s } }) -Join "`r" -Split "`r" | Select-Object -First ($hostInfo.WindowSize.Height - 3)) -Join "`r`n")
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
                                Stop-Job $job.Name -ErrorAction SilentlyContinue | Out-Null
                                $browser.CloseMainWindow();
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
                                Invoke-WebbrowserEvaluation "fakeClick(document.querySelector('#subscribe-button tp-yt-paper-button'))" -ErrorAction SilentlyContinue | Out-Null
                                Invoke-WebbrowserEvaluation "fakeClick(document.querySelector('#confirm-button tp-yt-paper-button'))" -ErrorAction SilentlyContinue | Out-Null
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
                    }
                } while ([Console]::KeyAvailable);

                Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                Invoke-WebbrowserEvaluation "
                    window.video = document.getElementsByTagName('video')[0];
                    window.video.setAttribute('style','position:fixed;left:0;top:0;bottom:0;right:0;z-index:10000;width:100vw;height:100vh');

                    if (!document.getElementById('genxbackground')) {
                        window.video.onended = () => { window.close() };
                        let div = document.createElement('div'); document.body.appendChild(div);div.setAttribute('style', 'position:fixed;left:0;top:0;bottom:0;right:0;z-index:9999;width:100vw;height:100vh;background-color:black;');
                        document.body.appendChild(window.video);document.body.setAttribute('style', 'overflow:hidden');
                    }

                    data.description = document.getElementById('description').innerText;
                    data.title = document.querySelector('h1.title').innerText;
                    data.subscribeTitle = document.querySelector('#subscribe-button').innerText.trim()
                    window.video.setAttribute('style','position:fixed;left:0;top:0;bottom:0;right:0;z-index:10000;width:100vw;height:100vh');
                    data.playing = !window.video.paused;
                    data.position = window.video.currentTime;
                    data.duration = window.video.duration;
                " -ErrorAction SilentlyContinue | Out-Null;

                $job = Get-Job $job.Name -ErrorAction SilentlyContinue
            }

            while ([Console]::KeyAvailable) { [Console]::ReadKey(); }
        }

        try {
            if ($Subscriptions -eq $true) {

                go "https://www.youtube.com/feed/subscriptions"
            }
            if ($WatchLater -eq $true) {

                go "https://www.youtube.com/playlist?list=WL"
            }

            if (($Subscriptions -ne $true) -and ($WatchLater -ne $true) -and ($Queries.Length -gt 0) -and ([string]::IsNullOrWhiteSpace($Queries[0]) -eq $false)) {

                foreach ($Query in $Queries) {

                    go "https://www.youtube.com/results?search_query=$([Uri]::EscapeUriString($Query))"
                }

                return;
            }

            if (($Subscriptions -ne $true) -and ($WatchLater -ne $true) -and (($Queries.Length -eq 0) -or ([string]::IsNullOrWhiteSpace($Queries[0]) -eq $true))) {

                go "https://www.youtube.com/"
            }
        }
        finally {
            Clear-Host
        }
    }
}

##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Executes all Text query Cmdlets in parallel

.DESCRIPTION
Executes all Text query Cmdlets in parallel and shows the results

.PARAMETER Queries
The query to perform
#>
function Open-AllPossibleTextQueries {

    [CmdletBinding()]
    [Alias("qqq")]

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

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        foreach ($Query in $Queries) {

            try {

                Clear-Host

                [Uri] $uri = $null;

                $q = $Query.Trim("`"").Trim("'");
                $isUri = (

                    [Uri]::TryCreate($q, "absolute", [ref] $uri) -or (
                        $Query.ToLowerInvariant().StartsWith("www.") -and
                        [Uri]::TryCreate("http://$q", "absolute", [ref] $uri)
                    )
                ) -and $uri.IsWellFormedOriginalString() -and $uri.Scheme -like "http*";

                if ($isUri) {

                    "`r`nSearched for URL : $Query" | Write-Host -ForegroundColor "DarkGreen"

                    Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
                    ForEach-Object Name |
                    ForEach-Object -ThrottleLimit 64 -Parallel {

                        if ($using:isUri -and $PSItem.EndsWith("SiteSummary") -and $PSItem.StartsWith("Get-")) {

                            try {

                                "`r`n" + $PSItem.SubString("Get-".Length, $PSItem.Length - "Get-SiteSummary".Length) + ":" | Write-Host -ForegroundColor "Blue"

                                $exp = Invoke-Expression "$PSItem $($using:uri.DnsSafeHost)"
                                Write-Output $exp

                                if ($PSItem.EndsWith("HostSiteSummary") -eq $false) {

                                    $safeUrl = ($using:Query).Split("#")[0];

                                    if ($using:Uri.Query.Length -gt 0) {

                                        $safeUrl = $safeUrl.Replace($using:Uri.Query, "");
                                    }

                                    $line = "`r`n" + $PSItem.SubString("Get-".Length, $PSItem.Length - "Get-HostSiteSummary".Length).Replace("Gpt3", "Generative Pre-trained Transformer 3 (GPT-3) - ") + ":`r`n";
                                    $line = $line + (Invoke-Expression "$PSItemsafeUrl") + "`r`n"

                                    Write-Output $line;
                                }
                            }
                            Catch {

                            }
                        }
                    }
                    return;
                }
            }
            catch {
                throw $PSItem
            }

            "`r`nSearched for: $Query" | Write-Host -ForegroundColor "DarkGreen"

            Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
            ForEach-Object Name |
            ForEach-Object -ThrottleLimit 64 -Parallel {

                if ($PSItem.EndsWith("Summary") -and $PSItem.StartsWith("Get-")) {

                    try {

                        $line = "`r`n" + $PSItem.SubString("Get-".Length, $PSItem.Length - "Get-Summary".Length).Replace("Gpt3", "Generative Pre-trained Transformer 3 (GPT-3) - ") + ":`r`n";
                        $line = $line + (Invoke-Expression "$PSItem $using:Query") + "`r`n"

                        Write-Output $line;
                    }
                    catch {

                    }
                }
            } |
            ForEach-Object {

                $lines = $PSItem.Split("`r`n", [System.StringSplitOptions]::RemoveEmptyEntries);
                "`r`n$($lines[0])" | Write-Host -ForegroundColor Yellow;
                $lines | Select-Object -Skip 1 | Write-Output
            }

            "`r`n-------------" | Write-Host -ForegroundColor "DarkGreen"
        }
    }
}

######################################################################################################################################################

function Open-AllPossibleQueries {

    # DESCRIPTION Open-AllPossibleQueries: Open-AllPossibleQueries: Executes all CmdLets that handle webqueries for provided query

    [CmdletBinding()]
    [Alias("qq")]

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
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        Write-Verbose "Open-AllPossibleQueries Monitor = $Monitor"

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {
        $PSBoundParameters.Remove("Queries") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            try {

                [Uri] $uri = $null;

                $q = $Query.Trim("`"").Trim("'");
                $isUri = (

                    [Uri]::TryCreate($q, "absolute", [ref] $uri) -or (
                        $Query.ToLowerInvariant().StartsWith("www.") -and
                        [Uri]::TryCreate("http://$q", "absolute", [ref] $uri)
                    )
                ) -and $uri.IsWellFormedOriginalString() -and $uri.Scheme -like "http*";

                if ($isUri) {

                    Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
                    ForEach-Object Name |
                    ForEach-Object -Process {

                        if ($isUri -and $PSItem.EndsWith("SiteInfo") -and $PSItem.StartsWith("Open-")) {

                            Invoke-Expression "$PSItem $($uri.DnsSafeHost)"

                            if ($PSItem.EndsWith("HostSiteInfo") -eq $false) {

                                $safeUrl = $Query.Split("#")[0];

                                if ($Uri.Query.Length -gt 0) {

                                    $safeUrl = $safeUrl.Replace($Uri.Query, "");
                                }

                                try {
                                    $PSBoundParameters.Add("Url", $safeUrl) | Out-Null;
                                    & $PSItem @PSBoundParameters
                                    $PSBoundParameters.Remove("Url") | Out-Null;

                                }
                                Catch {
                                    Write-Warning "
                                      $($_.Exception) $($_.InvocationInfo.PositionMessage)
                                      $($_.InvocationInfo.Line)
                                  "
                                }

                            }
                        }
                    }
                    return;
                }
            }
            catch {
                throw $PSItem
            }


            Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
            ForEach-Object Name |
            ForEach-Object -Process {

                if ($PSItem.EndsWith("Query") -and $PSItem.StartsWith("Open-")) {

                    $Query = $Query.Replace("`"", "```"");
                    try {
                        $PSBoundParameters.Add("Queries", @($Query)) | Out-Null;
                        & $PSItem @PSBoundParameters
                        $PSBoundParameters.Remove("Queries") | Out-Null;
                    }
                    Catch {
                        Write-Warning "
                          $($_.Exception) $($_.InvocationInfo.PositionMessage)
                          $($_.InvocationInfo.Line)
                      "
                    }
                }
            }
        }
    }
}
######################################################################################################################################################
function Open-GoogleQuery {

    # DESCRIPTION Open-GoogleQuery: Opens a google query in a webbrowser, in a configurable manner, using commandline switches

    [CmdletBinding()]
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
        ####################################################################################################
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

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.google.com/search?q=$([Uri]::EscapeUriString($Query))";

            Open-Webbrowser @PSBoundParameters
        }
    }
}


##############################################################################################################
##############################################################################################################


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
        ###################################################################
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


##############################################################################################################
##############################################################################################################

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
        ####################################################################################################
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
        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://en.wikipedia.org/wiki/Special:Search?search=$([Uri]::EscapeUriString($Query))";

            Open-Webbrowser @PSBoundParameters
        }
    }
}

##############################################################################################################
##############################################################################################################

function Open-WikipediaNLQuery {

    # DESCRIPTION Open-WikipediaNLQuery: Opens a 'Wikipedia - The Netherlands' query in a webbrowser, in a configurable manner, using commandline switches

    [CmdletBinding()]
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
        ####################################################################################################
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

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://nl.wikipedia.org/wiki/Special:Search?search=$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

##############################################################################################################
##############################################################################################################

function Open-YoutubeQuery {

    # DESCRIPTION Open-YoutubeQuery: Opens a Youtube query in a webbrowser, in a configurable manner, using commandline switches

    [CmdletBinding()]
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
        ####################################################################################################
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

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.youtube.com/results?search_query=$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

##############################################################################################################
##############################################################################################################

function Open-IMDBQuery {

    # DESCRIPTION Open-IMDBQuery: Opens a "Internet Movie Database" query in a webbrowser, in a configurable manner, using commandline switches

    [CmdletBinding()]
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
        ####################################################################################################
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

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.imdb.com/find?q=$([Uri]::EscapeUriString($Query))&ref_=nv_sr_sm="

            Open-Webbrowser @PSBoundParameters
        }
    }
}

##############################################################################################################
##############################################################################################################

function Open-StackOverflowQuery {

    # DESCRIPTION Open-StackOverflowQuery: Opens a "Stack Overflow" query in a webbrowser, in a configurable manner, using commandline switches

    [CmdletBinding()]
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
        ####################################################################################################
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

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://stackoverflow.com/search?q=$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

##############################################################################################################
##############################################################################################################

function Open-WolframAlphaQuery {

    # DESCRIPTION Open-WolframAlphaQuery: Opens a "Wolfram Alpha" query in a webbrowser, in a configurable manner, using commandline switches

    [CmdletBinding()]
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
        ####################################################################################################
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

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.wolframalpha.com/input/?i=$([Uri]::EscapeUriString($Query))";

            Open-Webbrowser @PSBoundParameters
        }
    }
}

##############################################################################################################
##############################################################################################################

function Open-GithubQuery {

    # DESCRIPTION Open-GithubQuery: Opens a Github query in a webbrowser, in a configurable manner, using commandline switches

    [CmdletBinding()]
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
        ####################################################################################################
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
        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Remove("Language") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://github.com/search?q=$([Uri]::EscapeUriString($Query))$Language&type=repositories"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

######################################################################################################################################################
######################################################################################################################################################

function Open-GoogleSiteInfo {

    # DESCRIPTION Open-GoogleSiteInfo: Opens a "Google siteinfo" query in a webbrowser, in a configurable manner, using commandline switches

    [CmdletBinding()]
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
        ####################################################################################################
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


##############################################################################################################
##############################################################################################################

function Open-BuiltWithSiteInfo {

    # DESCRIPTION Open-BuiltWithSiteInfo: Opens a BuildWith query in a webbrowser, in a configurable manner, using commandline switches

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
        ####################################################################################################
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

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://builtwith.com/?$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

##############################################################################################################
##############################################################################################################

function Open-WhoisHostSiteInfo {

    # DESCRIPTION Open-WhoisHostSiteInfo: Opens a "Whois HostInfo" query in a webbrowser, in a configurable manner, using commandline switches

    [CmdletBinding()]
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
        ####################################################################################################
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

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://whois.domaintools.com/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

##############################################################################################################
##############################################################################################################

function Open-WaybackMachineSiteInfo {

    # DESCRIPTION Open-WaybackMachineSiteInfo: Opens a Waybackmachine query in a webbrowser, in a configurable manner, using commandline switches

    [CmdletBinding()]
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
        ####################################################################################################
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

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://web.archive.org/web/*/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

##############################################################################################################
##############################################################################################################

function Open-SimularWebSiteInfo {

    # DESCRIPTION Open-SimularWebSiteInfo: Opens a "Simular web" query in a webbrowser, in a configurable manner, using commandline switches

    [CmdletBinding()]
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
        ####################################################################################################
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

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.similarweb.com/website/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}


##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Performs a "Wikipedia summary" text query

.DESCRIPTION
Performs a "Wikipedia summary" text query

.PARAMETER Queries
The query to perform
#>
function Get-WikipediaSummary {

    [CmdletBinding()]
    [Alias("wikitxt")]

    Param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [Parameter(
            Mandatory = $True,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {
        function fixWiki ([string]$text) {

            $input | ForEach-Object -Process {

                $i = $_.IndexOf("(")

                if ($i -lt 150) {

                    if ($result.Length - 1 -eq $i) {

                        Write-Output $result.SubString(0, $i).Replace("  ", " ");
                    }
                    else {

                        $end = $_.IndexOf(")", $i);

                        $result = $_.Substring(0, $i)

                        if ($end -lt $_.Length) {

                            $result = $result + $_.Substring($end + 1)
                        }

                        Write-Output $result.Replace("  ", " ");
                    }
                }
            }
        }

        foreach ($Query in $Queries) {

            $urlPart = [Uri]::EscapeUriString($Query.Replace("-", " "))

            $url = ("https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=1&explaintext=1&titles=" + $urlPart)

            $r = (Invoke-WebRequest -Uri $url -MaximumRedirection 20).Content | ConvertFrom-Json

            $memberName = ($r.query.pages | Get-Member | Where-Object -Property "MemberType" -EQ "NoteProperty" | Select-Object -ExpandProperty "Name" | Select-Object -First 1)

            $value = ($r.query.pages | Select-Object -ExpandProperty $memberName)

            $result = $value.extract

            if ((!$result) -or ($result -eq "")) {

                "Nothing found on `"$Query`".."
                continue;
            }

            try {

                $result = ($result | fixWiki)
            }
            catch {

                $result = $value.extract
            }

            $result
        }
    }
}

##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Performs a "Generative Pre-trained Transformer 3 (GPT-3), question" text query

.DESCRIPTION
Performs a "Generative Pre-trained Transformer 3 (GPT-3), question" text query

.PARAMETER Queries
The query to perform
#>
function Get-Gpt3QuestionSummary {

    [CmdletBinding()]
    [Alias("q3")]

    Param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [Parameter(
            Mandatory = $True,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries

        if ([string]::IsNullOrWhiteSpace($Global:GPT3ApiKey)) {

            throw "No api key found, please set `$Global:GPT3ApiKey variable in your profile script"
        }
    }

    process {

        foreach ($Query in $Queries) {

            $result = [GenXdev.Helpers.GPT3]::AskQuestion($Global:GPT3ApiKey, $Query)

            if ((!$result) -or ($result -eq "") -or ($result.Result -like "Unknown *")) {

                "Nothing found on `"$Query`".."

                continue;
            }

            "$($result.Result)".Trim();
        }
    }
}

##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Performs a "Generative Pre-trained Transformer 3 (GPT-3), English summary" text query

.DESCRIPTION
Performs a "Generative Pre-trained Transformer 3 (GPT-3), English summary" text query

.PARAMETER Queries
The query to perform
#>
function Get-Gpt3EnglishSummary {

    [CmdletBinding()]
    [Alias("q3")]

    Param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [Parameter(
            Mandatory = $True,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ([string]::IsNullOrWhiteSpace($Global:GPT3ApiKey)) {

            throw "No api key found, please set `$Global:GPT3ApiKey variable in your profile script"
        }

        foreach ($Query in $Queries ) {

            $result = [GenXdev.Helpers.GPT3]::CorrectGrammar($Global:GPT3ApiKey, $Query, "English")

            if ((!$result) -or ($result -eq "") -or ($result.Result -like "Unknown *")) {

                return "Nothing found on `"$Query`".."
            }

            "$($result.Result)".Split("`n")[0].Trim();
        }
    }
}

##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Performs a "Generative Pre-trained Transformer 3 (GPT-3), Dutch summary" text query

.DESCRIPTION
Performs a "Generative Pre-trained Transformer 3 (GPT-3), Dutch summary" text query

.PARAMETER Queries
The query to perform
#>
function Get-Gpt3DutchSummary {

    [CmdletBinding()]
    [Alias("q3")]

    Param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [Parameter(
            Mandatory = $True,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries
    )


    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries

        if ([string]::IsNullOrWhiteSpace($Global:GPT3ApiKey)) {

            throw "No api key found, please set `$Global:GPT3ApiKey variable in your profile script"
        }
    }

    process {

        foreach ($Query in $Queries) {
            $result = [GenXdev.Helpers.GPT3]::CorrectGrammar($Global:GPT3ApiKey, $Query, "Dutch")

            if ((!$result) -or ($result -eq "") -or ($result.Result -like "Unknown *")) {

                "Nothing found on `"$Query`".."
                continue;
            }

            "$($result.Result)".Split("`n")[0].Trim();
        }
    }
}


##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Returns a random affirmation text

.DESCRIPTION
Returns a random affirmation text

.PARAMETER Speak
Use text-to-speech to speak out affirmation
#>
function Get-NextAffirmations {

    [CmdletBinding()]
    [Alias("WhatAboutIt")]

    Param(
        [Parameter(
            Mandatory = $False,
            Position = 0
        )]
        [Switch] $Speak
    )

    $affirmation = (Invoke-RestMethod https://www.affirmations.dev/).affirmation;

    if ($Speak -eq $true) {

        say $affirmation
    }

    Write-Output $affirmation
}

##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Returns a random joke

.DESCRIPTION
Returns a random joke

.PARAMETER Speak
Use text-to-speech to speak out the joke
#>
function Get-NextJoke {

    [CmdletBinding()]
    [Alias("TellAJoke")]

    Param(
        [Parameter(
            Mandatory = $False,
            Position = 0
        )]
        [Switch] $Speak
    )

    $joke = [System.Web.HttpUtility]::HtmlDecode((Invoke-RestMethod https://icanhazdadjoke.com/ -Headers @{"Accept" = "text/plain" }));

    if ($Speak -eq $true) {

        say $joke
    }

    Write-Output $joke
}


##############################################################################################################
##############################################################################################################
function Open-Repeaters {

    # DESCRIPTION Open-Repeaters: Opens HobbyScoop, Dutch amateur repeater status page

    [CmdletBinding()]

    Param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [Parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateSet("PI2NOS", "PI3UTR", "PI3GOE", "MEETNET", "PI6NOS", "PI1DFT")]
        [string[]] $Repeaters = @("PI6NOS"),
        ####################################################################################################
        [Alias("fs", "f")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Opens in fullscreen mode"
        )]
        [switch] $FullScreen,
        ####################################################################################################
        [Alias("a", "app", "appmode")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "FullScreen", "ApplicationMode"
    }

    process {

        $PSBoundParameters.Add("Url", "https://pc7x.net/repeaters/") | Out-Null;
        $PSBoundParameters.Remove("Repeaters") | Out-Null;

        if ($PSBoundParameters.ContainsKey("FullScreen") -eq $false) {

            $PSBoundParameters.Add("FullScreen", $true);
        }

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }

        foreach ($Repeater in $Repeaters) {

            $PSBoundParameters["Url"] = "https://pc7x.net/repeaters/#/map/google/$($Repeater.ToLowerInvariant())";

            Open-Webbrowser @PSBoundParameters
        }
    }
}

##############################################################################################################
##############################################################################################################

function Open-Timeline {

    # DESCRIPTION Open-Timeline: Opens an interactive timeline, showing the current time, date, centery, millenium

    [CmdletBinding()]
    [Alias("timeline")]

    Param(
        ####################################################################################################
        [Alias("fs", "f")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Opens in fullscreen mode"
        )]
        [switch] $FullScreen,
        ####################################################################################################
        [Alias("a", "app", "appmode")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "FullScreen", "ApplicationMode"
    }

    process {

        $PSBoundParameters.Add("Url", "https://pc7x.net/detijdonline/") | Out-Null;

        if ($PSBoundParameters.ContainsKey("FullScreen") -eq $false) {

            $PSBoundParameters.Add("FullScreen", $true);
        }

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }

        Open-Webbrowser @PSBoundParameters
    }
}


##############################################################################################################
##############################################################################################################

function Open-GameOfLife {

    # DESCRIPTION Open-GameOfLife: Opens an interactive game-of-life simulation

    [CmdletBinding()]
    [Alias("gameoflife", "conway")]

    Param(
        ####################################################################################################
        [Alias("fs", "f")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Opens in fullscreen mode"
        )]
        [switch] $FullScreen,
        ####################################################################################################
        [Alias("a", "app", "appmode")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "FullScreen", "ApplicationMode"
    }

    process {

        $PSBoundParameters.Add("Url", "https://pc7x.net/conway/") | Out-Null;

        if ($PSBoundParameters.ContainsKey("FullScreen") -eq $false) {

            $PSBoundParameters.Add("FullScreen", $true);
        }

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }

        Open-Webbrowser @PSBoundParameters
    }
}


##############################################################################################################
##############################################################################################################

function Open-ViralSimulation {

    # DESCRIPTION Open-ViralSimulation: Opens a very simple, interactive infection simulation

    [CmdletBinding()]
    [Alias("viral")]

    Param(
        ####################################################################################################
        [Alias("fs", "f")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Opens in fullscreen mode"
        )]
        [switch] $FullScreen,
        ####################################################################################################
        [Alias("a", "app", "appmode")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "FullScreen", "ApplicationMode"
    }

    process {

        $PSBoundParameters.Add("Url", "https://pc7x.net/viral/") | Out-Null;

        if ($PSBoundParameters.ContainsKey("FullScreen") -eq $false) {

            $PSBoundParameters.Add("FullScreen", $true);
        }

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }

        Open-Webbrowser @PSBoundParameters
    }
}


##############################################################################################################
##############################################################################################################

function Open-Yab {

    # DESCRIPTION Open-Yab: Opens an interactive block-falling-game in single playermode

    [CmdletBinding()]
    [Alias("yab")]

    Param(
        ####################################################################################################
        [Alias("fs", "f")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Opens in fullscreen mode"
        )]
        [switch] $FullScreen,
        ####################################################################################################
        [Alias("a", "app", "appmode")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "FullScreen", "ApplicationMode", "Monitor"
    }

    process {

        $PSBoundParameters.Add("Url", "https://yab.pc7x.net/#/single/marathon/") | Out-Null;

        if ($PSBoundParameters.ContainsKey("FullScreen") -eq $false) {

            $PSBoundParameters.Add("FullScreen", $true);
        }

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        Open-Webbrowser @PSBoundParameters
    }
}

##############################################################################################################
##############################################################################################################

function Open-YabAIBattle {

    # DESCRIPTION Open-YabAIBattle: Opens an interactive block-falling-game in battle AI mode

    [CmdletBinding()]
    [Alias("yabbattle")]

    Param(
        ####################################################################################################
        [Alias("fs", "f")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Opens in fullscreen mode"
        )]
        [switch] $FullScreen,
        ####################################################################################################
        [Alias("a", "app", "appmode")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "FullScreen", "ApplicationMode", "Monitor"
    }

    process {

        $PSBoundParameters.Add("Url", "https://yab.pc7x.net/#/ai/battle/") | Out-Null;

        if ($PSBoundParameters.ContainsKey("FullScreen") -eq $false) {

            $PSBoundParameters.Add("FullScreen", $true);
        }

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }


        Open-Webbrowser @PSBoundParameters
    }
}


##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Executes a background polling script in a previously selected webbrowser tab.

.DESCRIPTION
Executes a background polling script in a previously selected webbrowser tab.

.PARAMETER Scripts
The scripts to load

.PARAMETER Callback
A scriptblock that gets executed each time the tab has been polled

.NOTES
Requires the Windows 10+ Operating System
#>
function Invoke-WebbrowserTabPollingScript {

    [CmdletBinding()]

    param(
        [Parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = "A string containing javascript, a url or a file reference to a javascript file",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)
        ]
        [Alias('FullName')]
        [object[]] $Scripts,

        [parameter(
            HelpMessage = "An optional url to navigate to, before polling starts"
        )]
        [string] $InitialUrl = $null,

        [parameter(
            Mandatory = $false
        )] [ScriptBlock] $Callback = $null
    )

    Start-ThreadJob -InitializationScript { Import-Module GenXdev.Queries; } -ScriptBlock {

        param ($Scripts, $Reference, $InitialUrl)

        $Global:data = @{

            urls  = @();
            query = $Query
        }

        Select-WebbrowserTab -ByReference $Reference

        if (![string]::IsNullOrWhiteSpace($InitialUrl)) {

            Invoke-WebbrowserEvaluation "document.location.href='$InitialUrl'" -NoAutoSelectTab | Out-Null
        }

        do {
            Start-Sleep 1 | Out-Null

            Invoke-WebbrowserEvaluation -Scripts $Scripts -NoAutoSelectTab | Out-Null

            if ($null -ne $Callback) {

                try {
                    Invoke-Command -ScriptBlock $Callback -ErrorAction SilentlyContinue
                }
                catch {

                    Write-Warning $PSItem.Exception
                }

                Select-WebbrowserTab -ByReference $Reference
            }
        }
        while ($Global:data.more)

    } -ArgumentList($Scripts, (Get-ChromiumSessionReference), $InitialUrl)
}

##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Helper function for allowing different commandline parsing for query parameters

.DESCRIPTION
Helper function for allowing different commandline parsing for query parameters
#>
function Build-InvocationArguments {

    param(
        [parameter(Mandatory, Position = 0)]
        $InvocationInfo,

        [parameter(Mandatory = $false, Position = 1)]
        [string[]] $Arguments = @(),

        [parameter(Mandatory = $false, Position = 2)]
        [switch] $SingleString
    )

    begin {

        $ParameterInfo = $InvocationInfo.MyCommand.Parameters.GetEnumerator() | Select-Object -First 1
        $ParameterNameAndAliases = @($ParameterInfo.Key) + $ParameterInfo.Value.Aliases;
        $SingleString = ($SingleString -eq $true) -or ($ParameterInfo.Value.ParameterType -eq [string]);
    }

    process {

        function getArgumentCount($InvocationInfo, $Container) {

            $argumentCount = 1;
            $argumentToSkip = 0;

            foreach ($argument in $Container) {

                if ($argument.StartsWith("-")) {

                    $argumentName = $argument.Substring(1).Trim();
                    foreach ($keyValue in $InvocationInfo.MyCommand.Parameters.GetEnumerator()) {

                        $match = $keyValue.Key -like $argumentName;

                        if (!$match) {

                            foreach ($alias in $keyValue.Value.Aliases) {

                                if ($alias -like $argumentName) {
                                    $match = $true;
                                    break;
                                }
                            }
                        }

                        if ($match) {

                            $argumentToSkip = 2;
                            if ($keyValue.Value.SwitchParameter) {

                                $argumentToSkip = 1;
                            }

                            break;
                        }
                    }
                }

                if ($argumentToSkip -gt 0) {

                    $argumentToSkip = $argumentToSkip - 1;
                    continue;
                }

                if ($argument.Contains(",")) {

                    $parts = $argument.Split(",");

                    $argumentCount += $parts.Length - 1;
                }
            }

            return $argumentCount;
        }

        function hasParamOrQuotes($InvocationInfo, $Container) {

            $argumentToSkip = 0;

            foreach ($argument in $Container) {

                if ($argument.StartsWith("-")) {

                    $argumentName = $argument.Substring(1).Trim();
                    foreach ($keyValue in $InvocationInfo.MyCommand.Parameters.GetEnumerator()) {

                        $match = $keyValue.Key -like $argumentName;

                        if (!$match) {

                            foreach ($alias in $keyValue.Value.Aliases) {

                                if ($alias -like $argumentName) {
                                    $match = $true;
                                    break;
                                }
                            }
                        }

                        if ($match) {

                            $argumentToSkip = 2;
                            if ($keyValue.Value.SwitchParameter) {

                                $argumentToSkip = 1;
                            }

                            break;
                        }
                    }
                }

                if ($argumentToSkip -gt 0) {

                    $argumentToSkip = $argumentToSkip - 1;
                    continue;
                }

                if ($argument -like "@*") { return $true; }
                if ($argument -like "*`"*") { return $true; }
                if ($argument -like "*`$*") { return $true; }
                if ($argument -like "(*") { return $true; }

                continue;
            }

            return $false
        }

        function getSingleLineText($InvocationInfo, $Container) {

            $argumentText = [System.Text.StringBuilder]::new();
            $argumentToSkip = 0;

            foreach ($argument in $Container) {

                if ($argument.StartsWith("-")) {

                    $argumentName = $argument.Substring(1).Trim();
                    foreach ($keyValue in $InvocationInfo.MyCommand.Parameters.GetEnumerator()) {

                        $match = $keyValue.Key -like $argumentName;

                        if (!$match) {

                            foreach ($alias in $keyValue.Value.Aliases) {

                                if ($alias -like $argumentName) {
                                    $match = $true;
                                    break;
                                }
                            }
                        }

                        if ($match) {

                            $argumentToSkip = 2;
                            if ($keyValue.Value.SwitchParameter) {

                                $argumentToSkip = 1;
                            }

                            break;
                        }
                    }
                }

                if ($argumentToSkip -gt 0) {

                    $argumentToSkip = $argumentToSkip - 1;
                    continue;
                }

                if ($argument.Contains(",")) {

                    $parts = $argument.Split(",");

                    for ($i = 0; $i -lt $parts.Length; $i++) {

                        if ($i -gt 0) {

                            $currentIndex++;
                        }

                        $argumentText.Append("$($parts[$i]) ") | Out-Null
                    }
                }
                else {


                    $argumentText.Append("$argument ") | Out-Null
                }
            }

            return $argumentText.ToString().Trim();
        }

        function getArgument($InvocationInfo, $Container, [int] $argumentIndex) {

            [int] $currentIndex = 0;

            $argumentText = [System.Text.StringBuilder]::new();
            $argumentToSkip = 0;

            foreach ($argument in $Container) {

                if ($argument.StartsWith("-")) {

                    $argumentName = $argument.Substring(1).Trim();
                    foreach ($keyValue in $InvocationInfo.MyCommand.Parameters.GetEnumerator()) {

                        $match = $keyValue.Key -like $argumentName;

                        if (!$match) {

                            foreach ($alias in $keyValue.Value.Aliases) {

                                if ($alias -like $argumentName) {
                                    $match = $true;
                                    break;
                                }
                            }
                        }

                        if ($match) {

                            $argumentToSkip = 2;
                            if ($keyValue.Value.SwitchParameter) {

                                $argumentToSkip = 1;
                            }

                            break;
                        }
                    }
                }

                if ($argumentToSkip -gt 0) {

                    $argumentToSkip = $argumentToSkip - 1;
                    continue;
                }

                if ($argument.Contains(",")) {

                    $parts = $argument.Split(",");

                    for ($i = 0; $i -lt $parts.Length; $i++) {

                        if ($i -gt 0) {

                            $currentIndex++;
                        }

                        if ($currentIndex -eq $argumentIndex) {

                            $argumentText.Append("$($parts[$i]) ") | Out-Null
                        }

                        if ($currentIndex -gt $argumentIndex) {

                            break;
                        }
                    }
                }
                else {

                    if ($currentIndex -eq $argumentIndex) {

                        $argumentText.Append("$argument ") | Out-Null
                    }
                }

                if ($currentIndex -gt $argumentIndex) {

                    break;
                }
            }

            return $argumentText.ToString().Trim();
        }

        $InInvocation = $false
        [bool] $HasNamedParameterSupplied = $false;
        $Container = $InvocationInfo.Line.Split("|;".ToCharArray()) | ForEach-Object -ErrorAction SilentlyContinue {

            $LinePart = $PSItem;
            $LinePart.Split(" ", [System.StringSplitOptions]::RemoveEmptyEntries) | ForEach-Object -ErrorAction SilentlyContinue {

                if ($InInvocation) {

                    $PSItem
                }

                if (!$InInvocation -and $PSItem -eq $InvocationInfo.InvocationName) {

                    $InInvocation = $true;
                }
            }

            if ($InInvocation) {

                foreach ($paramName in $ParameterNameAndAliases ) {
                    if ($PSItem -like "-$paramName") {

                        $HasNamedParameterSupplied = $true;
                    }
                }

                return;
            }
        }

        if ($HasNamedParameterSupplied) {

            return $Arguments;
        }

        [int] $argumentCount = getArgumentCount $InvocationInfo $Container
        [string] $singlelineStringValue = getSingleLineText $InvocationInfo $Container


        if ((hasParamOrQuotes $InvocationInfo $Container) -or ($argumentCount -lt 2 -and [string]::IsNullOrWhiteSpace($singlelineStringValue))) {

            return $Arguments
        }

        if ($SingleString -eq $true) {

            return $singlelineStringValue
        }

        $results = [System.Collections.Generic.List[string]]::new();

        for ([int] $argumentIndex = 0; $argumentIndex -lt $argumentCount; $argumentIndex++) {

            $results.Add((getArgument $InvocationInfo $Container $argumentIndex))
        }

        return $results.ToArray();
    }
}
