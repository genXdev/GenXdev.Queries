<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Open-GoogleQuery.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.286.2025
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
Opens Google queries in a web browser with configurable settings and extensive
customization options.

.DESCRIPTION
Opens one or more Google queries in a web browser with comprehensive support
for multiple languages, monitor selection, window positioning, browser
selection, and keyboard automation. The function provides a feature-rich
interface for performing Google searches with precise control over browser
behavior and appearance.

Key features include:
- Support for 100+ languages via Google's language filtering
- Multi-monitor support with automatic or manual monitor selection
- Window positioning (left, right, top, bottom, centered, fullscreen)
- Private/incognito browsing mode support
- Application mode for distraction-free browsing
- Extension and popup blocking options
- Focus management and window manipulation
- Batch query processing with pipeline support
- Keystroke automation to browser windows
- Smart parameter pass-through to underlying browser functions

The function automatically formats search queries for Google's search engine
and applies language filtering when specified. All browser positioning and
management features are inherited from the underlying Open-Webbrowser function.

.PARAMETER Queries
The search terms to query on Google. Supports multiple queries via pipeline
input or array specification. Each query is automatically URL-encoded for
safe transmission to Google's search servers.

.PARAMETER Language
The language for Google search results. Supports over 100 languages including
major world languages, regional dialects, and specialty languages like
Klingon and Pirate. The language setting affects both the search interface
and result filtering.

.PARAMETER Private
Opens the browser in private/incognito browsing mode. Uses InPrivate for
Edge and incognito for Chrome to prevent search history retention.

.PARAMETER Force
Forces enabling of the debugging port by stopping existing browser instances
if needed. Useful when browser automation features are required.

.PARAMETER Edge
Specifically opens queries in Microsoft Edge browser.

.PARAMETER Chrome
Specifically opens queries in Google Chrome browser.

.PARAMETER Chromium
Opens queries in either Microsoft Edge or Google Chrome, depending on which
is set as the default browser. Prefers Chromium-based browsers.

.PARAMETER Firefox
Specifically opens queries in Mozilla Firefox browser.

.PARAMETER All
Opens the specified queries in all installed modern browsers simultaneously.

.PARAMETER Monitor
The monitor to use for window placement:
- 0 = Primary monitor
- -1 = Discard positioning (no window management)
- -2 = Configured secondary monitor
Defaults to -1 for fast query execution without positioning.

.PARAMETER FullScreen
Opens the browser in fullscreen mode using F11 key simulation.

.PARAMETER Width
The initial width of the browser window in pixels. When not specified,
uses the monitor's working area width or half-width for side positioning.

.PARAMETER Height
The initial height of the browser window in pixels. When not specified,
uses the monitor's working area height or half-height for top/bottom
positioning.

.PARAMETER X
The initial X coordinate for window placement. When not specified, uses
the monitor's left edge. Can be specified relative to the selected monitor.

.PARAMETER Y
The initial Y coordinate for window placement. When not specified, uses
the monitor's top edge. Can be specified relative to the selected monitor.

.PARAMETER Left
Positions the browser window on the left half of the screen.

.PARAMETER Right
Positions the browser window on the right half of the screen.

.PARAMETER Top
Positions the browser window on the top half of the screen.

.PARAMETER Bottom
Positions the browser window on the bottom half of the screen.

.PARAMETER Centered
Centers the browser window on the screen using 80% of the screen dimensions.

.PARAMETER ApplicationMode
Hides browser controls for a distraction-free search experience. Creates an
app-like interface for focused research.

.PARAMETER NoBrowserExtensions
Prevents loading of browser extensions during the search session. Uses safe
mode for Firefox and --disable-extensions for Chromium browsers.

.PARAMETER DisablePopupBlocker
Disables the browser's popup blocking functionality to allow search-related
popups and advertisements.

.PARAMETER AcceptLang
Sets the browser's Accept-Language HTTP header for internationalization.
Overrides the language parameter when both are specified.

.PARAMETER KeysToSend
Keystrokes to send to the browser window after opening the search. Uses the
same format as the GenXdev.Windows\Send-Key cmdlet for automation.

.PARAMETER SendKeyEscape
Escapes control characters when sending keystrokes to the browser window.

.PARAMETER SendKeyHoldKeyboardFocus
Prevents returning keyboard focus to PowerShell after sending keystrokes
to the browser window.

.PARAMETER SendKeyUseShiftEnter
Uses Shift+Enter instead of regular Enter for line breaks when sending
keystrokes to the browser.

.PARAMETER SendKeyDelayMilliSeconds
Delay between sending different key sequences in milliseconds. Useful for
slower systems or complex automation scenarios.

.PARAMETER FocusWindow
Gives focus to the browser window after opening the search.

.PARAMETER SetForeground
Brings the browser window to the foreground after opening the search.

.PARAMETER Maximize
Maximizes the browser window after positioning for full-screen search
experience.

.PARAMETER RestoreFocus
Returns focus to the PowerShell window after opening the browser. Useful
for automated workflows where you want to continue working in PowerShell.

.PARAMETER NewWindow
Forces creation of a new browser window instead of reusing existing windows
for each search query.

.PARAMETER PassThru
Returns a PowerShell process object representing the browser process for
further automation or monitoring.

.PARAMETER ReturnURL
Don't open the web browser, just return the formatted Google search URL
for the query without launching any browser.

.PARAMETER ReturnOnlyURL
After opening the web browser with the search, return the formatted Google
search URL. Useful for logging or further processing.

.EXAMPLE
Open-GoogleQuery -Queries "PowerShell scripting" -Language "English" -Monitor 0

Opens a Google search for "PowerShell scripting" in English on the primary
monitor.

.EXAMPLE
q "machine learning algorithms" -m 2 -fs

Opens a Google search for "machine learning algorithms" in fullscreen mode
on monitor 2 using aliases.

.EXAMPLE
"PowerShell", "Python", "JavaScript" | Open-GoogleQuery -Language "English" -Chrome

Opens multiple Google searches in Chrome via pipeline input, each in English.

.EXAMPLE
Open-GoogleQuery -Queries "artificial intelligence" -Private -NewWindow

Opens a private browsing search for "artificial intelligence" in a new window.

.EXAMPLE
Open-GoogleQuery -Queries "web development" -ApplicationMode -Centered

Opens a search in application mode (no browser controls) centered on screen.
#>
###############################################################################
function Open-GoogleQuery {

    [CmdletBinding()]
    [Alias('q')]

    param(
        #######################################################################
        [Alias('Name', 'Text', 'Query')]
        [Parameter(
            Position = 0,
            Mandatory = $true,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The search terms to query on Google'
        )]
        [string[]] $Queries,
        #######################################################################
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
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'The language for Google search results'
        )]
        [string] $Language,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in incognito/private browsing mode'
        )]
        [Alias('incognito', 'inprivate')]
        [switch] $Private,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Force enable debugging port, stopping existing ' +
                'browsers if needed')
        )]
        [switch] $Force,
        #######################################################################
        [Alias('e')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Microsoft Edge'
        )]
        [switch] $Edge,
        #######################################################################
        [Alias('ch')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Google Chrome'
        )]
        [switch] $Chrome,
        #######################################################################
        [Alias('c')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Opens in Microsoft Edge or Google Chrome, ' +
                'depending on what the default browser is')
        )]
        [switch] $Chromium,
        #######################################################################
        [Alias('ff')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Firefox'
        )]
        [switch] $Firefox,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in all registered modern browsers'
        )]
        [switch] $All,
        #######################################################################
        [Alias('m', 'mon')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('The monitor to use, 0 = default, -1 is discard, ' +
                '-2 = Configured secondary monitor, defaults to -1')
        )]
        [int] $Monitor = -1,
        #######################################################################
        [Alias('fs', 'f')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in fullscreen mode'
        )]
        [switch] $FullScreen,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The initial width of the webbrowser window'
        )]
        [int] $Width = -1,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The initial height of the webbrowser window'
        )]
        [int] $Height = -1,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The initial X position of the webbrowser window'
        )]
        [int] $X = -999999,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'The initial Y position of the webbrowser window'
        )]
        [int] $Y = -999999,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window on the left side of the screen'
        )]
        [switch] $Left,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Place browser window on the right side of ' +
                'the screen')
        )]
        [switch] $Right,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window on the top side of the screen'
        )]
        [switch] $Top,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Place browser window on the bottom side of ' +
                'the screen')
        )]
        [switch] $Bottom,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window in the center of the screen'
        )]
        [switch] $Centered,
        #######################################################################
        [Alias('a', 'app', 'appmode')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Hide the browser controls'
        )]
        [switch] $ApplicationMode,
        #######################################################################
        [Alias('de', 'ne', 'NoExtensions')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Prevent loading of browser extensions'
        )]
        [switch] $NoBrowserExtensions,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Disable the popup blocker'
        )]
        [Alias('allowpopups')]
        [switch] $DisablePopupBlocker,
        #######################################################################
        [Alias('lang', 'locale')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser accept-lang http header'
        )]
        [string] $AcceptLang = $null,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Keystrokes to send to the Browser window, ' +
                'see documentation for cmdlet GenXdev.Windows\Send-Key')
        )]
        [string[]] $KeysToSend,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Escape control characters when sending keys'
        )]
        [Alias('Escape')]
        [switch] $SendKeyEscape,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Prevent returning keyboard focus to PowerShell ' +
                'after sending keys')
        )]
        [Alias('HoldKeyboardFocus')]
        [switch] $SendKeyHoldKeyboardFocus,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Send Shift+Enter instead of regular Enter for ' +
                'line breaks')
        )]
        [Alias('UseShiftEnter')]
        [switch] $SendKeyUseShiftEnter,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Delay between sending different key sequences ' +
                'in milliseconds')
        )]
        [Alias('DelayMilliSeconds')]
        [int] $SendKeyDelayMilliSeconds,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Focus the browser window after opening'
        )]
        [Alias('fw','focus')]
        [switch] $FocusWindow,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser window to foreground after opening'
        )]
        [Alias('fg')]
        [switch] $SetForeground,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Maximize the window after positioning'
        )]
        [switch] $Maximize,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Restore PowerShell window focus'
        )]
        [Alias('rf', 'bg')]
        [switch] $RestoreFocus,
        #######################################################################
        [Alias('nw', 'new')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Don't re-use existing browser window, instead, " +
                'create a new one')
        )]
        [switch] $NewWindow,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Returns a [System.Diagnostics.Process] object ' +
                'of the browserprocess')
        )]
        [Alias('pt')]
        [switch] $PassThru,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't open webbrowser, just return the url"
        )]
        [switch] $ReturnURL,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'After opening webbrowser, return the url'
        )]
        [switch] $ReturnOnlyURL,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Removes the borders of the window'
        )]
        [Alias('nb')]
        [switch] $NoBorders,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Use alternative settings stored in session for AI ' +
                'preferences')
        )]
        [switch] $SessionOnly,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Clear alternative settings stored in session for AI ' +
                'preferences')
        )]
        [switch] $ClearSession,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Store settings only in persistent preferences without ' +
                'affecting session')
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession,
        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Position browser window either fullscreen on different monitor than PowerShell, or side by side with PowerShell on the same monitor.'
        )]
        [Alias('sbs')]
        [switch] $SideBySide
        #######################################################################
    )

    begin {

        # copy identical parameters between this function and Open-Webbrowser
        $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Webbrowser\Open-Webbrowser' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        # initialize language code for google search filtering
        $code = $null

        # check if a language was specified for search results
        if (-not [string]::IsNullOrWhiteSpace($Language)) {

            # retrieve the language code from the language dictionary
            $code = (GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]

            # set accept-lang header if not already specified by user
            if (-not $PSBoundParameters.ContainsKey('AcceptLang')) {

                # automatically set the accept language header
                $null = $invocationArguments.AcceptLang = $code
            }
        }

        # default to english if no valid language code was found
        if ([string]::IsNullOrWhiteSpace($code)) {

            $code = 'en'
        }
    }


    process {

        # iterate through each search query provided by the user
        foreach ($query in $Queries) {

            # output verbose information about the current query being processed
            Microsoft.PowerShell.Utility\Write-Verbose "Processing query: $query"

            # construct the google search url with proper encoding and language
            $invocationArguments.'Url' = (
                'https://www.google.com/search?q=' +
                "$([Uri]::EscapeUriString($query))&udm=14&lr=lang_$code"
            )

            # check if user only wants the url without opening browser
            if ($ReturnOnlyURL) {

                # return the formatted url without opening any browser
                Microsoft.PowerShell.Utility\Write-Output (
                    $invocationArguments.Url
                )
                continue
            }

            # launch the browser with the constructed google search url
            GenXdev.Webbrowser\Open-Webbrowser @invocationArguments

            # return the url if the user requested it along with browser launch
            if ($ReturnURL) {

                # output the formatted google search url
                Microsoft.PowerShell.Utility\Write-Output (
                    $invocationArguments.Url
                )
            }
        }
    }

    end {
    }
}
###############################################################################