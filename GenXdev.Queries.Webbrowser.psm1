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
        [int] $Max = 200,
        ###############################################################################
        [ValidateSet(
            "Afrikaans",
            "Akan",
            "Albanian",
            "Amharic",
            "Arabic",
            "Armenian",
            "Azerbaijani",
            "Basque",
            "Belarusian",
            "Bemba",
            "Bengali",
            "Bihari",
            "Bork, bork, bork!",
            "Bosnian",
            "Breton",
            "Bulgarian",
            "Cambodian",
            "Catalan",
            "Cherokee",
            "Chichewa",
            "Chinese (Simplified)",
            "Chinese (Traditional)",
            "Corsican",
            "Croatian",
            "Czech",
            "Danish",
            "Dutch",
            "Elmer Fudd",
            "English",
            "Esperanto",
            "Estonian",
            "Ewe",
            "Faroese",
            "Filipino",
            "Finnish",
            "French",
            "Frisian",
            "Ga",
            "Galician",
            "Georgian",
            "German",
            "Greek",
            "Guarani",
            "Gujarati",
            "Hacker",
            "Haitian Creole",
            "Hausa",
            "Hawaiian",
            "Hebrew",
            "Hindi",
            "Hungarian",
            "Icelandic",
            "Igbo",
            "Indonesian",
            "Interlingua",
            "Irish",
            "Italian",
            "Japanese",
            "Javanese",
            "Kannada",
            "Kazakh",
            "Kinyarwanda",
            "Kirundi",
            "Klingon",
            "Kongo",
            "Korean",
            "Krio (Sierra Leone)",
            "Kurdish",
            "Kurdish (Soranî)",
            "Kyrgyz",
            "Laothian",
            "Latin",
            "Latvian",
            "Lingala",
            "Lithuanian",
            "Lozi",
            "Luganda",
            "Luo",
            "Macedonian",
            "Malagasy",
            "Malay",
            "Malayalam",
            "Maltese",
            "Maori",
            "Marathi",
            "Mauritian Creole",
            "Moldavian",
            "Mongolian",
            "Montenegrin",
            "Nepali",
            "Nigerian Pidgin",
            "Northern Sotho",
            "Norwegian",
            "Norwegian (Nynorsk)",
            "Occitan",
            "Oriya",
            "Oromo",
            "Pashto",
            "Persian",
            "Pirate",
            "Polish",
            "Portuguese (Brazil)",
            "Portuguese (Portugal)",
            "Punjabi",
            "Quechua",
            "Romanian",
            "Romansh",
            "Runyakitara",
            "Russian",
            "Scots Gaelic",
            "Serbian",
            "Serbo-Croatian",
            "Sesotho",
            "Setswana",
            "Seychellois Creole",
            "Shona",
            "Sindhi",
            "Sinhalese",
            "Slovak",
            "Slovenian",
            "Somali",
            "Spanish",
            "Spanish (Latin American)",
            "Sundanese",
            "Swahili",
            "Swedish",
            "Tajik",
            "Tamil",
            "Tatar",
            "Telugu",
            "Thai",
            "Tigrinya",
            "Tonga",
            "Tshiluba",
            "Tumbuka",
            "Turkish",
            "Turkmen",
            "Twi",
            "Uighur",
            "Ukrainian",
            "Urdu",
            "Uzbek",
            "Vietnamese",
            "Welsh",
            "Wolof",
            "Xhosa",
            "Yiddish",
            "Yoruba",
            "Zulu")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The language of the returned search results"
        )]
        [string] $Language = $null
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
        $LangKey = "&hl=en";

        if (![string]::IsNullOrWhiteSpace($Language)) {

            $LangKey = "&hl=en&lr=lang_$([Uri]::EscapeUriString((Get-WebLanguageDictionary)[$Language]))"
        }
    }

    process {

        foreach ($Query in $Queries) {

            $Global:Data = @{

                urls  = @();
                query = $Query
            }

            $Query = "$([Uri]::EscapeUriString($Query))"
            $Url = "https://www.google.com/search?q=$Query$LangKey"

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
        [string[]] $Queries,
        ###############################################################################
        [ValidateSet(
            "Afrikaans",
            "Akan",
            "Albanian",
            "Amharic",
            "Arabic",
            "Armenian",
            "Azerbaijani",
            "Basque",
            "Belarusian",
            "Bemba",
            "Bengali",
            "Bihari",
            "Bork, bork, bork!",
            "Bosnian",
            "Breton",
            "Bulgarian",
            "Cambodian",
            "Catalan",
            "Cherokee",
            "Chichewa",
            "Chinese (Simplified)",
            "Chinese (Traditional)",
            "Corsican",
            "Croatian",
            "Czech",
            "Danish",
            "Dutch",
            "Elmer Fudd",
            "English",
            "Esperanto",
            "Estonian",
            "Ewe",
            "Faroese",
            "Filipino",
            "Finnish",
            "French",
            "Frisian",
            "Ga",
            "Galician",
            "Georgian",
            "German",
            "Greek",
            "Guarani",
            "Gujarati",
            "Hacker",
            "Haitian Creole",
            "Hausa",
            "Hawaiian",
            "Hebrew",
            "Hindi",
            "Hungarian",
            "Icelandic",
            "Igbo",
            "Indonesian",
            "Interlingua",
            "Irish",
            "Italian",
            "Japanese",
            "Javanese",
            "Kannada",
            "Kazakh",
            "Kinyarwanda",
            "Kirundi",
            "Klingon",
            "Kongo",
            "Korean",
            "Krio (Sierra Leone)",
            "Kurdish",
            "Kurdish (Soranî)",
            "Kyrgyz",
            "Laothian",
            "Latin",
            "Latvian",
            "Lingala",
            "Lithuanian",
            "Lozi",
            "Luganda",
            "Luo",
            "Macedonian",
            "Malagasy",
            "Malay",
            "Malayalam",
            "Maltese",
            "Maori",
            "Marathi",
            "Mauritian Creole",
            "Moldavian",
            "Mongolian",
            "Montenegrin",
            "Nepali",
            "Nigerian Pidgin",
            "Northern Sotho",
            "Norwegian",
            "Norwegian (Nynorsk)",
            "Occitan",
            "Oriya",
            "Oromo",
            "Pashto",
            "Persian",
            "Pirate",
            "Polish",
            "Portuguese (Brazil)",
            "Portuguese (Portugal)",
            "Punjabi",
            "Quechua",
            "Romanian",
            "Romansh",
            "Runyakitara",
            "Russian",
            "Scots Gaelic",
            "Serbian",
            "Serbo-Croatian",
            "Sesotho",
            "Setswana",
            "Seychellois Creole",
            "Shona",
            "Sindhi",
            "Sinhalese",
            "Slovak",
            "Slovenian",
            "Somali",
            "Spanish",
            "Spanish (Latin American)",
            "Sundanese",
            "Swahili",
            "Swedish",
            "Tajik",
            "Tamil",
            "Tatar",
            "Telugu",
            "Thai",
            "Tigrinya",
            "Tonga",
            "Tshiluba",
            "Tumbuka",
            "Turkish",
            "Turkmen",
            "Twi",
            "Uighur",
            "Ukrainian",
            "Urdu",
            "Uzbek",
            "Vietnamese",
            "Welsh",
            "Wolof",
            "Xhosa",
            "Yiddish",
            "Yoruba",
            "Zulu")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The language of the returned search results"
        )]
        [string] $Language = $null
    )

    begin {

        $Query = Build-InvocationArguments $MyInvocation $Queries -SingleString
        $LangKey = "&hl=en";

        if (![string]::IsNullOrWhiteSpace($Language)) {

            $LangKey = "&hl=en&lr=lang_$([Uri]::EscapeUriString((Get-WebLanguageDictionary)[$Language]))"
        }
    }

    process {

        $Global:data = @{

            urls  = @();
            query = $Query
        }

        Invoke-WebbrowserTabPollingScript -Scripts @("$PSScriptRoot\Open-AllGoogleLinks.js") -InitialUrl "https://www.google.com/search?q=$([Uri]::EscapeUriString($Query))$LangKey"
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

        $LastVideo = "";
        $Queries = Build-InvocationArguments $MyInvocation $Queries
        $PowershellProcess = Get-PowershellMainWindowProcess
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

            if ($CurrentTab -ne $true) {

                if ($PowershellWindow.Count -gt 0) {

                    $PowershellScreen = [System.Windows.Forms.Screen]::FromPoint($PowershellWindow.Position());
                    $PowershellScreenIndex = [System.Windows.Forms.Screen]::AllScreens.IndexOf($PowershellScreen) + 1;

                    [int] $defaultMonitor = 1;

                    if ([int]::TryParse($Global:DefaultSecondaryMonitor, [ref] $defaultMonitor)) {

                        $Monitor = $defaultMonitor % ([System.Windows.Forms.Screen]::AllScreens.Length + 1);
                    }
                    else {

                        $Monitor = 2 % ([System.Windows.Forms.Screen]::AllScreens.Length + 1);
                    }

                    if ($monitor -lt 1) {

                        if ($monitor -lt 0) {

                            $monitor = $PowershellWindow;
                        }
                        else {

                            $monitor = [System.Windows.Forms.Screen]::AllScreens.IndexOf([System.Windows.Forms.Screen]::PrimaryScreen) + 1;
                        }
                    }

                    if ($PowershellScreenIndex -eq $Monitor) {

                        if ($PowershellScreen.WorkingArea.Width -gt $PowershellScreen.WorkingArea.Height) {

                            Set-WindowPosition -Left -Monitor $Monitor
                            $browser = Open-Webbrowser -NewWindow -RestoreFocus -Chromium -Right -Url $Url -PassThrough
                        }
                        else {

                            Set-WindowPosition -Bottom -Monitor $Monitor
                            $browser = Open-Webbrowser -NewWindow -RestoreFocus -Chromium -Top -Url $Url -PassThrough
                        }
                    }
                }

                if ($null -eq $browser) {

                    $browser = Open-Webbrowser -NewWindow -FullScreen -RestoreFocus -Chromium -Url $Url -PassThrough
                }
            }

            Select-WebbrowserTab -Name "*youtube*" | Out-Null

            $job = [System.IO.File]::ReadAllText("$PSScriptRoot\Open-AllYoutubeVideos.js");
            Invoke-WebbrowserEvaluation "window.oayvInitialized = false; $job"

            [int] $scrollPosition = -1;
            [int] $scrollPosition2 = -1;

            while ($true) {

                try {

                    $hostInfo = & { $H = Get-Host; $H.ui.rawui; }
                    $sub = ""; if (![string]::IsNullOrWhiteSpace($Global:data.subscribeTitle)) { $sub = " S = $($Global:data.subscribeTitle) |" }
                    if ($Global:data.playing) { $pause = " [P]ause |" } else { $pause = " [R]esume |" }
                    $header = "[Q]uit |$sub$pause SPACE=Next | [0]..[9] = skip | ◀ -20sec | +20sec ▶ | ".PadRight($hostInfo.WindowSize.Width, " ");
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
                    [Console]::SetCursorPosition(0, 0);
                    [Console]::ResetColor();

                    if ([Console]::KeyAvailable) {

                        [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2);
                        $c = [Console]::ReadKey();

                        switch ("$($c.KeyChar)".ToLowerInvariant()) {

                            "q" {
                                Clear-Host;
                                if ($null -ne $browser) {

                                    $browser.CloseMainWindow();
                                }
                                return;
                            }

                            " " {

                                Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                                Invoke-WebbrowserEvaluation "window.close()" -ErrorAction SilentlyContinue | Out-Null
                                Start-Sleep 1
                                Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                                $LastVideo = "";
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

                                $LastVideo = "";
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

                                $LastVideo = "";
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

                    if (($Global:chromeSessions.Count -eq 0) -or ($null -eq $Global:chrome)) {

                        throw "No active session"
                    }

                    Invoke-WebbrowserEvaluation "$job ;`r`n debugger; window.oayv.updatePage(data);" -ErrorAction SilentlyContinue | Out-Null;
                }
                catch {
                    if ($LastVideo -ne "") {
                        return;
                    }

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

    # DESCRIPTION Open-GoogleQuery: Opens a google query in a webbrowser, in a configurable manner, using commandline switches

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
        [int] $Monitor = -1,
        ###############################################################################
        [ValidateSet(
            "Afrikaans",
            "Akan",
            "Albanian",
            "Amharic",
            "Arabic",
            "Armenian",
            "Azerbaijani",
            "Basque",
            "Belarusian",
            "Bemba",
            "Bengali",
            "Bihari",
            "Bork, bork, bork!",
            "Bosnian",
            "Breton",
            "Bulgarian",
            "Cambodian",
            "Catalan",
            "Cherokee",
            "Chichewa",
            "Chinese (Simplified)",
            "Chinese (Traditional)",
            "Corsican",
            "Croatian",
            "Czech",
            "Danish",
            "Dutch",
            "Elmer Fudd",
            "English",
            "Esperanto",
            "Estonian",
            "Ewe",
            "Faroese",
            "Filipino",
            "Finnish",
            "French",
            "Frisian",
            "Ga",
            "Galician",
            "Georgian",
            "German",
            "Greek",
            "Guarani",
            "Gujarati",
            "Hacker",
            "Haitian Creole",
            "Hausa",
            "Hawaiian",
            "Hebrew",
            "Hindi",
            "Hungarian",
            "Icelandic",
            "Igbo",
            "Indonesian",
            "Interlingua",
            "Irish",
            "Italian",
            "Japanese",
            "Javanese",
            "Kannada",
            "Kazakh",
            "Kinyarwanda",
            "Kirundi",
            "Klingon",
            "Kongo",
            "Korean",
            "Krio (Sierra Leone)",
            "Kurdish",
            "Kurdish (Soranî)",
            "Kyrgyz",
            "Laothian",
            "Latin",
            "Latvian",
            "Lingala",
            "Lithuanian",
            "Lozi",
            "Luganda",
            "Luo",
            "Macedonian",
            "Malagasy",
            "Malay",
            "Malayalam",
            "Maltese",
            "Maori",
            "Marathi",
            "Mauritian Creole",
            "Moldavian",
            "Mongolian",
            "Montenegrin",
            "Nepali",
            "Nigerian Pidgin",
            "Northern Sotho",
            "Norwegian",
            "Norwegian (Nynorsk)",
            "Occitan",
            "Oriya",
            "Oromo",
            "Pashto",
            "Persian",
            "Pirate",
            "Polish",
            "Portuguese (Brazil)",
            "Portuguese (Portugal)",
            "Punjabi",
            "Quechua",
            "Romanian",
            "Romansh",
            "Runyakitara",
            "Russian",
            "Scots Gaelic",
            "Serbian",
            "Serbo-Croatian",
            "Sesotho",
            "Setswana",
            "Seychellois Creole",
            "Shona",
            "Sindhi",
            "Sinhalese",
            "Slovak",
            "Slovenian",
            "Somali",
            "Spanish",
            "Spanish (Latin American)",
            "Sundanese",
            "Swahili",
            "Swedish",
            "Tajik",
            "Tamil",
            "Tatar",
            "Telugu",
            "Thai",
            "Tigrinya",
            "Tonga",
            "Tshiluba",
            "Tumbuka",
            "Turkish",
            "Turkmen",
            "Twi",
            "Uighur",
            "Ukrainian",
            "Urdu",
            "Uzbek",
            "Vietnamese",
            "Welsh",
            "Wolof",
            "Xhosa",
            "Yiddish",
            "Yoruba",
            "Zulu")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The language of the returned search results"
        )]
        [string] $Language = $null
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
        [int] $Max = 200,
        ###############################################################################
        [ValidateSet(
            "Afrikaans",
            "Akan",
            "Albanian",
            "Amharic",
            "Arabic",
            "Armenian",
            "Azerbaijani",
            "Basque",
            "Belarusian",
            "Bemba",
            "Bengali",
            "Bihari",
            "Bork, bork, bork!",
            "Bosnian",
            "Breton",
            "Bulgarian",
            "Cambodian",
            "Catalan",
            "Cherokee",
            "Chichewa",
            "Chinese (Simplified)",
            "Chinese (Traditional)",
            "Corsican",
            "Croatian",
            "Czech",
            "Danish",
            "Dutch",
            "Elmer Fudd",
            "English",
            "Esperanto",
            "Estonian",
            "Ewe",
            "Faroese",
            "Filipino",
            "Finnish",
            "French",
            "Frisian",
            "Ga",
            "Galician",
            "Georgian",
            "German",
            "Greek",
            "Guarani",
            "Gujarati",
            "Hacker",
            "Haitian Creole",
            "Hausa",
            "Hawaiian",
            "Hebrew",
            "Hindi",
            "Hungarian",
            "Icelandic",
            "Igbo",
            "Indonesian",
            "Interlingua",
            "Irish",
            "Italian",
            "Japanese",
            "Javanese",
            "Kannada",
            "Kazakh",
            "Kinyarwanda",
            "Kirundi",
            "Klingon",
            "Kongo",
            "Korean",
            "Krio (Sierra Leone)",
            "Kurdish",
            "Kurdish (Soranî)",
            "Kyrgyz",
            "Laothian",
            "Latin",
            "Latvian",
            "Lingala",
            "Lithuanian",
            "Lozi",
            "Luganda",
            "Luo",
            "Macedonian",
            "Malagasy",
            "Malay",
            "Malayalam",
            "Maltese",
            "Maori",
            "Marathi",
            "Mauritian Creole",
            "Moldavian",
            "Mongolian",
            "Montenegrin",
            "Nepali",
            "Nigerian Pidgin",
            "Northern Sotho",
            "Norwegian",
            "Norwegian (Nynorsk)",
            "Occitan",
            "Oriya",
            "Oromo",
            "Pashto",
            "Persian",
            "Pirate",
            "Polish",
            "Portuguese (Brazil)",
            "Portuguese (Portugal)",
            "Punjabi",
            "Quechua",
            "Romanian",
            "Romansh",
            "Runyakitara",
            "Russian",
            "Scots Gaelic",
            "Serbian",
            "Serbo-Croatian",
            "Sesotho",
            "Setswana",
            "Seychellois Creole",
            "Shona",
            "Sindhi",
            "Sinhalese",
            "Slovak",
            "Slovenian",
            "Somali",
            "Spanish",
            "Spanish (Latin American)",
            "Sundanese",
            "Swahili",
            "Swedish",
            "Tajik",
            "Tamil",
            "Tatar",
            "Telugu",
            "Thai",
            "Tigrinya",
            "Tonga",
            "Tshiluba",
            "Tumbuka",
            "Turkish",
            "Turkmen",
            "Twi",
            "Uighur",
            "Ukrainian",
            "Urdu",
            "Uzbek",
            "Vietnamese",
            "Welsh",
            "Wolof",
            "Xhosa",
            "Yiddish",
            "Yoruba",
            "Zulu")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The language of the returned search results"
        )]
        [string] $Language = $null
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        foreach ($Query in $Queries) {

            if ([string]::IsNullOrWhiteSpace($Language)) {

                $list = Get-GoogleSearchResultUrls -Max $Max -Query "filetype:pdf $Query"
            }
            else {
                $list = Get-GoogleSearchResultUrls -Max $Max -Query "filetype:pdf $Query" -Language $Language
            }

            $list | ForEach-Object -ThrottleLimit 64 -Parallel {

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
<#
.SYNOPSIS
Opens a Bing chat query in a webbrowser

.DESCRIPTION
Opens a Bing chat query in a webbrowser, in a configurable manner, using commandline switches

.PARAMETER Force
Enforced that the debugging port is enabled, even if that means stopping all already opened browser processes
#>
function Open-BingChatQuery {

    [CmdletBinding()]
    [Alias("bc", "ask")]

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
        [int] $Monitor = -1,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Enforced that the debugging port is enabled, even if that means stopping all already opened browser processes"
        )]
        [switch] $Force
        ###############################################################################
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor", "NewWindow", "Force"
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

        if ($PSBoundParameters.ContainsKey("NewWindow") -eq $false) {

            $PSBoundParameters.Add("NewWindow", $true);
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        if ($PSBoundParameters.ContainsKey("Force") -eq $false) {

            $PSBoundParameters.Add("Force", $Force);
        }

        Set-WindowPosition -Left -Monitor -1;

        if ($PSBoundParameters.ContainsKey("Right") -eq $false) {

            $PSBoundParameters.Add("Right", $true);
        }

        $url = "https://www.bing.com/chat?q=Microsoft+Copilot&FORM=hpcodx";
        $PSBoundParameters["Url"] = $url;

        Open-Webbrowser @PSBoundParameters
        Start-Sleep 2;

        $helper = New-Object -ComObject WScript.Shell;

        $Queries | ForEach-Object {

            $helper.sendKeys("$PSItem");
            $helper.SendKeys('^');
            $helper.SendKeys('{enter}');
        }
        $helper.sendKeys("{enter}");
    }
}

###############################################################################
<#
.SYNOPSIS
Opens a Bing query in a webbrowser

.DESCRIPTION
Opens a Bing query in a webbrowser, in a configurable manner, using commandline switches

#>
function Open-BingQuery {

    [CmdletBinding()]
    [Alias("bq")]

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

            $PSBoundParameters["Url"] = "https://www.bing.com/search?q=$([Uri]::EscapeUriString($Query))";

            Open-Webbrowser @PSBoundParameters
        }
    }
}


###############################################################################

function Open-WikipediaNLQuery {

    # DESCRIPTION Open-WikipediaNLQuery: Opens a 'Wikipedia - The Netherlands' query in a webbrowser, in a configurable manner, using commandline switches

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

    # DESCRIPTION Open-YoutubeQuery: Opens a Youtube query in a webbrowser, in a configurable manner, using commandline switches

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

    # DESCRIPTION Open-IMDBQuery: Opens a "Internet Movie Database" query in a webbrowser, in a configurable manner, using commandline switches

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

    # DESCRIPTION Open-InstantStreetViewQuery: Opens a "InstantStreetView" query in a webbrowser, in a configurable manner, using commandline switches

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

    # DESCRIPTION Open-StackOverflowQuery: Opens a "Stack Overflow" query in a webbrowser, in a configurable manner, using commandline switches

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

    # DESCRIPTION Open-WolframAlphaQuery: Opens a "Wolfram Alpha" query in a webbrowser, in a configurable manner, using commandline switches

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

    # DESCRIPTION Open-GithubQuery: Opens a Github query in a webbrowser, in a configurable manner, using commandline switches

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

    # DESCRIPTION Open-GoogleSiteInfo: Opens a "Google siteinfo" query in a webbrowser, in a configurable manner, using commandline switches

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

    # DESCRIPTION Open-BuiltWithSiteInfo: Opens a BuildWith query in a webbrowser, in a configurable manner, using commandline switches

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

            $PSBoundParameters["Url"] = "https://builtwith.com/?$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-WhoisHostSiteInfo {

    # DESCRIPTION Open-WhoisHostSiteInfo: Opens a "Whois HostInfo" query in a webbrowser, in a configurable manner, using commandline switches

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

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://whois.domaintools.com/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-WaybackMachineSiteInfo {

    # DESCRIPTION Open-WaybackMachineSiteInfo: Opens a Waybackmachine query in a webbrowser, in a configurable manner, using commandline switches

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

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://web.archive.org/web/*/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-MovieQuote {

    # DESCRIPTION Open-MovieQuote: Opens a video of a movie quote

    [Alias("moviequote")]

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

            $PSBoundParameters["Url"] = "https://www.playphrase.me/#/search?q=$([Uri]::EscapeUriString($Query))"

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

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.similarweb.com/website/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

<#
.SYNOPSIS
Returns a reversed dictionary for all languages supported by Google Search

.DESCRIPTION
Returns a reversed dictionary for all languages supported by Google Search
#>
function Get-WebLanguageDictionary {

    $result = New-Object System.Collections.Generic.Dictionary"[String, string]"
    $result["Afrikaans"] = "af";
    $result["Akan"] = "ak";
    $result["Albanian"] = "sq";
    $result["Amharic"] = "am";
    $result["Arabic"] = "ar";
    $result["Armenian"] = "hy";
    $result["Azerbaijani"] = "az";
    $result["Basque"] = "eu";
    $result["Belarusian"] = "be";
    $result["Bemba"] = "bem";
    $result["Bengali"] = "bn";
    $result["Bihari"] = "bh";
    $result["Bork, bork, bork!"] = "xx-bork";
    $result["Bosnian"] = "bs";
    $result["Breton"] = "br";
    $result["Bulgarian"] = "bg";
    $result["Cambodian"] = "km";
    $result["Catalan"] = "ca";
    $result["Cherokee"] = "chr";
    $result["Chichewa"] = "ny";
    $result["Chinese (Simplified)"] = "zh-CN";
    $result["Chinese (Traditional)"] = "zh-TW";
    $result["Corsican"] = "co";
    $result["Croatian"] = "hr";
    $result["Czech"] = "cs";
    $result["Danish"] = "da";
    $result["Dutch"] = "nl";
    $result["Elmer Fudd"] = "xx-elmer";
    $result["English"] = "en";
    $result["Esperanto"] = "eo";
    $result["Estonian"] = "et";
    $result["Ewe"] = "ee";
    $result["Faroese"] = "fo";
    $result["Filipino"] = "tl";
    $result["Finnish"] = "fi";
    $result["French"] = "fr";
    $result["Frisian"] = "fy";
    $result["Ga"] = "gaa";
    $result["Galician"] = "gl";
    $result["Georgian"] = "ka";
    $result["German"] = "de";
    $result["Greek"] = "el";
    $result["Guarani"] = "gn";
    $result["Gujarati"] = "gu";
    $result["Hacker"] = "xx-hacker";
    $result["Haitian Creole"] = "ht";
    $result["Hausa"] = "ha";
    $result["Hawaiian"] = "haw";
    $result["Hebrew"] = "iw";
    $result["Hindi"] = "hi";
    $result["Hungarian"] = "hu";
    $result["Icelandic"] = "is";
    $result["Igbo"] = "ig";
    $result["Indonesian"] = "id";
    $result["Interlingua"] = "ia";
    $result["Irish"] = "ga";
    $result["Italian"] = "it";
    $result["Japanese"] = "ja";
    $result["Javanese"] = "jw";
    $result["Kannada"] = "kn";
    $result["Kazakh"] = "kk";
    $result["Kinyarwanda"] = "rw";
    $result["Kirundi"] = "rn";
    $result["Klingon"] = "xx-klingon";
    $result["Kongo"] = "kg";
    $result["Korean"] = "ko";
    $result["Krio (Sierra Leone)"] = "kri";
    $result["Kurdish"] = "ku";
    $result["Kurdish (Soranî)"] = "ckb";
    $result["Kyrgyz"] = "ky";
    $result["Laothian"] = "lo";
    $result["Latin"] = "la";
    $result["Latvian"] = "lv";
    $result["Lingala"] = "ln";
    $result["Lithuanian"] = "lt";
    $result["Lozi"] = "loz";
    $result["Luganda"] = "lg";
    $result["Luo"] = "ach";
    $result["Macedonian"] = "mk";
    $result["Malagasy"] = "mg";
    $result["Malay"] = "ms";
    $result["Malayalam"] = "ml";
    $result["Maltese"] = "mt";
    $result["Maori"] = "mi";
    $result["Marathi"] = "mr";
    $result["Mauritian Creole"] = "mfe";
    $result["Moldavian"] = "mo";
    $result["Mongolian"] = "mn";
    $result["Montenegrin"] = "sr-ME";
    $result["Nepali"] = "ne";
    $result["Nigerian Pidgin"] = "pcm";
    $result["Northern Sotho"] = "nso";
    $result["Norwegian"] = "no";
    $result["Norwegian (Nynorsk)"] = "nn";
    $result["Occitan"] = "oc";
    $result["Oriya"] = "or";
    $result["Oromo"] = "om";
    $result["Pashto"] = "ps";
    $result["Persian"] = "fa";
    $result["Pirate"] = "xx-pirate";
    $result["Polish"] = "pl";
    $result["Portuguese (Brazil)"] = "pt-BR";
    $result["Portuguese (Portugal)"] = "pt-PT";
    $result["Punjabi"] = "pa";
    $result["Quechua"] = "qu";
    $result["Romanian"] = "ro";
    $result["Romansh"] = "rm";
    $result["Runyakitara"] = "nyn";
    $result["Russian"] = "ru";
    $result["Scots Gaelic"] = "gd";
    $result["Serbian"] = "sr";
    $result["Serbo-Croatian"] = "sh";
    $result["Sesotho"] = "st";
    $result["Setswana"] = "tn";
    $result["Seychellois Creole"] = "crs";
    $result["Shona"] = "sn";
    $result["Sindhi"] = "sd";
    $result["Sinhalese"] = "si";
    $result["Slovak"] = "sk";
    $result["Slovenian"] = "sl";
    $result["Somali"] = "so";
    $result["Spanish"] = "es";
    $result["Spanish (Latin American)"] = "es-419";
    $result["Sundanese"] = "su";
    $result["Swahili"] = "sw";
    $result["Swedish"] = "sv";
    $result["Tajik"] = "tg";
    $result["Tamil"] = "ta";
    $result["Tatar"] = "tt";
    $result["Telugu"] = "te";
    $result["Thai"] = "th";
    $result["Tigrinya"] = "ti";
    $result["Tonga"] = "to";
    $result["Tshiluba"] = "lua";
    $result["Tumbuka"] = "tum";
    $result["Turkish"] = "tr";
    $result["Turkmen"] = "tk";
    $result["Twi"] = "tw";
    $result["Uighur"] = "ug";
    $result["Ukrainian"] = "uk";
    $result["Urdu"] = "ur";
    $result["Uzbek"] = "uz";
    $result["Vietnamese"] = "vi";
    $result["Welsh"] = "cy";
    $result["Wolof"] = "wo";
    $result["Xhosa"] = "xh";
    $result["Yiddish"] = "yi";
    $result["Yoruba"] = "yo";
    $result["Zulu"] = "zu";

    return $result;
}

################################################################################
################################################################################
################################################################################

# SIG # Begin signature block
# MIIbzgYJKoZIhvcNAQcCoIIbvzCCG7sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCTQnQx8ABfHrX8
# EtWbiQcYgPvrszDE8j1vyaZwkGENhaCCFhswggMOMIIB9qADAgECAhBwxOfTiuon
# hU3SZf3YwpWAMA0GCSqGSIb3DQEBCwUAMB8xHTAbBgNVBAMMFEdlblhkZXYgQXV0
# aGVudGljb2RlMB4XDTI0MDUwNTIwMzEzOFoXDTM0MDUwNTE4NDEzOFowHzEdMBsG
# A1UEAwwUR2VuWGRldiBBdXRoZW50aWNvZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IB
# DwAwggEKAoIBAQDAD4JXwna5uBAYw54JXXscQPSos9pMeeyV99hvQPs6IcQ/wIXs
# zQ0xdkMGlzo1Nvldyqwa6+OXMyHsZM2D6QA1WjRoTzjT432hlGJT3VrP3R9cvOfg
# sAnVLpZy+4uty2fh5o8NEk4tmULOXDPZBT6NOoRjRCyt+KwCL8yioCFWa/7pqpG0
# niyJka8rhOVQLg8sZ+n5DrSihs1o3PyN28mZLendSbL9Y06cbqadL0J6sn31sw6e
# tpLOToIj1DXQbID0ejeafONHYJ3cKBrQ0TG7aoK8dte4X+iQQuDgA/l7ATxCjC7V
# 18vKRQXzSjvBQvNuWSw6DX2b7sc7dzC9v2T1AgMBAAGjRjBEMA4GA1UdDwEB/wQE
# AwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUf8ZHrsKtJB9RD6z2
# x2Txu7wQ1/4wDQYJKoZIhvcNAQELBQADggEBAK/GgNjLVhQkhbFMrJUt3nFfYa2a
# iP/+U2vapwtqeyNBreMiTYwtqkULEPotRlRCMZ+k8kwRhv1bsR82MXK1H74DKcTM
# 0gu62RxOMXz8ij0BjXW9axEWqYGAbbP0EoNyoBzqiLYqXkwCXqIFsywuDZO4QY3D
# 1c+NEKVnPnhf/gufOUrlugklExh9i4QagCSlUObYAa9yBhcoxOHzN0v6mN+I7EjM
# sVsydPsk3NshubldpNSavFUcF477l21eM5F1bFXGTJGgGq9k1/drpILe5e4oLy9w
# sxmdnqpyvbwtPe2+LZx0XSlR5vCfYFih6eV8fNcgvMmAKAcuIuKxKwJkAscwggWN
# MIIEdaADAgECAhAOmxiO+dAt5+/bUOIIQBhaMA0GCSqGSIb3DQEBDAUAMGUxCzAJ
# BgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5k
# aWdpY2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBD
# QTAeFw0yMjA4MDEwMDAwMDBaFw0zMTExMDkyMzU5NTlaMGIxCzAJBgNVBAYTAlVT
# MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j
# b20xITAfBgNVBAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAL/mkHNo3rvkXUo8MCIwaTPswqclLskhPfKK
# 2FnC4SmnPVirdprNrnsbhA3EMB/zG6Q4FutWxpdtHauyefLKEdLkX9YFPFIPUh/G
# nhWlfr6fqVcWWVVyr2iTcMKyunWZanMylNEQRBAu34LzB4TmdDttceItDBvuINXJ
# IB1jKS3O7F5OyJP4IWGbNOsFxl7sWxq868nPzaw0QF+xembud8hIqGZXV59UWI4M
# K7dPpzDZVu7Ke13jrclPXuU15zHL2pNe3I6PgNq2kZhAkHnDeMe2scS1ahg4AxCN
# 2NQ3pC4FfYj1gj4QkXCrVYJBMtfbBHMqbpEBfCFM1LyuGwN1XXhm2ToxRJozQL8I
# 11pJpMLmqaBn3aQnvKFPObURWBf3JFxGj2T3wWmIdph2PVldQnaHiZdpekjw4KIS
# G2aadMreSx7nDmOu5tTvkpI6nj3cAORFJYm2mkQZK37AlLTSYW3rM9nF30sEAMx9
# HJXDj/chsrIRt7t/8tWMcCxBYKqxYxhElRp2Yn72gLD76GSmM9GJB+G9t+ZDpBi4
# pncB4Q+UDCEdslQpJYls5Q5SUUd0viastkF13nqsX40/ybzTQRESW+UQUOsxxcpy
# FiIJ33xMdT9j7CFfxCBRa2+xq4aLT8LWRV+dIPyhHsXAj6KxfgommfXkaS+YHS31
# 2amyHeUbAgMBAAGjggE6MIIBNjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTs
# 1+OC0nFdZEzfLmc/57qYrhwPTzAfBgNVHSMEGDAWgBRF66Kv9JLLgjEtUYunpyGd
# 823IDzAOBgNVHQ8BAf8EBAMCAYYweQYIKwYBBQUHAQEEbTBrMCQGCCsGAQUFBzAB
# hhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYBBQUHMAKGN2h0dHA6Ly9j
# YWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RDQS5jcnQw
# RQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lD
# ZXJ0QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZI
# hvcNAQEMBQADggEBAHCgv0NcVec4X6CjdBs9thbX979XB72arKGHLOyFXqkauyL4
# hxppVCLtpIh3bb0aFPQTSnovLbc47/T/gLn4offyct4kvFIDyE7QKt76LVbP+fT3
# rDB6mouyXtTP0UNEm0Mh65ZyoUi0mcudT6cGAxN3J0TU53/oWajwvy8LpunyNDzs
# 9wPHh6jSTEAZNUZqaVSwuKFWjuyk1T3osdz9HNj0d1pcVIxv76FQPfx2CWiEn2/K
# 2yCNNWAcAgPLILCsWKAOQGPFmCLBsln1VWvPJ6tsds5vIy30fnFqI2si/xK4VC0n
# ftg62fC2h5b9W9FcrBjDTZ9ztwGpn1eqXijiuZQwggauMIIElqADAgECAhAHNje3
# JFR82Ees/ShmKl5bMA0GCSqGSIb3DQEBCwUAMGIxCzAJBgNVBAYTAlVTMRUwEwYD
# VQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAf
# BgNVBAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDAeFw0yMjAzMjMwMDAwMDBa
# Fw0zNzAzMjIyMzU5NTlaMGMxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2Vy
# dCwgSW5jLjE7MDkGA1UEAxMyRGlnaUNlcnQgVHJ1c3RlZCBHNCBSU0E0MDk2IFNI
# QTI1NiBUaW1lU3RhbXBpbmcgQ0EwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDGhjUGSbPBPXJJUVXHJQPE8pE3qZdRodbSg9GeTKJtoLDMg/la9hGhRBVC
# X6SI82j6ffOciQt/nR+eDzMfUBMLJnOWbfhXqAJ9/UO0hNoR8XOxs+4rgISKIhjf
# 69o9xBd/qxkrPkLcZ47qUT3w1lbU5ygt69OxtXXnHwZljZQp09nsad/ZkIdGAHvb
# REGJ3HxqV3rwN3mfXazL6IRktFLydkf3YYMZ3V+0VAshaG43IbtArF+y3kp9zvU5
# EmfvDqVjbOSmxR3NNg1c1eYbqMFkdECnwHLFuk4fsbVYTXn+149zk6wsOeKlSNbw
# sDETqVcplicu9Yemj052FVUmcJgmf6AaRyBD40NjgHt1biclkJg6OBGz9vae5jtb
# 7IHeIhTZgirHkr+g3uM+onP65x9abJTyUpURK1h0QCirc0PO30qhHGs4xSnzyqqW
# c0Jon7ZGs506o9UD4L/wojzKQtwYSH8UNM/STKvvmz3+DrhkKvp1KCRB7UK/BZxm
# SVJQ9FHzNklNiyDSLFc1eSuo80VgvCONWPfcYd6T/jnA+bIwpUzX6ZhKWD7TA4j+
# s4/TXkt2ElGTyYwMO1uKIqjBJgj5FBASA31fI7tk42PgpuE+9sJ0sj8eCXbsq11G
# deJgo1gJASgADoRU7s7pXcheMBK9Rp6103a50g5rmQzSM7TNsQIDAQABo4IBXTCC
# AVkwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUuhbZbU2FL3MpdpovdYxq
# II+eyG8wHwYDVR0jBBgwFoAU7NfjgtJxXWRM3y5nP+e6mK4cD08wDgYDVR0PAQH/
# BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMIMHcGCCsGAQUFBwEBBGswaTAkBggr
# BgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEEGCCsGAQUFBzAChjVo
# dHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0
# LmNydDBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5jb20v
# RGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNybDAgBgNVHSAEGTAXMAgGBmeBDAEEAjAL
# BglghkgBhv1sBwEwDQYJKoZIhvcNAQELBQADggIBAH1ZjsCTtm+YqUQiAX5m1tgh
# QuGwGC4QTRPPMFPOvxj7x1Bd4ksp+3CKDaopafxpwc8dB+k+YMjYC+VcW9dth/qE
# ICU0MWfNthKWb8RQTGIdDAiCqBa9qVbPFXONASIlzpVpP0d3+3J0FNf/q0+KLHqr
# hc1DX+1gtqpPkWaeLJ7giqzl/Yy8ZCaHbJK9nXzQcAp876i8dU+6WvepELJd6f8o
# VInw1YpxdmXazPByoyP6wCeCRK6ZJxurJB4mwbfeKuv2nrF5mYGjVoarCkXJ38SN
# oOeY+/umnXKvxMfBwWpx2cYTgAnEtp/Nh4cku0+jSbl3ZpHxcpzpSwJSpzd+k1Os
# Ox0ISQ+UzTl63f8lY5knLD0/a6fxZsNBzU+2QJshIUDQtxMkzdwdeDrknq3lNHGS
# 1yZr5Dhzq6YBT70/O3itTK37xJV77QpfMzmHQXh6OOmc4d0j/R0o08f56PGYX/sr
# 2H7yRp11LB4nLCbbbxV7HhmLNriT1ObyF5lZynDwN7+YAN8gFk8n+2BnFqFmut1V
# wDophrCYoCvtlUG3OtUVmDG0YgkPCr2B2RP+v6TR81fZvAT6gt4y3wSJ8ADNXcL5
# 0CN/AAvkdgIm2fBldkKmKYcJRyvmfxqkhQ/8mJb2VVQrH4D6wPIOK+XW+6kvRBVK
# 5xMOHds3OBqhK/bt1nz8MIIGwjCCBKqgAwIBAgIQBUSv85SdCDmmv9s/X+VhFjAN
# BgkqhkiG9w0BAQsFADBjMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQs
# IEluYy4xOzA5BgNVBAMTMkRpZ2lDZXJ0IFRydXN0ZWQgRzQgUlNBNDA5NiBTSEEy
# NTYgVGltZVN0YW1waW5nIENBMB4XDTIzMDcxNDAwMDAwMFoXDTM0MTAxMzIzNTk1
# OVowSDELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMSAwHgYD
# VQQDExdEaWdpQ2VydCBUaW1lc3RhbXAgMjAyMzCCAiIwDQYJKoZIhvcNAQEBBQAD
# ggIPADCCAgoCggIBAKNTRYcdg45brD5UsyPgz5/X5dLnXaEOCdwvSKOXejsqnGfc
# YhVYwamTEafNqrJq3RApih5iY2nTWJw1cb86l+uUUI8cIOrHmjsvlmbjaedp/lvD
# 1isgHMGXlLSlUIHyz8sHpjBoyoNC2vx/CSSUpIIa2mq62DvKXd4ZGIX7ReoNYWyd
# /nFexAaaPPDFLnkPG2ZS48jWPl/aQ9OE9dDH9kgtXkV1lnX+3RChG4PBuOZSlbVH
# 13gpOWvgeFmX40QrStWVzu8IF+qCZE3/I+PKhu60pCFkcOvV5aDaY7Mu6QXuqvYk
# 9R28mxyyt1/f8O52fTGZZUdVnUokL6wrl76f5P17cz4y7lI0+9S769SgLDSb495u
# ZBkHNwGRDxy1Uc2qTGaDiGhiu7xBG3gZbeTZD+BYQfvYsSzhUa+0rRUGFOpiCBPT
# aR58ZE2dD9/O0V6MqqtQFcmzyrzXxDtoRKOlO0L9c33u3Qr/eTQQfqZcClhMAD6F
# aXXHg2TWdc2PEnZWpST618RrIbroHzSYLzrqawGw9/sqhux7UjipmAmhcbJsca8+
# uG+W1eEQE/5hRwqM/vC2x9XH3mwk8L9CgsqgcT2ckpMEtGlwJw1Pt7U20clfCKRw
# o+wK8REuZODLIivK8SgTIUlRfgZm0zu++uuRONhRB8qUt+JQofM604qDy0B7AgMB
# AAGjggGLMIIBhzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADAWBgNVHSUB
# Af8EDDAKBggrBgEFBQcDCDAgBgNVHSAEGTAXMAgGBmeBDAEEAjALBglghkgBhv1s
# BwEwHwYDVR0jBBgwFoAUuhbZbU2FL3MpdpovdYxqII+eyG8wHQYDVR0OBBYEFKW2
# 7xPn783QZKHVVqllMaPe1eNJMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwz
# LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNFJTQTQwOTZTSEEyNTZUaW1l
# U3RhbXBpbmdDQS5jcmwwgZAGCCsGAQUFBwEBBIGDMIGAMCQGCCsGAQUFBzABhhho
# dHRwOi8vb2NzcC5kaWdpY2VydC5jb20wWAYIKwYBBQUHMAKGTGh0dHA6Ly9jYWNl
# cnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNFJTQTQwOTZTSEEyNTZU
# aW1lU3RhbXBpbmdDQS5jcnQwDQYJKoZIhvcNAQELBQADggIBAIEa1t6gqbWYF7xw
# jU+KPGic2CX/yyzkzepdIpLsjCICqbjPgKjZ5+PF7SaCinEvGN1Ott5s1+FgnCvt
# 7T1IjrhrunxdvcJhN2hJd6PrkKoS1yeF844ektrCQDifXcigLiV4JZ0qBXqEKZi2
# V3mP2yZWK7Dzp703DNiYdk9WuVLCtp04qYHnbUFcjGnRuSvExnvPnPp44pMadqJp
# ddNQ5EQSviANnqlE0PjlSXcIWiHFtM+YlRpUurm8wWkZus8W8oM3NG6wQSbd3lqX
# TzON1I13fXVFoaVYJmoDRd7ZULVQjK9WvUzF4UbFKNOt50MAcN7MmJ4ZiQPq1JE3
# 701S88lgIcRWR+3aEUuMMsOI5ljitts++V+wQtaP4xeR0arAVeOGv6wnLEHQmjNK
# qDbUuXKWfpd5OEhfysLcPTLfddY2Z1qJ+Panx+VPNTwAvb6cKmx5AdzaROY63jg7
# B145WPR8czFVoIARyxQMfq68/qTreWWqaNYiyjvrmoI1VygWy2nyMpqy0tg6uLFG
# hmu6F/3Ed2wVbK6rr3M66ElGt9V/zLY4wNjsHPW2obhDLN9OTH0eaHDAdwrUAuBc
# YLso/zjlUlrWrBciI0707NMX+1Br/wd3H3GXREHJuEbTbDJ8WC9nR2XlG3O2mflr
# LAZG70Ee8PBf4NvZrZCARK+AEEGKMYIFCTCCBQUCAQEwMzAfMR0wGwYDVQQDDBRH
# ZW5YZGV2IEF1dGhlbnRpY29kZQIQcMTn04rqJ4VN0mX92MKVgDANBglghkgBZQME
# AgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3DQEJAzEM
# BgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEVMC8GCSqG
# SIb3DQEJBDEiBCBEIbAVvdamjqHv6i9i2FlOezHrTN9OTMN9rXbsxumg9jANBgkq
# hkiG9w0BAQEFAASCAQBZKfNbcpsfdFpXUMJ23762QroCJIc79K9o9riTwi8bFFQC
# 4c1PTMs8z1SyiLXXsBDzEPEcwfFjBj0v5ZgQVQeLmaE2/UW2IdLFJRBnebBW20Gv
# /f6+D/RR3cHPb4J1L62CtMGg93gzNS5JpKlSl3xu468oWGG3IiOr93M1pxVFRtCw
# G/QXfWFQd+w0z/gehU+HaVm/GMAobpTGbCrDs6QUWr5ZAPlZjUjbpsOnXBO/sD51
# tNICh1QUEk0/K/QMJ9jYL7tMbzWMJArPvovgoWHcK1572EIWhse9AR28Cd/2XPV7
# HbdNXLXG9ND/NwP+2Y37Kg0HckHiOPE1rY0ELu8boYIDIDCCAxwGCSqGSIb3DQEJ
# BjGCAw0wggMJAgEBMHcwYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0
# LCBJbmMuMTswOQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hB
# MjU2IFRpbWVTdGFtcGluZyBDQQIQBUSv85SdCDmmv9s/X+VhFjANBglghkgBZQME
# AgEFAKBpMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8X
# DTI0MDYwNzA5MTkzOFowLwYJKoZIhvcNAQkEMSIEINJ/u+svKceBP38Xn7eY2cNd
# rUowONF9JW1xo/WMlBmsMA0GCSqGSIb3DQEBAQUABIICAE12B6oLs3CN4kldvdOY
# Z2ApGfgzJuSyS+OlCZoGQToSb6VfRijh95yU4rrjsu8N/Bl7f8xHU9V1V1OaydSy
# urywNqEFnei+AgCpIgNrHWN/dxXg9r0muAnatxzlwE8TwqUKxTfUmwa+iVxZeRUI
# 4j8wu3l+hsFHr1HFXlClZjk0eQAlk1rSFd9RMN+Tf5cLgkAM2iDnX6velnrqgVbZ
# uk/eEqpbpAKOT750l8/nchStYPhnoARXy5JqDR6LoGAuMkKHoaZ2LjwDjP9Mm1ou
# sFD332bAdPqSnSwW6rSzwX77y3K1VQNpjIRTT7s0NfjQTH1cwF3fJKddn9EgE80i
# YbpcmF4n3Pq7JnupBWWjepsfDsRfu6r+qFcnMm1pl0ZxRD0i1lG8U2DhrBSsxm9y
# 9JljJib4kRWdWATNhpJmDUPrTRUobp/kxkYpsLjhP9331UxTzZMQrgfKV7Mw9w3m
# ER3QxdMg1PR3+idcnLZBmjRi+zHbWO6Wec2wpr/GBIM9RthiGWXEaRn2naa3uCHO
# f0Um4zYjGp/OxT1IbYYW/GkuMfXgGfH5Ux/xretBjQx5VngfDzWN1tjRzAAwGMQh
# HNhQwtfQfndAzHGMTG7PEbQlAmWJladF8N8xvUACspj6N99Ctof+h0jn0DCyjvvQ
# omDWyw41Zm5/9HZU76cYiiIo
# SIG # End signature block
