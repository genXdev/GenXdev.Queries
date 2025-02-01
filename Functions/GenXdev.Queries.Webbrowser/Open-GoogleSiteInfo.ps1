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
