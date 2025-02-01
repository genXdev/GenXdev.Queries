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
