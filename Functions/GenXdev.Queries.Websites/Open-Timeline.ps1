################################################################################
<#
.SYNOPSIS
Opens an interactive timeline showing current time, date, century, and millennium.

.DESCRIPTION
Opens a web-based interactive timeline that displays temporal information in an
artistic theme. Supports multiple languages and visual customization options.

.PARAMETER Monitor
The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor

.PARAMETER ReturnURL
Don't open webbrowser, just return the url

.PARAMETER ReturnOnlyURL
After opening webbrowser, return the url

.PARAMETER Theme
Select theme for visualization (default = PicassoPulse)

.PARAMETER Language
Override default browser language or select [All] for rotation

.EXAMPLE
Open-Timeline -Theme "VanGoghSkies" -Language "English"

.EXAMPLE
timeline -Theme "MonetMoods" -mon 2
#>
function Open-Timeline {

    [CmdletBinding()]
    [Alias("timeline")]

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
        [switch] $ReturnOnlyURL,
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "Selects All or limit the theme to a specific one, default = PicassoPulse"
        )]
        [ValidateSet(
            "[All]",
            "VanGoghSkies",
            "MonetMoods",
            "PicassoPulse",
            "DaliDreams",
            "KandinskyKaleidoscope",
            "PollockPoints",
            "HokusaiWaves",
            "EscherEchoes",
            "WarholWaves",
            "KlimtKaleidoscope",
            "MiroMirage",
            "RothkoRhythms",
            "SeuratStipples",
            "RembrandtRadiance",
            "VermeerVisions",
            "BoschBizarre",
            "TurnerTwilight",
            "FridaFeelings",
            "CezanneContours",
            "GauguinGlow",
            "RenoirReflections"
        )]
        [string] $Theme = "[All]",
        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "Override default browser language, or select [All] for rotation of all languages every minute"
        )]
        [ValidateSet(
            "English",
            "Kotava",
            "Arabic",
            "German",
            "Spanish",
            "French",
            "Italian",
            "Japanese",
            "Korean",
            "Dutch",
            "Polish",
            "Portuguese",
            "Russian",
            "Thai",
            "Turkish",
            "Ukrainian",
            "Vietnamese",
            "Yiddish",
            "Chinese",
            "[All]")]
        [string] $Language = $null,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the currently dragged node's background"
        )]
        [string]$DragedNodeBackground = $null,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the focused node's (In center) background"
        )]
        [string]$FocusedNodeBackground = $null,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the focused node's (in center) foreground text"
        )]
        [string]$FocusedNodeForeground = $null,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the focused node's (In center) background"
        )]
        [string]$UnFocusedNodeBackground = $null,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the unfocused node's (in center) foreground text"
        )]
        [string]$UnFocusedNodeForeground = $null,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the default css border-light-color colorstyle"
        )]
        [string]$BorderLightColor = $null,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the default css border-dark-color colorstyle"
        )]
        [string]$BorderDarkColor = $null,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the default width for painting the node borders"
        )]
        [int] $BorderWidth = 1,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the default width for the background rotation delay"
        )]
        [int] $RotationDelaySeconds = 15
    )

    begin {
        # define supported languages
        $supportedLanguages = @(
            @{ code = "en"; name = "English" }
            @{ code = "avk"; name = "Kotava" }
            @{ code = "ar"; name = "Arabic" }
            @{ code = "de"; name = "German" }
            @{ code = "es"; name = "Spanish" }
            @{ code = "fr"; name = "French" }
            @{ code = "it"; name = "Italian" }
            @{ code = "ja"; name = "Japanese" }
            @{ code = "ko"; name = "Korean" }
            @{ code = "nl"; name = "Dutch" }
            @{ code = "pl"; name = "Polish" }
            @{ code = "pt"; name = "Portuguese" }
            @{ code = "ru"; name = "Russian" }
            @{ code = "th"; name = "Thai" }
            @{ code = "tr"; name = "Turkish" }
            @{ code = "uk"; name = "Ukrainian" }
            @{ code = "vi"; name = "Vietnamese" }
            @{ code = "yi"; name = "Yiddish" }
            @{ code = "zh"; name = "Chinese" }
        )

        if ($PSBoundParameters.ContainsKey("Language")) { $PSBoundParameters.Remove("Language") | Out-Null }
        if ($PSBoundParameters.ContainsKey("Theme")) { $PSBoundParameters.Remove("Theme") | Out-Null }
        if ($PSBoundParameters.ContainsKey("DragedNodeBackground")) { $PSBoundParameters.Remove("DragedNodeBackground") | Out-Null }
        if ($PSBoundParameters.ContainsKey("FocusedNodeBackground")) { $PSBoundParameters.Remove("FocusedNodeBackground") | Out-Null }
        if ($PSBoundParameters.ContainsKey("FocusedNodeForeground")) { $PSBoundParameters.Remove("FocusedNodeForeground") | Out-Null }
        if ($PSBoundParameters.ContainsKey("UnFocusedNodeBackground")) { $PSBoundParameters.Remove("UnFocusedNodeBackground") | Out-Null }
        if ($PSBoundParameters.ContainsKey("UnFocusedNodeForeground")) { $PSBoundParameters.Remove("UnFocusedNodeForeground") | Out-Null }
        if ($PSBoundParameters.ContainsKey("BorderLightColor")) { $PSBoundParameters.Remove("BorderLightColor") | Out-Null }
        if ($PSBoundParameters.ContainsKey("BorderDarkColor")) { $PSBoundParameters.Remove("BorderDarkColor") | Out-Null }
        if ($PSBoundParameters.ContainsKey("BorderWidth")) { $PSBoundParameters.Remove("BorderWidth") | Out-Null }
        if ($PSBoundParameters.ContainsKey("RotationDelaySeconds")) { $PSBoundParameters.Remove("RotationDelaySeconds") | Out-Null }
        if ($PSBoundParameters.ContainsKey("ReturnUrl")) { $PSBoundParameters.Remove("ReturnUrl") | Out-Null }
    }

    process {

        # construct query parameters for the url
        [string] $queryParams = "?BorderWidth=$BorderWidth" +
        "&RotationDelaySeconds=$RotationDelaySeconds"

        Write-Verbose "Building URL with parameters: $queryParams"

        # handle language selection if specified
        if (-not [String]::IsNullOrWhiteSpace($Language)) {

            # lookup language code
            $langCode = $supportedLanguages |
            Where-Object { $_.name -eq $Language } |
            Select-Object -ExpandProperty code

            $queryParams += "&lang=$langCode"
        }

        # add optional appearance parameters if specified
        if (-not [String]::IsNullOrWhiteSpace($FocusedNodeBackground)) {
            $queryParams += "&FocusedNodeBackground=$FocusedNodeBackground"
        }
        if (-not [String]::IsNullOrWhiteSpace($FocusedNodeForeground)) {
            $queryParams += "&FocusedNodeForeground=$FocusedNodeForeground"
        }
        if (-not [String]::IsNullOrWhiteSpace($UnFocusedNodeBackground)) {
            $queryParams += "&UnFocusedNodeBackground=$UnFocusedNodeBackground"
        }
        if (-not [String]::IsNullOrWhiteSpace($UnFocusedNodeForeground)) {
            $queryParams += "&UnFocusedNodeForeground=$UnFocusedNodeForeground"
        }
        if (-not [String]::IsNullOrWhiteSpace($BorderLightColor)) {
            $queryParams += "&BorderLightColor=$BorderLightColor"
        }
        if (-not [String]::IsNullOrWhiteSpace($BorderDarkColor)) {
            $queryParams += "&BorderDarkColor=$BorderDarkColor"
        }
        if (-not [String]::IsNullOrWhiteSpace($DragedNodeBackground)) {
            $queryParams += "&DragedNodeBackground=$DragedNodeBackground"
        }

        $Url = "https://timeline.genxdev.net/$queryParams#$Theme";


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
}