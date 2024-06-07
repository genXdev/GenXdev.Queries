
###############################################################################

function Open-Timeline {

    # DESCRIPTION Open-Timeline: Opens an interactive timeline, showing the current time, date, centery, millenium

    [Alias("timeline")]

    Param(
        ###############################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = $Global:DefaultSecondaryMonitor,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't open webbrowser, just return the url"
        )]
        [switch] $ReturnURL,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "After opening webbrowser, return the url"
        )]
        [switch] $ReturnOnlyURL,
        ###############################################################################
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
        [string] $Theme = "PicassoPulse",
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the currently dragged node's background"
        )]
        [string]$DragedNodeBackground = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the focused node's (in center) background"
        )]
        [string]$FocusedNodeBackground = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the focused node's (in center) foreground text"
        )]
        [string]$FocusedNodeForeground = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the focused node's (in center) background"
        )]
        [string]$UnFocusedNodeBackground = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the unfocused node's (in center) foreground text"
        )]
        [string]$UnFocusedNodeForeground = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the default css border-light-color colorstyle"
        )]
        [string]$BorderLightColor = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the default css border-dark-color colorstyle"
        )]
        [string]$BorderDarkColor = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the default width for painting the node borders"
        )]
        [int] $BorderWidth = 1,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the default width for the background rotation delay"
        )]
        [int] $RotationDelaySeconds = 20
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Fullscreen", "RestoreFocus", "Monitor", "ApplicationMode", "NewWindow"
    }

    process {

        [string] $queryParams = "?BorderWidth=$BorderWidth&RotationDelaySeconds=$RotationDelaySeconds"

        if ([String]::IsNullOrWhiteSpace($FocusedNodeBackground) -eq $false) { $queryParams += "&FocusedNodeBackground=$FocusedNodeBackground"; }
        if ([String]::IsNullOrWhiteSpace($FocusedNodeForeground) -eq $false) { $queryParams += "&FocusedNodeForeground=$FocusedNodeForeground"; }
        if ([String]::IsNullOrWhiteSpace($UnFocusedNodeBackground) -eq $false) { $queryParams += "&UnFocusedNodeBackground=$UnFocusedNodeBackground"; }
        if ([String]::IsNullOrWhiteSpace($UnFocusedNodeForeground) -eq $false) { $queryParams += "&UnFocusedNodeForeground=$UnFocusedNodeForeground"; }
        if ([String]::IsNullOrWhiteSpace($BorderLightColor) -eq $false) { $queryParams += "&BorderLightColor=$BorderLightColor"; }
        if ([String]::IsNullOrWhiteSpace($BorderDarkColor) -eq $false) { $queryParams += "&BorderDarkColor=$BorderDarkColor"; }
        if ([String]::IsNullOrWhiteSpace($DragedNodeBackground) -eq $false) { $queryParams += "&DragedNodeBackground=$DragedNodeBackground"; }

        $Url = "https://genxdev.net/projects/timeline/$queryParams#$Theme";

        if ($ReturnOnlyURL) {

            Write-Output $Url
            return;
        }

        $PSBoundParameters.Add("Url", $Url) | Out-Null;

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }
        if ($PSBoundParameters.ContainsKey("Fullscreen") -eq $false) {

            $PSBoundParameters.Add("Fullscreen", $true);
        }
        if ($PSBoundParameters.ContainsKey("RestoreFocus") -eq $false) {

            $PSBoundParameters.Add("RestoreFocus", $true);
        }
        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }
        if ($PSBoundParameters.ContainsKey("-NewWindow") -eq $false) {

            $PSBoundParameters.Add("-NewWindow", $true);
        }

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

        Open-Webbrowser @PSBoundParameters

        if ($ReturnURL) {

            Write-Output $Url
        }
    }
}

###############################################################################

function Open-GameOfLife {

    # DESCRIPTION Open-GameOfLife: Opens an interactive game-of-life simulation

    [Alias("gameoflife", "conway")]

    Param(
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = $Global:DefaultSecondaryMonitor,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't open webbrowser, just return the url"
        )]
        [switch] $ReturnURL,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "After opening webbrowser, return the url"
        )]
        [switch] $ReturnOnlyURL
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Fullscreen", "RestoreFocus", "Monitor", "ApplicationMode", "NewWindow"
    }

    process {

        $Url = "https://genxdev.net/projects/conway/";

        if ($ReturnOnlyURL) {

            Write-Output $Url
            return;
        }

        $PSBoundParameters.Add("Url", $Url) | Out-Null;

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }
        if ($PSBoundParameters.ContainsKey("Fullscreen") -eq $false) {

            $PSBoundParameters.Add("Fullscreen", $true);
        }
        if ($PSBoundParameters.ContainsKey("RestoreFocus") -eq $false) {

            $PSBoundParameters.Add("RestoreFocus", $true);
        }
        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }
        if ($PSBoundParameters.ContainsKey("-NewWindow") -eq $false) {

            $PSBoundParameters.Add("-NewWindow", $true);
        }

        if ($PSBoundParameters.ContainsKey("ReturnUrl")) { $PSBoundParameters.Remove("ReturnUrl") | Out-Null }

        Open-Webbrowser @PSBoundParameters

        if ($ReturnURL) {

            Write-Output $Url
        }
    }
}

###############################################################################

function Open-ViralSimulation {

    # DESCRIPTION Open-ViralSimulation: Opens a very simple, interactive infection simulation

    [Alias("viral")]

    Param(
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = $Global:DefaultSecondaryMonitor,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't open webbrowser, just return the url"
        )]
        [switch] $ReturnURL,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "After opening webbrowser, return the url"
        )]
        [switch] $ReturnOnlyURL
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Fullscreen", "RestoreFocus", "Monitor", "ApplicationMode", "NewWindow"
    }

    process {

        $Url = "https://genxdev.net/projects/viral/";

        if ($ReturnOnlyURL) {

            Write-Output $Url
            return;
        }

        $PSBoundParameters.Add("Url", $Url) | Out-Null;

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }
        if ($PSBoundParameters.ContainsKey("Fullscreen") -eq $false) {

            $PSBoundParameters.Add("Fullscreen", $true);
        }
        if ($PSBoundParameters.ContainsKey("RestoreFocus") -eq $false) {

            $PSBoundParameters.Add("RestoreFocus", $true);
        }
        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }
        if ($PSBoundParameters.ContainsKey("-NewWindow") -eq $false) {

            $PSBoundParameters.Add("-NewWindow", $true);
        }

        if ($PSBoundParameters.ContainsKey("ReturnUrl")) { $PSBoundParameters.Remove("ReturnUrl") | Out-Null }

        Open-Webbrowser @PSBoundParameters

        if ($ReturnURL) {

            Write-Output $Url
        }
    }
}

###############################################################################
function Open-Yab {

    # DESCRIPTION Open-Yab: Opens an interactive block-falling-game in single playermode

    [Alias("yab")]

    Param(
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = $Global:DefaultSecondaryMonitor,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't start a new game, just watch the AI play")]
        [switch] $SpectateOnly,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't open webbrowser, just return the url"
        )]
        [switch] $ReturnURL,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "After opening webbrowser, return the url"
        )]
        [switch] $ReturnOnlyURL
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Fullscreen", "RestoreFocus", "Monitor", "ApplicationMode", "NewWindow"
    }

    process {

        $Url = "https://genxdev.net/projects/yab/#/single/$($SpectateOnly ? "spectate": "marathon")/";

        if ($ReturnOnlyURL) {

            Write-Output $Url
            return;
        }

        $PSBoundParameters.Add("Url", $Url) | Out-Null;

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }
        if ($PSBoundParameters.ContainsKey("Fullscreen") -eq $false) {

            $PSBoundParameters.Add("Fullscreen", $true);
        }
        if ($PSBoundParameters.ContainsKey("RestoreFocus") -eq $false) {

            $PSBoundParameters.Add("RestoreFocus", $true);
        }
        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }
        if ($PSBoundParameters.ContainsKey("-NewWindow") -eq $false) {

            $PSBoundParameters.Add("-NewWindow", $true);
        }

        if ($PSBoundParameters.ContainsKey("ReturnUrl")) {

            $PSBoundParameters.Remove("ReturnUrl") | Out-Null
        }

        if ($PSBoundParameters.ContainsKey("SpectateOnly")) {

            $PSBoundParameters.Remove("SpectateOnly") | Out-Null
        }

        Open-Webbrowser @PSBoundParameters

        if ($ReturnURL) {

            Write-Output $Url
        }
    }
}

###############################################################################
function Open-YabAIBattle {

    # DESCRIPTION Open-YabAIBattle: Opens an interactive block-falling-game in battle AI mode

    [Alias("yabbattle")]

    Param(
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = $Global:DefaultSecondaryMonitor,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't start a new game, just watch the AI play")]
        [switch] $SpectateOnly,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't open webbrowser, just return the url"
        )]
        [switch] $ReturnURL,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "After opening webbrowser, return the url"
        )]
        [switch] $ReturnOnlyURL
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Fullscreen", "RestoreFocus", "Monitor", "ApplicationMode", "NewWindow"
    }

    process {

        $Url = "https://genxdev.net/projects/yab/#/ai/$($SpectateOnly ? "spectate": "battle")/";

        if ($ReturnOnlyURL) {

            Write-Output $Url
            return;
        }

        $PSBoundParameters.Add("Url", $Url) | Out-Null;

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }
        if ($PSBoundParameters.ContainsKey("Fullscreen") -eq $false) {

            $PSBoundParameters.Add("Fullscreen", $true);
        }
        if ($PSBoundParameters.ContainsKey("RestoreFocus") -eq $false) {

            $PSBoundParameters.Add("RestoreFocus", $true);
        }
        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }
        if ($PSBoundParameters.ContainsKey("-NewWindow") -eq $false) {

            $PSBoundParameters.Add("-NewWindow", $true);
        }

        if ($PSBoundParameters.ContainsKey("ReturnUrl")) {

            $PSBoundParameters.Remove("ReturnUrl") | Out-Null
        }

        if ($PSBoundParameters.ContainsKey("SpectateOnly")) {

            $PSBoundParameters.Remove("SpectateOnly") | Out-Null
        }

        Open-Webbrowser @PSBoundParameters

        if ($ReturnURL) {

            Write-Output $Url
        }
    }
}

################################################################################
################################################################################
################################################################################

