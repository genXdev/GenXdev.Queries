﻿###############################################################################

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

    [CmdletBinding(DefaultParameterSetName = 'Default')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [Alias('qqq')]

    param(
        #######################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = 'Default',
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The query to perform'
        )]
        [Alias('q', 'Name', 'Text', 'Query')]
        [string[]] $Queries
        #######################################################################
    )

    begin {
        Microsoft.PowerShell.Utility\Write-Verbose "Starting Open-AllPossibleTextQueries with $($Queries.Count) queries"
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
                    [Uri]::TryCreate($queryTrimmed, 'absolute', [ref] $uri) -or (
                        $query.ToLowerInvariant().StartsWith('www.') -and
                        [Uri]::TryCreate("http://$queryTrimmed", 'absolute', [ref] $uri)
                    )
                ) -and $uri.IsWellFormedOriginalString() -and $uri.Scheme -like 'http*'

                if ($isUri) {
                    Microsoft.PowerShell.Utility\Write-Verbose "Processing URL query: $query"
                    Microsoft.PowerShell.Utility\Write-Host "`r`nSearched for URL: $query" -ForegroundColor 'DarkGreen'

                    # process url queries in parallel
                    Microsoft.PowerShell.Core\Get-Command -Module '*.Queries' -ErrorAction SilentlyContinue |
                        Microsoft.PowerShell.Core\ForEach-Object Name |
                        Microsoft.PowerShell.Core\ForEach-Object -ThrottleLimit 64 -Parallel {

                            if ($using:isUri -and
                                $PSItem.EndsWith('SiteSummary') -and
                                $PSItem.StartsWith('Get-')) {

                                try {
                                    # display query source name
                                    $sourceName = $PSItem.SubString(
                                        'Get-'.Length,
                                        $PSItem.Length - 'Get-SiteSummary'.Length)

                                    Microsoft.PowerShell.Utility\Write-Host "`r`n$sourceName`:" -ForegroundColor 'Blue'

                                    # execute query for hostname
                                    $result = Microsoft.PowerShell.Utility\Invoke-Expression "$PSItem $($using:uri.DnsSafeHost)"
                                    Microsoft.PowerShell.Utility\Write-Output $result

                                    # process full url if not host-only query
                                    if ($PSItem.EndsWith('HostSiteSummary') -eq $false) {

                                        $safeUrl = ($using:query).Split('#')[0]
                                        if ($using:uri.Query.Length -gt 0) {
                                            $safeUrl = $safeUrl.Replace($using:uri.Query, '')
                                        }

                                        $urlSourceName = $PSItem.SubString(
                                            'Get-'.Length,
                                            $PSItem.Length - 'Get-HostSiteSummary'.Length)

                                        $line = "`r`n$urlSourceName`:`r`n"
                                        $line += (Microsoft.PowerShell.Utility\Invoke-Expression "$PSItem $safeUrl") + "`r`n"
                                        Microsoft.PowerShell.Utility\Write-Output $line
                                    }
                                }
                                catch {
                                    Microsoft.PowerShell.Utility\Write-Verbose "Error processing $PSItem`: $($_.Exception.Message)"
                                }
                            }
                        }
                    return
                }

                # process text queries
                Microsoft.PowerShell.Utility\Write-Verbose "Processing text query: $query"
                Microsoft.PowerShell.Utility\Write-Host "`r`nSearched for: $query" -ForegroundColor 'DarkGreen'

                # execute text queries in parallel
                Microsoft.PowerShell.Core\Get-Command -Module '*.Queries' -ErrorAction SilentlyContinue |
                    Microsoft.PowerShell.Core\ForEach-Object Name |
                    Microsoft.PowerShell.Core\ForEach-Object -ThrottleLimit 64 -Parallel {

                        if ($PSItem.EndsWith('Summary') -and $PSItem.StartsWith('Get-')) {
                            try {
                                $sourceName = $PSItem.SubString(
                                    'Get-'.Length,
                                    $PSItem.Length - 'Get-Summary'.Length)

                                $line = "`r`n$sourceName`:`r`n"
                                $line += (Microsoft.PowerShell.Utility\Invoke-Expression "$PSItem $using:query") + "`r`n"
                                Microsoft.PowerShell.Utility\Write-Output $line
                            }
                            catch {
                                Microsoft.PowerShell.Utility\Write-Verbose "Error processing $PSItem`: $($_.Exception.Message)"
                            }
                        }
                    } |
                    Microsoft.PowerShell.Core\ForEach-Object {
                        $lines = $PSItem.Split("`r`n", [StringSplitOptions]::RemoveEmptyEntries)
                        Microsoft.PowerShell.Utility\Write-Host "`r`n$($lines[0])" -ForegroundColor Yellow
                        $lines | Microsoft.PowerShell.Utility\Select-Object -Skip 1 | Microsoft.PowerShell.Utility\Write-Output
                    }

                Microsoft.PowerShell.Utility\Write-Host "`r`n-------------" -ForegroundColor 'DarkGreen'

            }
            catch {
                Microsoft.PowerShell.Utility\Write-Error $_.Exception.Message
                throw $PSItem
            }
        }
    }

    end {
        Microsoft.PowerShell.Utility\Write-Verbose 'Completed processing all queries'
    }
}