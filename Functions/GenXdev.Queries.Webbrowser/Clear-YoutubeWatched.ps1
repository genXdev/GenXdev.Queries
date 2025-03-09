################################################################################
<#
.SYNOPSIS
Clears the YouTube watch history from the browser's local storage.

.DESCRIPTION
This function selects a YouTube tab in the browser and clears the watch history
by resetting the local storage value for watched videos of the
Open-AllYoutubeVideos -> qvideos cmdlet. It requires an open
YouTube tab in the browser.

.EXAMPLE
Clear-YoutubeWatched
Clears the watch history of the Open-AllYoutubeVideos -> qvideos cmdlet, in the
currently open YouTube tab.
#>
function Clear-YoutubeWatched {

    [CmdletBinding()]
    param()

    begin {
        # inform user that we're looking for a youtube tab
        Write-Verbose "Searching for an open YouTube browser tab..."
    }

    process {

        try {
            # attempt to select any open youtube tab
            $null = Select-WebbrowserTab -Pattern "*youtube*"

            # verify chrome session exists and is valid
            if ($null -eq $chromeSession -or $chromeSession -isnot [PSCustomObject]) {
                throw "No active YouTube tab found in browser"
            }

            # inform user we're clearing the watch history
            Write-Verbose "Clearing YouTube watch history from local storage..."

            # reset the watch history in local storage
            $null = Invoke-WebbrowserEvaluation `
                -Script "localStorage['oaytvDone'] = '[]'"

            Write-Verbose "YouTube watch history cleared successfully"
        }
        catch {
            throw "Failed to clear YouTube watch history: $_"
        }
    }

    end {
    }
}
################################################################################
