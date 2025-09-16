<##############################################################################
Part of PowerShell module : GenXdev.Queries
Original cmdlet filename  : Invoke-WebbrowserTabPollingScript.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.268.2025
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
Executes a background polling script in a previously selected webbrowser tab.

.DESCRIPTION
Continuously executes JavaScript in a browser tab and processes results through
an optional callback. The script runs in a separate thread to prevent blocking.

.PARAMETER Scripts
JavaScript code, URLs, or file paths to execute in the browser tab.

.PARAMETER InitialUrl
Optional URL to navigate to before starting the polling process.

.PARAMETER Callback
Optional scriptblock that processes results after each poll iteration.

.EXAMPLE
Invoke-WebbrowserTabPollingScript -Scripts "console.log('polling')" `
    -InitialUrl "https://example.com" `
    -Callback { Write-Host "Polled" }

.NOTES
Requires Windows 10 or later.
#>
function Invoke-WebbrowserTabPollingScript {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseUsingScopeModifierInNewRunspaces', '')]
    param(
        #######################################################################
        [Parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = 'JavaScript code, URLs or file paths to execute',
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Alias('FullName')]
        [object[]] $Scripts,

        #######################################################################
        [Parameter(
            Position = 1,
            Mandatory = $false,
            HelpMessage = 'URL to navigate to before polling starts'
        )]
        [string] $InitialUrl,

        #######################################################################
        [Parameter(
            Position = 2,
            Mandatory = $false,
            HelpMessage = 'Callback scriptblock to process poll results'
        )]
        [ScriptBlock] $Callback
        #######################################################################
    )

    begin {
        Microsoft.PowerShell.Utility\Write-Verbose "Starting browser tab polling with $(
            $Scripts.Count) scripts"

        # validate scripts parameter if provided
        if ($Scripts) {
            foreach ($script in $Scripts) {
                if ($script -isnot [string]) {
                    throw 'Scripts must be strings containing JavaScript, URLs,
                        or file paths'
                }
            }
        }
    }


    process {

        # initialize thread job to run polling in background
        $job = ThreadJob\Start-ThreadJob `
            -InitializationScript { Microsoft.PowerShell.Core\Import-Module GenXdev.Queries } `
            -ScriptBlock {

            param ($scripts, $reference, $initialUrl, $callback)

            # initialize global state
            $global:data = @{
                urls  = @()
                query = $Query
            }

            # select the target browser tab
            GenXdev.Webbrowser\Select-WebbrowserTab -ByReference $reference

            # navigate to initial url if specified
            if (![string]::IsNullOrWhiteSpace($initialUrl)) {
                $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation `
                    "document.location.href='$initialUrl'" -NoAutoSelectTab
            }

            # start polling loop
            do {
                Microsoft.PowerShell.Utility\Start-Sleep -Milliseconds 250

                # execute scripts in browser
                $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation `
                    -Scripts $scripts -NoAutoSelectTab

                # process results via callback if provided
                if ($null -ne $callback) {
                    try {
                        Microsoft.PowerShell.Core\Invoke-Command -ScriptBlock $callback `
                            -ErrorAction SilentlyContinue
                    }
                    catch {
                        Microsoft.PowerShell.Utility\Write-Warning $PSItem.Exception
                    }

                    # reselect browser tab after callback
                    GenXdev.Webbrowser\Select-WebbrowserTab -ByReference $reference
                }
            }
            while ($global:data.more)

        } -ArgumentList @(
            $Scripts,
            (GenXdev.Webbrowser\Get-ChromiumSessionReference),
            $InitialUrl,
            $Callback
        )

        $null = Microsoft.PowerShell.Core\Wait-Job -Job $job

        Microsoft.PowerShell.Core\Receive-Job -Job $job

        $null = Microsoft.PowerShell.Core\Remove-Job -Job $job

        Microsoft.PowerShell.Utility\Write-Verbose "Started polling job with ID: $($job.Id)"
    }

    end {
    }
}