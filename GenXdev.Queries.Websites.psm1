
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

# SIG # Begin signature block
# MIIbzgYJKoZIhvcNAQcCoIIbvzCCG7sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDljVQzBit9Y7iA
# SEYdBxYHz9I8avUzWd5lbzUE1NFRD6CCFhswggMOMIIB9qADAgECAhBwxOfTiuon
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
# SIb3DQEJBDEiBCAZ1G1Q7YKBSG+Tbj6PcimGsjLk/JGPjjpgIlsKtYcASDANBgkq
# hkiG9w0BAQEFAASCAQCqn1ks+BLq6bmNDbmevSBy42G6ed+vE3MVUENhhAmlnqZq
# Ji+Ec+i9w+Pz5QnRHH1lDh6ZJUYbwMKbdc+z/Zo3DkiR+oF6UpcBBsbbm4X3NPNK
# Y/3ordGEUpz7QDk61Hx7vHix9DhbZuJH8HYhfjhn3BIE7xpOGpRnAfz+7iSIYJfq
# K0rve3Cq66k2GfOVurzXVsAYPFlheBVFLTRrNZV0qvrJxIjaw7YC1r2XMHqESheS
# yoLjJLokkm9QA9JMf4ssyYBlGYCJ/xyZlxb5ed6EWv7OZlEnxCBxdaPA2mmxqB8p
# wjYz0AP+NdOqRBlReTzc9uNKj4sfFXZEC8RghZSzoYIDIDCCAxwGCSqGSIb3DQEJ
# BjGCAw0wggMJAgEBMHcwYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0
# LCBJbmMuMTswOQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hB
# MjU2IFRpbWVTdGFtcGluZyBDQQIQBUSv85SdCDmmv9s/X+VhFjANBglghkgBZQME
# AgEFAKBpMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8X
# DTI0MDYwNzA5MTkzOFowLwYJKoZIhvcNAQkEMSIEIMrG/SxNhV8MGpN12CQbEwbg
# qnWV8Adgei7BZGdAehIdMA0GCSqGSIb3DQEBAQUABIICAAl8TTEJbqZ044Ev+PVg
# RiILEVN2zbU2HZWrV56r+8sWpuuFpAj+xgJRrt7WzRL/o1cPxDCmvmUcedw8NrDi
# kIryG7fmVlVlepOc74ar1swUwAh7Fp+c98c2dYbXn+PfO/3/tG8eSySIQsfnLUX0
# ZyJ7yDu5EBvrZFwhCB1djqdm9rZ6lNGaxR14dratWsfN9PQBbwvbrEttbSZ+WsXM
# t+vgqYIOyBvQZ0bRMPz2nYdlg3SEhQGNAPmpSwE/O+agRNjyl9qk3j/i65zfYtef
# AELZIGE67l8MmwPN+NHZEaCTMsF1D782pLOTiFDUWVtM9onfSEbOJVpZ8wLXU8Ms
# gMqCX5IkC8dahjfzszi5din4508mMMzfAkePL8tCfhBZnvezn2uNCAXXxVxJw14Y
# L6nKATrkW9rPko9oJFDoIIV8BdwNea8VNTwiTvB0p+IDg0JwXbwaDZ1/8216JtbK
# Y/1dIr+fMsYiSnh4qNH50Hl+r64DNusGNaEWdZ8nCRhvJirJ3PHfCE3TdKOrm34L
# cPAYqaMno3JD60JBk3VmvGioZD6RlgUY4GDvZBOS3+KUVySqpA7uLYQB/g8kRCNR
# lL0P0WRvJ9iGE4DAaCd7IksjbFyG0LgjThRWJ6YY4CJJhScEaD/7WGGeXEDCsKpR
# 3eN8Sb4aSnUw1YtmvjW5cyFl
# SIG # End signature block
