################################################################################
<#
.SYNOPSIS
Clears the YouTube watch history from the browser's local storage.

.DESCRIPTION
This function selects a YouTube tab in the browser and clears the watch history
by resetting the local storage value for watched videos.

.EXAMPLE
Clear-YoutubeWatched
#>
function Clear-YoutubeWatched {

    [CmdletBinding()]
    param()

    begin {

        Write-Verbose "Attempting to locate and select a YouTube browser tab"
    }

    process {

        # select any open youtube tab
        $null = Select-WebbrowserTab "*youtube*"

        # verify that we have a valid chrome session
        if ($chromeSession -isnot [PSCustomObject]) {

            throw "YouTube browser tab not found. Please ensure YouTube is open."
        }

        Write-Verbose "Clearing YouTube watch history from local storage"

        # reset the watch history in local storage
        $null = Invoke-WebbrowserEvaluation "localStorage['oaytvDone'] = '[]'"
    }

    end {
    }
}
################################################################################
