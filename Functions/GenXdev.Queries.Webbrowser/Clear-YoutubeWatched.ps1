<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Clear-YoutubeWatched.ps1
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
        Microsoft.PowerShell.Utility\Write-Verbose 'Searching for an open YouTube browser tab...'
    }


    process {

        try {
            # attempt to select any open youtube tab
            $null = GenXdev.Webbrowser\Select-WebbrowserTab -Name '*youtube*'

            # verify chrome session exists and is valid
            if ($null -eq $chromeSession -or $chromeSession -isnot [PSCustomObject]) {
                throw 'No active YouTube tab found in browser'
            }

            # inform user we're clearing the watch history
            Microsoft.PowerShell.Utility\Write-Verbose 'Clearing YouTube watch history from local storage...'

            # reset the watch history in local storage
            $null = GenXdev.Webbrowser\Invoke-WebbrowserEvaluation `
                -Script "localStorage['oaytvDone'] = '[]'"

            Microsoft.PowerShell.Utility\Write-Verbose 'YouTube watch history cleared successfully'
        }
        catch {
            throw "Failed to clear YouTube watch history: $_"
        }
    }

    end {
    }
}