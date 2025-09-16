<##############################################################################
Part of PowerShell module : GenXdev.Queries.AI
Original cmdlet filename  : Open-GithubCopilotQuery.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.270.2025
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
Opens a Github CoPilot query in a webbrowser

.DESCRIPTION
Opens a Github CoPilot query in the webbrowser and automatically enters the
specified query. The function waits for the page to load before typing the
query. This function uses the underlying Open-WebsiteAndPerformQuery function
to handle browser automation and provides a convenient way to interact with
GitHub Copilot from PowerShell with extensive browser configuration options.

.PARAMETER Queries
One or more queries to perform in Github CoPilot

.PARAMETER Language
The language of the returned search results

.PARAMETER Private
Opens in incognito/private browsing mode

.PARAMETER Force
Force enable debugging port, stopping existing browsers if needed

.PARAMETER Edge
Opens in Microsoft Edge

.PARAMETER Chrome
Opens in Google Chrome

.PARAMETER Chromium
Opens in Microsoft Edge or Google Chrome, depending on what the default browser is

.PARAMETER Firefox
Opens in Firefox

.PARAMETER All
Opens in all registered modern browsers

.PARAMETER Monitor
The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to -1, no positioning

.PARAMETER FullScreen
Opens in fullscreen mode

.PARAMETER Width
The initial width of the webbrowser window

.PARAMETER Height
The initial height of the webbrowser window

.PARAMETER X
The initial X position of the webbrowser window

.PARAMETER Y
The initial Y position of the webbrowser window

.PARAMETER Left
Place browser window on the left side of the screen

.PARAMETER Right
Place browser window on the right side of the screen

.PARAMETER Top
Place browser window on the top side of the screen

.PARAMETER Bottom
Place browser window on the bottom side of the screen

.PARAMETER Centered
Place browser window in the center of the screen

.PARAMETER ApplicationMode
Hide the browser controls

.PARAMETER NoBrowserExtensions
Prevent loading of browser extensions

.PARAMETER DisablePopupBlocker
Disable the popup blocker

.PARAMETER AcceptLang
Set the browser accept-lang http header

.PARAMETER KeysToSend
Keystrokes to send to the Browser window, see documentation for cmdlet GenXdev.Windows\Send-Key

.PARAMETER FocusWindow
Focus the browser window after opening

.PARAMETER SetForeground
Set the browser window to foreground after opening

.PARAMETER Maximize
Maximize the window after positioning

.PARAMETER RestoreFocus
Restore PowerShell window focus

.PARAMETER NewWindow
Don't re-use existing browser window, instead, create a new one

.PARAMETER SendKeyEscape
Escape control characters when sending keys

.PARAMETER SendKeyHoldKeyboardFocus
Prevent returning keyboard focus to PowerShell after sending keys

.PARAMETER SendKeyUseShiftEnter
Send Shift+Enter instead of regular Enter for line breaks

.PARAMETER SendKeyDelayMilliSeconds
Delay between sending different key sequences in milliseconds

.PARAMETER PassThru
Returns a [System.Diagnostics.Process] object of the browserprocess

.EXAMPLE
Open-GithubCopilotQuery -Queries "How to implement bubble sort in C#"

.EXAMPLE
aigc "implement binary search"
#>
function Open-GithubCopilotQuery {

    [CmdletBinding()]
    [Alias('aigc', 'askghcopilot')]

    param(
        ###############################################################################
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
        ###############################################################################
        [ValidateSet(
            'Afrikaans',
            'Akan',
            'Albanian',
            'Amharic',
            'Arabic',
            'Armenian',
            'Azerbaijani',
            'Basque',
            'Belarusian',
            'Bemba',
            'Bengali',
            'Bihari',
            'Bork, bork, bork!',
            'Bosnian',
            'Breton',
            'Bulgarian',
            'Cambodian',
            'Catalan',
            'Cherokee',
            'Chichewa',
            'Chinese (Simplified)',
            'Chinese (Traditional)',
            'Corsican',
            'Croatian',
            'Czech',
            'Danish',
            'Dutch',
            'Elmer Fudd',
            'English',
            'Esperanto',
            'Estonian',
            'Ewe',
            'Faroese',
            'Filipino',
            'Finnish',
            'French',
            'Frisian',
            'Ga',
            'Galician',
            'Georgian',
            'German',
            'Greek',
            'Guarani',
            'Gujarati',
            'Hacker',
            'Haitian Creole',
            'Hausa',
            'Hawaiian',
            'Hebrew',
            'Hindi',
            'Hungarian',
            'Icelandic',
            'Igbo',
            'Indonesian',
            'Interlingua',
            'Irish',
            'Italian',
            'Japanese',
            'Javanese',
            'Kannada',
            'Kazakh',
            'Kinyarwanda',
            'Kirundi',
            'Klingon',
            'Kongo',
            'Korean',
            'Krio (Sierra Leone)',
            'Kurdish',
            'Kurdish (Soranî)',
            'Kyrgyz',
            'Laothian',
            'Latin',
            'Latvian',
            'Lingala',
            'Lithuanian',
            'Lozi',
            'Luganda',
            'Luo',
            'Macedonian',
            'Malagasy',
            'Malay',
            'Malayalam',
            'Maltese',
            'Maori',
            'Marathi',
            'Mauritian Creole',
            'Moldavian',
            'Mongolian',
            'Montenegrin',
            'Nepali',
            'Nigerian Pidgin',
            'Northern Sotho',
            'Norwegian',
            'Norwegian (Nynorsk)',
            'Occitan',
            'Oriya',
            'Oromo',
            'Pashto',
            'Persian',
            'Pirate',
            'Polish',
            'Portuguese (Brazil)',
            'Portuguese (Portugal)',
            'Punjabi',
            'Quechua',
            'Romanian',
            'Romansh',
            'Runyakitara',
            'Russian',
            'Scots Gaelic',
            'Serbian',
            'Serbo-Croatian',
            'Sesotho',
            'Setswana',
            'Seychellois Creole',
            'Shona',
            'Sindhi',
            'Sinhalese',
            'Slovak',
            'Slovenian',
            'Somali',
            'Spanish',
            'Spanish (Latin American)',
            'Sundanese',
            'Swahili',
            'Swedish',
            'Tajik',
            'Tamil',
            'Tatar',
            'Telugu',
            'Thai',
            'Tigrinya',
            'Tonga',
            'Tshiluba',
            'Tumbuka',
            'Turkish',
            'Turkmen',
            'Twi',
            'Uighur',
            'Ukrainian',
            'Urdu',
            'Uzbek',
            'Vietnamese',
            'Welsh',
            'Wolof',
            'Xhosa',
            'Yiddish',
            'Yoruba',
            'Zulu')]
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'The language of the returned search results'
        )]
        [string] $Language,
        ###############################################################################
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
            HelpMessage = ('Opens in Microsoft Edge or Google Chrome, depending on what the ' +
                'default browser is')
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
            HelpMessage = ('The monitor to use, 0 = default, -1 is discard, -2 = Configured ' +
                'secondary monitor, defaults to -1, no positioning')
        )]
        [int] $Monitor = -1,
        ###############################################################################
        [Alias('fs', 'f')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in fullscreen mode'
        )]
        [switch] $FullScreen,
        ########################################################################
        [Alias('sw')]
        [switch]$ShowWindow,
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
        ###############################################################################
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
        [string] $AcceptLang,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Keystrokes to send to the Browser window, ' +
                'see documentation for cmdlet GenXdev.Windows\Send-Key')
        )]
        [string[]] $KeysToSend,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Focus the browser window after opening'
        )]
        [Alias('fw','focus')]
        [switch] $FocusWindow,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser window to foreground after opening'
        )]
        [Alias('fg')]
        [switch] $SetForeground,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Maximize the window after positioning'
        )]
        [switch] $Maximize,
        ###############################################################################

        ###############################################################################
        [Alias('rf', 'bg')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Restore PowerShell window focus'
        )]
        [switch]$RestoreFocus,
        ###############################################################################
        [Alias('nw', 'new')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Don't re-use existing browser window, instead, " +
                'create a new one')
        )]
        [switch] $NewWindow,
        ###############################################################################
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Escape control characters when sending keys'
        )]
        [Alias('Escape')]
        [switch] $SendKeyEscape,
        ###############################################################################
        [Alias('HoldKeyboardFocus')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Prevent returning keyboard focus to PowerShell ' +
                'after sending keys')
        )]
        [switch] $SendKeyHoldKeyboardFocus,
        ###############################################################################
        [Alias('UseShiftEnter')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Send Shift+Enter instead of regular Enter for ' +
                'line breaks')
        )]
        [switch] $SendKeyUseShiftEnter,
        ###############################################################################
        [Alias('DelayMilliSeconds')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Delay between sending different key sequences ' +
                'in milliseconds')
        )]
        [int] $SendKeyDelayMilliSeconds,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Remove window borders and title bar for a cleaner appearance'
        )]
        [Alias('nb')]
        [switch] $NoBorders,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use alternative settings stored in session for AI preferences'
        )]
        [switch] $SessionOnly,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Clear alternative settings stored in session for AI preferences'
        )]
        [switch] $ClearSession,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Store settings only in persistent preferences without affecting session'
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession,
        ###############################################################################
        ###############################################################################
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Position browser window either fullscreen on different monitor than PowerShell, or side by side with PowerShell on the same monitor.'
        )]
        [Alias('sbs')]
        [switch] $SideBySide,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Returns a [System.Diagnostics.Process] object ' +
                'of the browserprocess')
        )]
        [switch] $PassThru
    )

    begin {

        # output verbose information about function initialization
        Microsoft.PowerShell.Utility\Write-Verbose 'Initializing query handler'

        # remove queries parameter from bound parameters to prevent conflicts
        $null = $PSBoundParameters.Remove('Queries')

        # ensure url parameter is added to bound parameters
        if (-not $PSBoundParameters.ContainsKey('Url')) {

            $null = $PSBoundParameters.Add('Url', 'Url')
        }

        # ensure monitor parameter is correctly set in bound parameters
        if (-not $PSBoundParameters.ContainsKey('Monitor')) {

            $null = $PSBoundParameters.Add('Monitor', $Monitor)
        }

        # determine language code for web requests based on language setting
        $code = 'www'
        if (-not [string]::IsNullOrWhiteSpace($Language)) {

            # get language code from web language dictionary
            $code = (GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]

            # add accept language header if not already present
            if (-not $PSBoundParameters.ContainsKey('AcceptLang')) {

                $null = $PSBoundParameters.Add('AcceptLang', $code)
            }
        }

        # copy identical parameters between functions for invocation
        $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Queries\Open-WebsiteAndPerformQuery' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        # set the github copilot url as the target website
        $invocationArguments.Url = 'https://github.com/copilot'
    }

    process {

        # process each search query provided by the user
        foreach ($query in $Queries) {

            # output verbose information about the query being processed
            Microsoft.PowerShell.Utility\Write-Verbose "Processing query: $query"

            # set the current query in the invocation arguments
            $invocationArguments.Queries = @($query)

            # invoke the website query function with all parameters
            GenXdev.Queries\Open-WebsiteAndPerformQuery @invocationArguments
        }
    }

    end {

        # output verbose information about query operation completion
        Microsoft.PowerShell.Utility\Write-Verbose 'Query operation completed'
    }
}
###############################################################################