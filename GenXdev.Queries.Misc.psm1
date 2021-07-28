function Open-Repeaters {

    # DESCRIPTION Open-Repeaters: Opens HobbyScoop, Dutch amateur repeater status page

    [Alias("repeater")]

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
        ###############################################################################

        [Alias("a", "app", "appmode")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "ApplicationMode"
    }

    process {

        $PSBoundParameters.Add("Url", "https://pc7x.net/repeaters/") | Out-Null;
        $PSBoundParameters.Remove("Repeaters") | Out-Null;

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }

        foreach ($Repeater in $Repeaters) {

            $PSBoundParameters["Url"] = "https://pc7x.net/repeaters/#/map/google/$($Repeater.ToLowerInvariant())";

            Open-Webbrowser @PSBoundParameters
        }
    }
}

###############################################################################

function Open-Timeline {

    # DESCRIPTION Open-Timeline: Opens an interactive timeline, showing the current time, date, centery, millenium

    [Alias("timeline")]

    Param(
        ###############################################################################

        [Alias("a", "app", "appmode")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "ApplicationMode"
    }

    process {

        $PSBoundParameters.Add("Url", "https://pc7x.net/detijdonline/") | Out-Null;

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }

        Open-Webbrowser @PSBoundParameters
    }
}

###############################################################################

function Open-GameOfLife {

    # DESCRIPTION Open-GameOfLife: Opens an interactive game-of-life simulation

    [Alias("gameoflife", "conway")]

    Param(
        ###############################################################################

        [Alias("a", "app", "appmode")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "ApplicationMode"
    }

    process {

        $PSBoundParameters.Add("Url", "https://pc7x.net/conway/") | Out-Null;

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }

        Open-Webbrowser @PSBoundParameters
    }
}

###############################################################################

function Open-ViralSimulation {

    # DESCRIPTION Open-ViralSimulation: Opens a very simple, interactive infection simulation

    [Alias("viral")]

    Param(
        ###############################################################################

        [Alias("a", "app", "appmode")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "ApplicationMode"
    }

    process {

        $PSBoundParameters.Add("Url", "https://pc7x.net/viral/") | Out-Null;

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }

        Open-Webbrowser @PSBoundParameters
    }
}

###############################################################################
function Open-Yab {

    # DESCRIPTION Open-Yab: Opens an interactive block-falling-game in single playermode

    [Alias("yab")]

    Param(
        ###############################################################################

        [Alias("a", "app", "appmode")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "ApplicationMode", "Monitor"
    }

    process {

        $PSBoundParameters.Add("Url", "https://yab.pc7x.net/#/single/marathon/") | Out-Null;

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        Open-Webbrowser @PSBoundParameters
    }
}

###############################################################################
function Open-YabAIBattle {

    # DESCRIPTION Open-YabAIBattle: Opens an interactive block-falling-game in battle AI mode

    [Alias("yabbattle")]

    Param(
        ###############################################################################

        [Alias("a", "app", "appmode")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "Hide the browser controls"
        )]
        [switch] $ApplicationMode,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "ApplicationMode", "Monitor"
    }

    process {

        $PSBoundParameters.Add("Url", "https://yab.pc7x.net/#/ai/battle/") | Out-Null;

        if ($PSBoundParameters.ContainsKey("ApplicationMode") -eq $false) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        Open-Webbrowser @PSBoundParameters
    }
}