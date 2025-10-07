<##############################################################################
Part of PowerShell module : GenXdev.Queries
Original cmdlet filename  : Open-AllPossibleTextQueries.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.296.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
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