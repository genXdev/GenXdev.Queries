###############################################################################
<#
.SYNOPSIS
Opens a ChatGPT query in a webbrowser

.DESCRIPTION
Opens a ChatGPT query in the webbrowser, it types in the query and presses enter.

.PARAMETER Queries
The query to perform
#>
function Open-ChatGPTQuery {

    [CmdletBinding()]
    [Alias("aicgpt", "askchatgpt")]

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
        $PSBoundParameters.Add("Url", "https://chatgpt.com/") | Out-Null

        Open-WebsiteAndPerformQuery @PSBoundParameters
    }
}
