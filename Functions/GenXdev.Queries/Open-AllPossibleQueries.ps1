################################################################################
<#
.SYNOPSIS
Opens all possible query types for given search terms or URLs.

.DESCRIPTION
Executes all cmdlets that handle webpage queries, processing both URLs and search
terms. For URLs, it performs site-specific queries, and for search terms it
executes general web queries.

.PARAMETER Queries
The search terms or URLs to query.

.PARAMETER Monitor
Monitor selection: 0=default, -1=discard, -2=secondary monitor.

.EXAMPLE
Open-AllPossibleQueries -Queries "powershell scripting" -Monitor 0

.EXAMPLE
qq "https://github.com" -m -1
#>
function Open-AllPossibleQueries {

    [CmdletBinding()]
    [Alias("qq")]

    param(
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The query to perform"
        )]
        [string[]] $Queries,

        ########################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = "Monitor to use: 0=default, -1=discard, -2=secondary"
        )]
        [Alias("m", "mon")]
        [int] $Monitor = -1
        ########################################################################
    )

    DynamicParam {

        Copy-CommandParameters `
            -CommandName "Open-Webbrowser" `
            -ParametersToSkip "Url", "Monitor"
    }

    begin {

        Write-Verbose "Starting Open-AllPossibleQueries with Monitor = $Monitor"
    }

    process {

        # remove queries from bound parameters as we process them separately
        $null = $PSBoundParameters.Remove("Queries")

        # ensure monitor parameter is set
        if (-not $PSBoundParameters.ContainsKey("Monitor")) {

            $null = $PSBoundParameters.Add("Monitor", $Monitor)
        }

        foreach ($query in $Queries) {

            try {
                # attempt to parse query as uri
                [Uri] $uri = $null
                $queryTrimmed = $query.Trim('"').Trim("'")

                # check if query is a valid uri
                $isUri = (
                    [Uri]::TryCreate($queryTrimmed, "absolute", [ref] $uri) -or (
                        $query.ToLowerInvariant().StartsWith("www.") -and
                        [Uri]::TryCreate("http://$queryTrimmed", "absolute",
                            [ref] $uri)
                    )
                ) -and $uri.IsWellFormedOriginalString() -and
                    $uri.Scheme -like "http*"

                if ($isUri) {
                    # process uri queries
                    Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
                        ForEach-Object Name |
                        ForEach-Object {

                            if ($PSItem -like "Open-WebsiteAndPerformQuery") {
                                return
                            }

                            if ($PSItem.EndsWith("SiteInfo") -and
                                $PSItem.StartsWith("Open-")) {

                                # execute host-based query
                                $null = & $PSItem $uri.DnsSafeHost

                                # process full url if not host-only query
                                if (-not $PSItem.EndsWith("HostSiteInfo")) {

                                    $safeUrl = $query.Split("#")[0]
                                    if ($uri.Query.Length -gt 0) {
                                        $safeUrl = $safeUrl.Replace($uri.Query, "")
                                    }

                                    if (-not $PSBoundParameters.ContainsKey("Url")) {
                                        $null = $PSBoundParameters.Add("Url",
                                            $safeUrl)
                                    }

                                    try {
                                        & $PSItem @PSBoundParameters
                                    }
                                    catch {
                                        Write-Warning @"
Error: $($PSItem.Exception)
At: $($PSItem.InvocationInfo.PositionMessage)
Line: $($PSItem.InvocationInfo.Line)
"@
                                    }
                                    $null = $PSBoundParameters.Remove("Url")
                                }
                            }
                        }
                    return
                }
            }
            catch {
                throw
            }

            if ($PSBoundParameters.ContainsKey("Url")) {

                $PSBoundParameters.Remove("Url") | Out-Null;
            }

            Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
                ForEach-Object Name |
                ForEach-Object {

                    if ($PSItem -like "Open-WebsiteAndPerformQuery") { return }

                    if ($PSItem.EndsWith("Query") -and
                        $PSItem.StartsWith("Open-")) {

                    $Query = $Query.Replace("`"", "```"");
                    try {
                        if ($PSBoundParameters.ContainsKey("Queries")) {

                            $PSBoundParameters.Remove("Queries") | Out-Null;
                        }

                        $PSBoundParameters.Add("Queries", @($Query)) | Out-Null;
                        & $PSItem @PSBoundParameters
                        $PSBoundParameters.Remove("Queries") | Out-Null;
                    }
                    Catch {
                        Write-Warning @"
Error: $($PSItem.Exception)
At: $($PSItem.InvocationInfo.PositionMessage)
Line: $($PSItem.InvocationInfo.Line)
"@
                        }
                    }
                }
        }
    }

    end {
        Write-Verbose "Completed processing all queries"
    }
}
