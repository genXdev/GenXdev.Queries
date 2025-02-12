###############################################################################

<#
.SYNOPSIS
Executes all Text query Cmdlets in parallel and displays results.

.DESCRIPTION
Executes all Text query Cmdlets in parallel and shows the results for each
query. This function processes URLs and text queries differently, providing
appropriate information for each type.

.PARAMETER Queries
One or more queries to perform. Can be URLs or text queries.

.EXAMPLE
Open-AllPossibleTextQueries -Queries "powershell scripting"

.EXAMPLE
qqq "https://github.com"
#>
function Open-AllPossibleTextQueries {

    [CmdletBinding()]
    [Alias("qqq")]

    param(
        #######################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The query to perform"
        )]
        [ValidateNotNullOrEmpty()]
        [string[]] $Queries
        #######################################################################
    )

    begin {

        Write-Verbose "Starting Open-AllPossibleTextQueries with $($Queries.Count) queries"
    }

    process {

        foreach ($query in $Queries) {

            try {
                Clear-Host

                # attempt to parse query as uri
                [Uri] $uri = $null
                $queryTrimmed = $query.Trim('"').Trim("'")

                # check if query is a valid uri
                $isUri = (
                    [Uri]::TryCreate($queryTrimmed, "absolute", [ref] $uri) -or (
                        $query.ToLowerInvariant().StartsWith("www.") -and
                        [Uri]::TryCreate("http://$queryTrimmed", "absolute", [ref] $uri)
                    )
                ) -and $uri.IsWellFormedOriginalString() -and $uri.Scheme -like "http*"

                if ($isUri) {
                    Write-Verbose "Processing URL query: $query"
                    Write-Host "`r`nSearched for URL: $query" -ForegroundColor "DarkGreen"

                    # process url queries in parallel
                    Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
                        ForEach-Object Name |
                        ForEach-Object -ThrottleLimit 64 -Parallel {

                            if ($using:isUri -and
                                $PSItem.EndsWith("SiteSummary") -and
                                $PSItem.StartsWith("Get-")) {

                                try {
                                    # display query source name
                                    $sourceName = $PSItem.SubString(
                                        "Get-".Length,
                                        $PSItem.Length - "Get-SiteSummary".Length)

                                    Write-Host "`r`n$sourceName`:" -ForegroundColor "Blue"

                                    # execute query for hostname
                                    $result = Invoke-Expression "$PSItem $($using:uri.DnsSafeHost)"
                                    Write-Output $result

                                    # process full url if not host-only query
                                    if ($PSItem.EndsWith("HostSiteSummary") -eq $false) {

                                        $safeUrl = ($using:query).Split("#")[0]
                                        if ($using:uri.Query.Length -gt 0) {
                                            $safeUrl = $safeUrl.Replace($using:uri.Query, "")
                                        }

                                        $urlSourceName = $PSItem.SubString(
                                            "Get-".Length,
                                            $PSItem.Length - "Get-HostSiteSummary".Length)

                                        $line = "`r`n$urlSourceName`:`r`n"
                                        $line += (Invoke-Expression "$PSItem $safeUrl") + "`r`n"
                                        Write-Output $line
                                    }
                                }
                                catch {
                                    Write-Verbose "Error processing $PSItem`: $($_.Exception.Message)"
                                }
                            }
                    }
                    return
                }

                # process text queries
                Write-Verbose "Processing text query: $query"
                Write-Host "`r`nSearched for: $query" -ForegroundColor "DarkGreen"

                # execute text queries in parallel
                Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
                    ForEach-Object Name |
                    ForEach-Object -ThrottleLimit 64 -Parallel {

                        if ($PSItem.EndsWith("Summary") -and $PSItem.StartsWith("Get-")) {
                            try {
                                $sourceName = $PSItem.SubString(
                                    "Get-".Length,
                                    $PSItem.Length - "Get-Summary".Length)

                                $line = "`r`n$sourceName`:`r`n"
                                $line += (Invoke-Expression "$PSItem $using:query") + "`r`n"
                                Write-Output $line
                            }
                            catch {
                                Write-Verbose "Error processing $PSItem`: $($_.Exception.Message)"
                            }
                        }
                } |
                ForEach-Object {
                    $lines = $PSItem.Split("`r`n", [StringSplitOptions]::RemoveEmptyEntries)
                    Write-Host "`r`n$($lines[0])" -ForegroundColor Yellow
                    $lines | Select-Object -Skip 1 | Write-Output
                }

                Write-Host "`r`n-------------" -ForegroundColor "DarkGreen"

            }
            catch {
                Write-Error $_.Exception.Message
                throw $PSItem
            }
        }
    }

    end {
        Write-Verbose "Completed processing all queries"
    }
}
