<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Clear-YoutubeWatched.ps1
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