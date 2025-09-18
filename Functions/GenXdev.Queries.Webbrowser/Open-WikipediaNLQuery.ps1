<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Open-WikipediaNLQuery.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.276.2025
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
Opens Dutch Wikipedia searches in a web browser.

.DESCRIPTION
Opens a 'Wikipedia - The Netherlands' query in a webbrowser, with configurable
display options. Supports searching multiple terms and specifying which monitor
to display results on.

.PARAMETER Queries
One or more search terms to look up on Dutch Wikipedia.

.PARAMETER Monitor
Monitor to display browser on (0=default, -1=discard, -2=secondary).

.EXAMPLE
Open-WikipediaNLQuery -Queries "Amsterdam" -Monitor 0

.EXAMPLE
wikinl "Amsterdam" -mon -2
#>
function Open-WikipediaNLQuery {

    [CmdletBinding()]
    [Alias('wikinl')]
    param(
        ########################################################################
        [Alias('q', 'Name', 'Text', 'Query')]
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The query to execute.'
        )]
        [string[]] $Queries,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in incognito/private browsing mode'
        )]
        [Alias('incognito', 'inprivate')]
        [switch] $Private,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Force enable debugging port, stopping existing browsers if needed'
        )]
        [switch] $Force,
        ###############################################################################
        [Alias('e')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Microsoft Edge'
        )]
        [switch] $Edge,
        ###############################################################################
        [Alias('ch')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Google Chrome'
        )]
        [switch] $Chrome,
        ###############################################################################
        [Alias('c')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Microsoft Edge or Google Chrome, depending on what the default browser is'
        )]
        [switch] $Chromium,
        ###############################################################################
        [Alias('ff')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Firefox'
        )]
        [switch] $Firefox,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in all registered modern browsers'
        )]
        [switch] $All,
        ###############################################################################
        [Alias('m', 'mon')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to -1, no positioning'
        )]
        [int] $Monitor = -1,
        ###############################################################################
        [Alias('fs', 'f')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in fullscreen mode'
        )]
        [switch] $FullScreen,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The initial width of the webbrowser window'
        )]
        [int] $Width = -1,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The initial height of the webbrowser window'
        )]
        [int] $Height = -1,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The initial X position of the webbrowser window'
        )]
        [int] $X = -999999,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The initial Y position of the webbrowser window'
        )]
        [int] $Y = -999999,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window on the left side of the screen'
        )]
        [switch] $Left,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window on the right side of the screen'
        )]
        [switch] $Right,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window on the top side of the screen'
        )]
        [switch] $Top,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window on the bottom side of the screen'
        )]
        [switch] $Bottom,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window in the center of the screen'
        )]
        [switch] $Centered,
        ###############################################################################
        [Alias('a', 'app', 'appmode')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Hide the browser controls'
        )]
        [switch] $ApplicationMode,
        ###############################################################################
        [Alias('de', 'ne', 'NoExtensions')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Prevent loading of browser extensions'
        )]
        [switch] $NoBrowserExtensions,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Disable the popup blocker'
        )]
        [Alias('allowpopups')]
        [switch] $DisablePopupBlocker,
        ###############################################################################
        [Alias('lang', 'locale')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser accept-lang http header'
        )]
        [string] $AcceptLang = $null,
        ###########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Keystrokes to send to the Browser window, ' +
                'see documentation for cmdlet GenXdev.Windows\Send-Key')
        )]
        [string[]] $KeysToSend,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Escape control characters when sending keys'
        )]
        [Alias('Escape')]
        [switch] $SendKeyEscape,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Prevent returning keyboard focus to PowerShell ' +
                'after sending keys')
        )]
        [Alias('HoldKeyboardFocus')]
        [switch] $SendKeyHoldKeyboardFocus,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Send Shift+Enter instead of regular Enter for ' +
                'line breaks')
        )]
        [Alias('UseShiftEnter')]
        [switch] $SendKeyUseShiftEnter,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Delay between sending different key sequences ' +
                'in milliseconds')
        )]
        [Alias('DelayMilliSeconds')]
        [int] $SendKeyDelayMilliSeconds,
        ########################################################################        [Alias('fw', 'focus')]
        ###############################################################################
        [Alias('fw', 'focus')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Focus the browser window after opening'
        )]
        [switch] $FocusWindow,
        ###############################################################################
        [Alias('fg')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser window to foreground after opening'
        )]
        [switch] $SetForeground,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Maximize the window after positioning'
        )]
        [switch] $Maximize,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Restore PowerShell window focus'
        )]
        [Alias('rf', 'bg')]
        [switch] $RestoreFocus,
        ###############################################################################
        [Alias('nw', 'new')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't re-use existing browser window, instead, create a new one"
        )]
        [switch] $NewWindow,
        ###############################################################################
        ###############################################################################
        [Alias('pt')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Returns a [System.Diagnostics.Process] object of the browserprocess'
        )]
        [switch] $PassThru,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't open webbrowser, just return the url"
        )]
        [switch] $ReturnURL,
        ########################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'After opening webbrowser, return the url'
        )]
        [switch] $ReturnOnlyURL,
        ###############################################################################
        ###############################################################################
        [Alias('nb')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Removes window borders from the browser window'
        )]
        [switch] $NoBorders,
        ###############################################################################
        ###############################################################################
        [Alias('sbs')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens two browser windows side by side'
        )]
        [switch] $SideBySide,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use session-only cookies (no persistent cookies)'
        )]
        [switch] $SessionOnly,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Clear browser session data before opening'
        )]
        [switch] $ClearSession,
        ###############################################################################
        ###############################################################################
        [Alias('FromPreferences')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Skip restoring previous browser session'
        )]
        [switch] $SkipSession

    )

    begin {
    }


    process {

        # process each search query
        foreach ($query in $Queries) {

            Microsoft.PowerShell.Utility\Write-Verbose "Processing query: $query"

            # determine google domain based on language
            $code = 'www'
            if (-not [string]::IsNullOrWhiteSpace($Language)) {
                $code = (GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]

                if (-not $PSBoundParameters.ContainsKey('AcceptLang')) {

                    $null = $PSBoundParameters.Add('AcceptLang', $code)
                }
            }

            # construct and encode the google search url
            $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Queries\Open-WikipediaQuery' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable -Scope Local -ErrorAction SilentlyContinue)

            $invocationArguments.'Language' = 'Dutch'

            GenXdev.Queries\Open-WikipediaQuery @invocationArguments
        }
    }

    end {
    }
}