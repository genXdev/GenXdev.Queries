###############################################################################

<#
.SYNOPSIS
Returns a random affirmation text

.DESCRIPTION
Returns a random affirmation text

.PARAMETER Speak
Use text-to-speech to speak out affirmation
#>
function Get-NextAffirmations {

    [CmdletBinding()]
    [Alias("WhatAboutIt")]

    param(
        [Parameter(
            Mandatory = $False,
            Position = 0
        )]
        [Switch] $Speak
    )

    $affirmation = (Invoke-RestMethod https://www.affirmations.dev/ -TimeoutSec 2).affirmation;

    if ($Speak -eq $true) {

        Start-TextToSpeech $affirmation
    }

    Write-Output $affirmation
}
