################################################################################
<#
.SYNOPSIS
Opens a webpage in a webbrowser and performs a query

.DESCRIPTION
Opens a website by Url in the webbrowser, it types in a query and presses enter.

.PARAMETER Url
The url of the website to open

.PARAMETER Queries
The query to perform

#>
function Open-WebsiteAndPerformQuery {

    [CmdletBinding()]

    param(
        ###############################################################################
        [Alias("u", "uri", "link", "address", "site")]
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The url of the website to open"
        )]
        [string] $Url,
        ###############################################################################
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
        )]
        [string[]] $Queries,
        ###############################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
        ###############################################################################
    )

    DynamicParam {

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor", "RestoreFocus"
    }

    begin {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }
        else {

            $PSBoundParameters["Url"] = "Url";
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }
        else {

            $PSBoundParameters["Monitor"] = $Monitor;
        }

        if ($PSBoundParameters.ContainsKey("PassThru") -eq $true) {

            $PSBoundParameters.Add("PassThru", $true);
        }
        else {

            $PSBoundParameters.Add("PassThru", $true) | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("RestoreFocus")) {

            $PSBoundParameters.Add("RestoreFocus", $false) | Out-Null;
        }
        else {

            $PSBoundParameters["RestoreFocus"] = $false;
        }
    }

    process {

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = $Url;

            $p = Open-Webbrowser @PSBoundParameters | Select-Object -First 1

            Start-Sleep 6 | Out-Null

            if ($null -ne $p) {

                # [Console]::WriteLine("Process found: {0}", $p.Id)
                Set-ForegroundWindow ($p.MainWindowHandle) | Out-Null
                Send-Keys -Keys $Query -Escape -ShiftEnter
            }
            else {

                # [Console]::WriteLine("No Process found");
                Send-Keys -Keys $Query -Escape -ShiftEnter
            }

            Send-Keys "{ENTER}";
        }
    }
}

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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


        $LangKey = "&hl=en";

        if (![string]::IsNullOrWhiteSpace($Language)) {

            $LangKey = "&hl=en&lr=lang_$([Uri]::EscapeUriString((Get-WebLanguageDictionary)[$Language]))"
        }
    }

    process {

        foreach ($Query in $Queries) {

            $Query = "$([Uri]::EscapeUriString($Query))"
            $Url = "https://www.google.com/search?q=$Query$LangKey"

            $Global:Data = @{

                urls   = @();
                query  = $Query;
                more   = $false;
                done   = @{};
                source = @{
                    url = $Url
                }
            }


            Set-WebbrowserTabLocation $Url

            do {
                Start-Sleep 10 | Out-Null

                Invoke-WebbrowserEvaluation -Scripts @("$PSScriptRoot\Get-GoogleSearchResultUrls.js") | Out-Null

                $Global:data.urls | ForEach-Object -ErrorAction SilentlyContinue {

                    if ($Max-- -gt 0) {

                        $_;
                    }
                }
            }

            while ($Global:data.more -and ($Max -gt 0))
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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        $Query = "$Query"
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

.PARAMETER Trending
Opens all videos that are currently trending on youtube

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
    [Alias("qvideos", "qyt")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
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
        [switch] $Recommended,

        [parameter(
            Mandatory = $false
        )]
        [switch] $Trending,
        ###############################################################################

        [Alias("e")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Select in Microsoft Edge"
        )]
        [switch] $Edge,
        ###############################################################################

        [Alias("ch")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Select in Google Chrome"
        )]
        [switch] $Chrome
        ###############################################################################
    )

    begin {

        $LastVideo = "";

        $PowershellProcess = Get-PowershellMainWindowProcess
        $PowershellWindow = [GenXdev.Helpers.WindowObj]::GetMainWindow($PowershellProcess);
    }

    process {

        [bool] $CurrentTab = ($Recommended -ne $true) -and ($Subscriptions -ne $true) -and ($Trending -ne $true) -and ($WatchLater -ne $true) -and (($Queries.Count -eq 0) -or [String]::IsNullOrWhiteSpace($queries[0]));

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

            $AllScreens = @([WpfScreenHelper.Screen]::AllScreens | ForEach-Object { $PSItem });
            $hostInfo = & { $H = Get-Host; $H.ui.rawui; }
            $size = "$($hostInfo.WindowSize.Width)x$($hostInfo.WindowSize.Height)";
            Clear-Host
            Write-Host "Hold on.. launching query".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
            $browser = $null;

            if ($CurrentTab -ne $true) {

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
                            $browser = Open-Webbrowser -NewWindow -RestoreFocus -Chromium -Edge:$Edge -Chrome:$Chrome -Right -Url $Url -PassThru -Force
                        }
                        else {

                            Set-WindowPosition -Bottom -Monitor $Monitor
                            $browser = Open-Webbrowser -NewWindow -RestoreFocus -Chromium -Edge:$Edge -Chrome:$Chrome -Top -Url $Url -PassThru -Force
                        }
                    }
                }

                if ($null -eq $browser) {

                    $browser = Open-Webbrowser -NewWindow -FullScreen -RestoreFocus -Chromium -Edge:$Edge -Chrome:$Chrome -Url $Url -PassThru -Force
                }
            }

            $s = $null
            try {
                $s = $Global:chrome.GetAvailableSessions();
                Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome -Force | Out-Null
            }
            Catch {

                if ($Force -and ($null -eq $ByReference)) {

                    Close-Webbrowser -Chromium -Edge:$Edge -Chrome:$Chrome -Force
                    go $Url
                    return;
                }
            }

            $completed = $false;
            $job = [System.IO.File]::ReadAllText("$PSScriptRoot\Open-AllYoutubeVideos.js");
            [int] $scrollPosition = -1;
            [int] $scrollPosition2 = -1;

            while (-not $completed) {

                try {

                    Invoke-WebbrowserEvaluation "$job" -Edge:$Edge -Chrome:$Chrome | ForEach-Object {

                        if ($completed) { return; }

                        try {

                            $Global:data = $PSItem;

                            $newsize = "$($hostInfo.WindowSize.Width)x$($hostInfo.WindowSize.Height)";
                            if ($newsize -ne $size) {

                                $size = $newsize;
                                $LastVideo = $null;
                            }
                            $hostInfo = & { $H = Get-Host; $H.ui.rawui; }
                            $sub = "";
                            $pause = " [P]ause | ";
                            $header = "[Q]uit | $sub$pause SPACE=Next | [0]..[9] = skip | ◀ -20sec | +20sec ▶ | ".PadRight($hostInfo.WindowSize.Width, " ");
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
                                        Write-Host "Skipping to next video".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                        Invoke-WebbrowserEvaluation "window.close(); data.done = true; window.oayv.data.done = true; return; " -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome | Out-Null
                                        Start-Sleep 1 | Out-Null
                                        Select-WebbrowserTab -Name "* youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome -Force | Out-Null
                                        $LastVideo = "";
                                        [Console]::SetCursorPosition(0, 0);
                                        Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                    }

                                    "s" {

                                        [Console]::SetCursorPosition(0, 0);
                                        Write-Host "Toggling subscription".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                        Invoke-WebbrowserEvaluation "window.oayv.toggleSubscribeToChannel(); return data;" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome | Out-Null

                                        [Console]::SetCursorPosition(0, 0);
                                        Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                    }

                                    "p" {

                                        [Console]::SetCursorPosition(0, 0);
                                        Write-Host "Toggling pause video".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                        $LastVideo = "";
                                        Invoke-WebbrowserEvaluation "window.oayv.togglePauseVideo(); return data; " -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome | Out-Null

                                        [Console]::SetCursorPosition(0, 0);
                                        Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                    }

                                    default {

                                        [int] $n = 0;
                                        if ([int]::TryParse("$($c.KeyChar)", [ref] $n)) {

                                            [Console]::SetCursorPosition(0, 0);
                                            Write-Host "Skipping to position".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)

                                            Invoke-WebbrowserEvaluation "window.oayv.setVideoPosition($n); return data;" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome | Out-Null;

                                            [Console]::SetCursorPosition(0, 0);
                                            Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                        }
                                        else {
                                            if ($c.Key -eq [ConsoleKey]::RightArrow) {

                                                [Console]::SetCursorPosition(0, 0);
                                                Write-Host "Skipping 20 seconds forward".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                                Invoke-WebbrowserEvaluation "window.oayv.forwardInVideo(); return data;" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome | Out-Null;

                                                [Console]::SetCursorPosition(0, 0);
                                                Write-Host $header -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
                                            }
                                            else {
                                                if ($c.Key -eq [ConsoleKey]::LeftArrow) {

                                                    [Console]::SetCursorPosition(0, 0);
                                                    Write-Host "Skipping 20 seconds backwards".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::Yellow)
                                                    Invoke-WebbrowserEvaluation "window.oayv.backwardsInVideo(); return data;" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome | Out-Null;

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

                        Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue -Edge:$Edge -Chrome:$Chrome | Out-Null

                        if ((@($Global:chromeSessions).Count -eq 0) -or ($null -eq $Global:chrome)) {

                            throw "No active session"
                        }
                    }
                }
                catch {

                    $completed = $true;
                }
            }
        }

        try {

            if ($CurrentTab) {

                go
                return;
            }

            if ($Queries.Count -gt 0) {

                foreach ($Query in $Queries) {

                    if ([string]::IsNullOrWhiteSpace($Query) -eq $false) {

                        go "https://www.youtube.com/results?search_query=$([Uri]::EscapeUriString($Query))"
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
        }
    }
}

###############################################################################
function Open-GoogleQuery {

    # DESCRIPTION Open-GoogleQuery: Opens a google query in a webbrowser, in a configurable manner, using commandline switches

    [Alias("q")]

    param(
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            $code = "www"

            if (-not [string]::IsNullOrWhiteSpace($Language)) {

                $code = (Get-WebLanguageDictionary)[$Language]
            }

            $PSBoundParameters["Url"] = "https://$code.google.com/search?q=$([Uri]::EscapeUriString($Query))";

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

    Copy-PDFsFromGoogleQuery scientific, paper, co2
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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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
                                    [IO.Path]::GetFileName($PSItem).Split("#")[0].Split("?")[0]
                                ).Replace("\", "_").Replace("/", "_").Replace("?", "_").Replace("*", "_").Replace(" ", "_").Replace("__", "_") +
                                "_$([DateTime]::UtcNow.Ticks)_$([System.Threading.Thread]::CurrentThread.ManagedThreadId)",
                                ".pdf"
                            )
                        )
                    );

                    Invoke-WebRequest -Uri $PSItem -OutFile $destination

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {
        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
Opens a Bing query in a webbrowser

.DESCRIPTION
Opens a Bing query in a webbrowser, in a configurable manner, using commandline switches

#>
function Open-BingQuery {

    [CmdletBinding()]
    [Alias("bq")]

    param(
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {
        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


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

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor"
    }

    begin {


    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

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

