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

###############################################################################
<#
.SYNOPSIS
Opens a Google Gemini query in a webbrowser

.DESCRIPTION
Opens a Google Gemini query in the webbrowser, it types in the query and presses enter.

.PARAMETER Queries
The query to perform
#>
function Open-GoogleGeminiQuery {

    [CmdletBinding()]
    [Alias("aigg", "askgemini")]

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

        $PSBoundParameters.Add("Url", "https://gemini.google.com/") | Out-Null

        Open-WebsiteAndPerformQuery @PSBoundParameters
    }
}

###############################################################################
<#
.SYNOPSIS
Opens a Github CoPilot query in a webbrowser

.DESCRIPTION
Opens a Github CoPilot query in the webbrowser, it types in the query and presses enter.

.PARAMETER Queries
The query to perform
#>
function Open-GithubCopilotQuery {

    [CmdletBinding()]
    [Alias("aigc", "askghcopilot")]

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

        $PSBoundParameters.Add("Url", "https://github.com/copilot") | Out-Null

        Open-WebsiteAndPerformQuery @PSBoundParameters
    }
}

################################################################################
<#
.SYNOPSIS
Opens a X Grok query in a webbrowser

.DESCRIPTION
Opens a X Grok query in the webbrowser, it types in the query and presses enter.

.PARAMETER Queries
The query to perform
#>
function Open-XGrokQuery {

    [CmdletBinding()]
    [Alias("aixg", "askxgrok")]

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
        $PSBoundParameters.Add("Url", "https://x.com/i/grok") | Out-Null

        Open-WebsiteAndPerformQuery @PSBoundParameters
    }
}

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

################################################################################
################################################################################
