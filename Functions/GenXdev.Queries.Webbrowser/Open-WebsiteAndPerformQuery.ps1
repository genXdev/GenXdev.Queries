################################################################################
<#
.SYNOPSIS
Opens a webpage in a webbrowser and performs a query

.DESCRIPTION
Opens a website by Url in the webbrowser, it types in a query and presses enter.

.PARAMETER Url
The url of the website to open

.PARAMETER Queries
The query to perform

#>
function Open-WebsiteAndPerformQuery {

    [CmdletBinding()]

    param(
        ###############################################################################
        [Alias("u", "uri", "link", "address", "site")]
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "The url of the website to open"
        )]
        [string] $Url,
        ###############################################################################
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
        ###############################################################################
    )

    DynamicParam {

        Copy-CommandParameters -CommandName "Open-Webbrowser" -ParametersToSkip "Url", "Monitor", "RestoreFocus"
    }

    begin {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("Url")) {

            $PSBoundParameters.Add("Url", "Url") | Out-Null;
        }
        else {

            $PSBoundParameters["Url"] = "Url";
        }

        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }
        else {

            $PSBoundParameters["Monitor"] = $Monitor;
        }

        if ($PSBoundParameters.ContainsKey("PassThru") -eq $true) {

            $PSBoundParameters.Add("PassThru", $true);
        }
        else {

            $PSBoundParameters.Add("PassThru", $true) | Out-Null;
        }

        if (-not $PSBoundParameters.ContainsKey("RestoreFocus")) {

            $PSBoundParameters.Add("RestoreFocus", $false) | Out-Null;
        }
        else {

            $PSBoundParameters["RestoreFocus"] = $false;
        }
    }

    process {

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = $Url;

            $p = Open-Webbrowser @PSBoundParameters | Select-Object -First 1

            Start-Sleep 6 | Out-Null

            if ($null -ne $p) {

                # [Console]::WriteLine("Process found: {0}", $p.Id)
                Set-ForegroundWindow ($p.MainWindowHandle) | Out-Null
                Send-Keys -Keys $Query -Escape -ShiftEnter
            }
            else {

                # [Console]::WriteLine("No Process found");
                Send-Keys -Keys $Query -Escape -ShiftEnter
            }

            Send-Keys "{ENTER}";
        }
    }
}
