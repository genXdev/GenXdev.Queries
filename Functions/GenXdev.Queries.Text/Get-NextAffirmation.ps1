<##############################################################################
Part of PowerShell module : GenXdev.Queries.Text
Original cmdlet filename  : Get-NextAffirmation.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.272.2025
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
Returns a random affirmation text from affirmations.dev API.

.DESCRIPTION
Retrieves an affirmation from the affirmations.dev API and optionally speaks it
using text-to-speech.

.PARAMETER Speak
When specified, uses text-to-speech to speak the affirmation out loud.

.EXAMPLE
Get-NextAffirmation

.EXAMPLE
WhatAboutIt -Speak
#>
function Get-NextAffirmation {

    [CmdletBinding()]
    [Alias('WhatAboutIt')]

    param(
        #######################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = 'Use text-to-speech to speak the affirmation'
        )]
        [Switch] $Speak
        #######################################################################
    )

    begin {
        # initialize api endpoint
        $apiEndpoint = 'https://www.affirmations.dev/'
        Microsoft.PowerShell.Utility\Write-Verbose "Using API endpoint: $apiEndpoint"
    }


    process {

        try {
            # fetch affirmation from the api with timeout
            Microsoft.PowerShell.Utility\Write-Verbose 'Fetching affirmation from API...'
            $response = Microsoft.PowerShell.Utility\Invoke-RestMethod `
                -Verbose:$false `
                -ProgressAction Continue `
                -Uri $apiEndpoint `
                -TimeoutSec 2

            # extract affirmation text
            $affirmation = $response.affirmation

            # if speak parameter is true, use text-to-speech
            if ($Speak) {
                Microsoft.PowerShell.Utility\Write-Verbose 'Speaking affirmation using text-to-speech'
                GenXdev.Console\Start-TextToSpeech $affirmation
            }

            # output the affirmation text
            Microsoft.PowerShell.Utility\Write-Output $affirmation

        }
        catch {
            Microsoft.PowerShell.Utility\Write-Error "Failed to retrieve affirmation: $_"
        }
    }

    end {
    }
}