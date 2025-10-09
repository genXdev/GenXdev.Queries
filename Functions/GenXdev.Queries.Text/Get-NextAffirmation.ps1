<##############################################################################
Part of PowerShell module : GenXdev.Queries.Text
Original cmdlet filename  : Get-NextAffirmation.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
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