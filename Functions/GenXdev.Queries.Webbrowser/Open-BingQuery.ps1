<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Open-BingQuery.ps1
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
Opens a Bing search query in a web browser.

.DESCRIPTION
Opens one or more Bing search queries in a web browser, using configurable
browser settings and command line switches. This function provides a
comprehensive interface for performing Bing searches with extensive browser
customization options including window positioning, monitor selection, private
browsing, and keystroke automation.

The function automatically URL-encodes queries and formats them for Bing's
search API. It supports all major browsers including Edge, Chrome, and Firefox
with features like private browsing, application mode, precise window
management, and keystroke automation.

.PARAMETER Queries
The search queries to perform on Bing. Each query is automatically URL-encoded
and formatted for Bing's search API.

.PARAMETER Language
The language of the returned search results. Supports a wide range of languages
including standard languages like English, Spanish, French, as well as
specialized variants like "Bork, bork, bork!" and "Klingon".

.PARAMETER Url
The URLs to open in the browser instead of search queries. When specified,
these URLs are opened directly without performing a Bing search.

.PARAMETER Private
Opens the browser in incognito/private browsing mode for anonymous searching.

.PARAMETER Force
Force enable debugging port, stopping existing browsers if needed.

.PARAMETER Edge
Opens the search in Microsoft Edge browser.

.PARAMETER Chrome
Opens the search in Google Chrome browser.

.PARAMETER Chromium
Opens the search in Microsoft Edge or Google Chrome, depending on which is
set as the default browser.

.PARAMETER Firefox
Opens the search in Mozilla Firefox browser.

.PARAMETER All
Opens the search in all registered modern browsers simultaneously.

.PARAMETER Monitor
The monitor to display the browser on:
0 = default monitor
-1 = discard window positioning
-2 = configured secondary monitor

.PARAMETER FullScreen
Opens the browser in fullscreen mode.

.PARAMETER Width
The initial width of the webbrowser window in pixels.

.PARAMETER Height
The initial height of the webbrowser window in pixels.

.PARAMETER X
The initial X position of the webbrowser window.

.PARAMETER Y
The initial Y position of the webbrowser window.

.PARAMETER Left
Place browser window on the left side of the screen.

.PARAMETER Right
Place browser window on the right side of the screen.

.PARAMETER Top
Place browser window on the top side of the screen.

.PARAMETER Bottom
Place browser window on the bottom side of the screen.

.PARAMETER Centered
Place browser window in the center of the screen.

.PARAMETER ApplicationMode
Hide the browser controls for a distraction-free search experience.

.PARAMETER NoBrowserExtensions
Prevent loading of browser extensions during the search session.

.PARAMETER DisablePopupBlocker
Disable the popup blocker to allow search-related popups.

.PARAMETER AcceptLang
Set the browser accept-lang http header for localized search results.

.PARAMETER KeysToSend
Keystrokes to send to the browser window after opening. Uses the same format
as the GenXdev.Windows\Send-Key cmdlet.

.PARAMETER FocusWindow
Focus the browser window after opening the search.

.PARAMETER SetForeground
Set the browser window to foreground after opening.

.PARAMETER Maximize
Maximize the browser window after positioning.

.PARAMETER RestoreFocus
Restore PowerShell window focus after opening the search.

.PARAMETER NewWindow
Don't re-use existing browser window, instead create a new one.

.PARAMETER PassThru
Returns a PowerShell process object representing the browser process.

.PARAMETER ReturnURL
Don't open webbrowser, just return the formatted search URL.

.PARAMETER ReturnOnlyURL
After opening webbrowser, return the formatted search URL.

.PARAMETER SendKeyEscape
Escape control characters when sending keystrokes to the browser.

.PARAMETER SendKeyHoldKeyboardFocus
Prevent returning keyboard focus to PowerShell after sending keystrokes.

.PARAMETER SendKeyUseShiftEnter
Send Shift+Enter instead of regular Enter for line breaks when sending keys.

.PARAMETER SendKeyDelayMilliSeconds
Delay between sending different key sequences in milliseconds.

.PARAMETER NoBorders
Removes the borders of the window.

.PARAMETER SideBySide
Will either set the window fullscreen on a different monitor than Powershell,
or side by side with Powershell on the same monitor.

.PARAMETER SessionOnly
Use alternative settings stored in session for AI preferences.

.PARAMETER ClearSession
Clear alternative settings stored in session for AI preferences.

.PARAMETER SkipSession
Store settings only in persistent preferences without affecting session.

.EXAMPLE
Open-BingQuery -Queries "PowerShell scripting" -Monitor 0

Opens a Bing search for "PowerShell scripting" on the default monitor.

.EXAMPLE
bq "PowerShell scripting" -m 0

Opens a Bing search using the alias and short parameter names.

.EXAMPLE
Open-BingQuery -Queries "machine learning" -Language "English" -Private

Opens a private browsing session to search for "machine learning" with
English language results.

.EXAMPLE
"PowerShell", "automation", "scripting" | Open-BingQuery -All -Left

Searches for multiple terms via pipeline and opens results in all installed
browsers, positioning windows on the left side of the screen.
#>
function Open-BingQuery {

    [CmdletBinding()]
    [Alias('bq')]
    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The query to execute.'
        )]
        [Alias('q', 'Name', 'Text', 'Query')]
        [string[]] $Queries,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'The language of the returned search results'
        )]
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
        [string] $Language,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('The monitor to use, 0 = default, -1 is discard, ' +
                '-2 = Configured secondary monitor, defaults to ' +
                "`$Global:DefaultSecondaryMonitor or 2 if not found")
        )]
        [Alias('m', 'mon')]
        [int] $Monitor = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The initial width of the webbrowser window'
        )]
        [int] $Width = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The initial height of the webbrowser window'
        )]
        [int] $Height = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The initial X position of the webbrowser window'
        )]
        [int] $X = -999999,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The initial Y position of the webbrowser window'
        )]
        [int] $Y = -999999,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser accept-lang http header'
        )]
        [Alias('lang', 'locale')]
        [string] $AcceptLang,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Force enable debugging port, stopping existing ' +
                'browsers if needed')
        )]
        [switch] $Force,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Microsoft Edge'
        )]
        [Alias('e')]
        [switch] $Edge,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Google Chrome'
        )]
        [Alias('ch')]
        [switch] $Chrome,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Opens in Microsoft Edge or Google Chrome, ' +
                'depending on what the default browser is')
        )]
        [Alias('c')]
        [switch] $Chromium,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Firefox'
        )]
        [Alias('ff')]
        [switch] $Firefox,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in all registered modern browsers'
        )]
        [switch] $All,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window on the left side of the screen'
        )]
        [switch] $Left,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window on the right side of the screen'
        )]
        [switch] $Right,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window on the top side of the screen'
        )]
        [switch] $Top,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window on the bottom side of the screen'
        )]
        [switch] $Bottom,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window in the center of the screen'
        )]
        [switch] $Centered,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in fullscreen mode'
        )]
        [Alias('fs', 'f')]
        [switch] $FullScreen,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in incognito/private browsing mode'
        )]
        [Alias('incognito', 'inprivate')]
        [switch] $Private,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Hide the browser controls'
        )]
        [Alias('a', 'app', 'appmode')]
        [switch] $ApplicationMode,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Prevent loading of browser extensions'
        )]
        [Alias('de', 'ne', 'NoExtensions')]
        [switch] $NoBrowserExtensions,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Disable the popup blocker'
        )]
        [Alias('allowpopups')]
        [switch] $DisablePopupBlocker,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Focus the browser window after opening'
        )]
        [Alias('fw', 'focus')]
        [switch] $FocusWindow,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser window to foreground after opening'
        )]
        [Alias('fg')]
        [switch] $SetForeground,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Maximize the window after positioning'
        )]
        [switch] $Maximize,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Returns a PowerShell object of ' +
                'the browserprocess')
        )]
        [Alias('pt')]
        [switch] $PassThru,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Removes the borders of the window'
        )]
        [Alias('nb')]
        [switch] $NoBorders,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Restore PowerShell window focus'
        )]
        [Alias('rf', 'bg')]
        [switch] $RestoreFocus,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Will either set the window fullscreen on a different ' +
                'monitor than Powershell, or side by side with Powershell on the ' +
                'same monitor')
        )]
        [Alias('sbs')]
        [switch] $SideBySide,
        ########################################################################
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
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Use alternative settings stored in session for AI ' +
                'preferences')
        )]
        [switch] $SessionOnly,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Clear alternative settings stored in session for AI ' +
                'preferences')
        )]
        [switch] $ClearSession,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Store settings only in persistent preferences without ' +
                'affecting session')
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Don't re-use existing browser window, instead, " +
                'create a new one')
        )]
        [Alias('nw', 'new')]
        [switch] $NewWindow,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't open webbrowser, just return the url"
        )]
        [switch] $ReturnURL,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'After opening webbrowser, return the url'
        )]
        [switch] $ReturnOnlyURL
        ########################################################################
    )

    begin {

    }

    process {

        # process each search query provided in the queries parameter
        foreach ($query in $Queries) {

            # output verbose information about the query being processed
            Microsoft.PowerShell.Utility\Write-Verbose (
                "Processing query: $query"
            )

            # copy identical parameters from this function to open-webbrowser
            $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
                -BoundParameters $PSBoundParameters `
                -FunctionName 'GenXdev.Webbrowser\Open-Webbrowser' `
                -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                    -Scope Local `
                    -ErrorAction SilentlyContinue)

            # process language parameter if specified by user
            if (-not [string]::IsNullOrWhiteSpace($Language)) {

                # get the language code from the web language dictionary
                $code = (GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]

                # set accept-lang header if not already specified
                if (-not $PSBoundParameters.ContainsKey('AcceptLang')) {

                    # assign language code to invocation arguments
                    $null = $invocationArguments.AcceptLang = $code
                }
            }

            # construct the bing search url with properly encoded query
            $invocationArguments.'Url' = (
                "https://www.bing.com/search?q=$([Uri]::EscapeUriString($query))"
            )

            # handle return url only scenario without opening browser
            if ($ReturnOnlyURL) {

                # output the formatted url without opening browser
                Microsoft.PowerShell.Utility\Write-Output (
                    $invocationArguments.Url
                )

                # return early to avoid opening browser
                return
            }

            # open search in browser with inherited parameters
            GenXdev.Webbrowser\Open-Webbrowser @invocationArguments
        }
    }

    end {

    }
}
###############################################################################