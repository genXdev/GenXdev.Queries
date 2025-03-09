################################################################################

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
    [Alias("WhatAboutIt")]

    param(
        #######################################################################
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = "Use text-to-speech to speak the affirmation"
        )]
        [Switch] $Speak
        #######################################################################
    )

    begin {
        # initialize api endpoint
        $apiEndpoint = "https://www.affirmations.dev/"
        Write-Verbose "Using API endpoint: $apiEndpoint"
    }

    process {

        try {
            # fetch affirmation from the api with timeout
            Write-Verbose "Fetching affirmation from API..."
            $response = Invoke-RestMethod -Uri $apiEndpoint `
                -TimeoutSec 2

            # extract affirmation text
            $affirmation = $response.affirmation

            # if speak parameter is true, use text-to-speech
            if ($Speak) {
                Write-Verbose "Speaking affirmation using text-to-speech"
                Start-TextToSpeech $affirmation
            }

            # output the affirmation text
            Write-Output $affirmation

        } catch {
            Write-Error "Failed to retrieve affirmation: $_"
        }
    }

    end {
    }
}

################################################################################
