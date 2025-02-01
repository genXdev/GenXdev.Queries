###############################################################################
<#
.SYNOPSIS
Opens a Bing CoPilot query in a webbrowser

.DESCRIPTION
Opens a Bing CoPilot (ChatGPT-4) query in the webbrowser, it types in the query and presses enter.

.PARAMETER Queries
The query to perform
#>
function Open-BingCopilotQuery {

    [CmdletBinding()]
    [Alias("aibc", "ask")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The query to perform"
        )]
        [string[]] $Queries
        ###############################################################################
    )

    DynamicParam {

        Copy-CommandParameters -CommandName "Open-WebsiteAndPerformQuery" -ParametersToSkip "Url", "Queries"
    }

    process {

        $PSBoundParameters.Add("Url", "https://copilot.microsoft.com/") | Out-Null

        Open-WebsiteAndPerformQuery @PSBoundParameters
    }

    end {

    }
}
