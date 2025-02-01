###############################################################################

function Open-GenXdevAppCatalog {

    # DESCRIPTION Open-GenXdevAppCatalog: Opens the catalog with published GenXdev progressive webapps

    [Alias("appcatalog")]

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

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Fullscreen", "RestoreFocus", "Monitor", "ApplicationMode", "NewWindow"
    }

    process {

        $Url = "https://genxdev.net/";

        if ($ReturnOnlyURL) {

            Write-Output $Url
            return;
        }

        $PSBoundParameters.Add("Url", $Url) | Out-Null;

        if (-not $PSBoundParameters.ContainsKey("ApplicationMode")) {

            $PSBoundParameters.Add("ApplicationMode", $true);
        }
        if (-not $PSBoundParameters.ContainsKey("Fullscreen")) {

            $PSBoundParameters.Add("Fullscreen", $true);
        }
        if (-not $PSBoundParameters.ContainsKey("RestoreFocus")) {

            $PSBoundParameters.Add("RestoreFocus", $true);
        }
        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }
        if (-not $PSBoundParameters.ContainsKey("-NewWindow")) {

            $PSBoundParameters.Add("-NewWindow", $true);
        }

        if ($PSBoundParameters.ContainsKey("ReturnUrl")) { $PSBoundParameters.Remove("ReturnUrl") | Out-Null }

        Open-Webbrowser @PSBoundParameters

        if ($ReturnURL) {

            Write-Output $Url
        }
    }
}
