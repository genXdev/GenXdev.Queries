<##############################################################################
Part of PowerShell module : GenXdev.Queries.Websites
Original cmdlet filename  : Open-GameOfLife.ps1
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
################################################################################
<#
.SYNOPSIS
Opens Conway's Game of Life simulation in a web browser.

.DESCRIPTION
Opens an interactive Conway's Game of Life simulation in a web browser window
with extensive positioning and configuration options. Conway's Game of Life is
a cellular automaton devised by mathematician John Conway in 1970, consisting
of a grid of cells that can be in one of two states: alive or dead.

This function provides comprehensive browser control including window
positioning, browser selection, private browsing, and automated interaction
capabilities. The simulation runs at https://conway.genxdev.net/ and supports
various interaction modes.

.PARAMETER Language
The language preference for the browser interface and content localization.
Sets the Accept-Language HTTP header and determines the language code used
for international support.

.PARAMETER Private
Opens the browser in private/incognito browsing mode for enhanced privacy.
Uses InPrivate mode for Edge and incognito mode for Chrome.

.PARAMETER Force
Forces enabling of the debugging port by stopping existing browser instances
if needed. Useful when browser debugging features are required.

.PARAMETER Edge
Specifically opens the Game of Life in Microsoft Edge browser.

.PARAMETER Chrome
Specifically opens the Game of Life in Google Chrome browser.

.PARAMETER Chromium
Opens the Game of Life in either Microsoft Edge or Google Chrome, depending
on which is set as the default browser. Prefers Chromium-based browsers.

.PARAMETER Firefox
Specifically opens the Game of Life in Mozilla Firefox browser.

.PARAMETER All
Opens the Game of Life in all installed modern browsers simultaneously.

.PARAMETER Monitor
The monitor to use for window placement:
- 0 = Primary monitor
- -1 = Discard positioning
- -2 = Configured secondary monitor (uses $Global:DefaultSecondaryMonitor)
- 1+ = Specific monitor number

.PARAMETER FullScreen
Opens the browser in fullscreen mode using F11 key simulation for an
immersive Game of Life experience.

.PARAMETER Width
The initial width of the browser window in pixels. When not specified, uses
the monitor's working area width or half-width for side positioning.

.PARAMETER Height
The initial height of the browser window in pixels. When not specified, uses
the monitor's working area height or half-height for top/bottom positioning.

.PARAMETER X
The initial X coordinate for window placement. When not specified, uses the
monitor's left edge. Can be specified relative to the selected monitor.

.PARAMETER Y
The initial Y coordinate for window placement. When not specified, uses the
monitor's top edge. Can be specified relative to the selected monitor.

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
Hides browser controls for a distraction-free Game of Life experience.
Creates an app-like interface for focused simulation viewing.

.PARAMETER NoBrowserExtensions
Prevents loading of browser extensions. Uses safe mode for Firefox and
--disable-extensions for Chromium browsers.

.PARAMETER DisablePopupBlocker
Disables the browser's popup blocking functionality to allow any simulation
popups or help windows.

.PARAMETER AcceptLang
Sets the browser's Accept-Language HTTP header for internationalization.
Overrides the Language parameter when both are specified.

.PARAMETER KeysToSend
Keystrokes to send to the browser window after opening the simulation. Uses
the same format as the GenXdev.Windows\Send-Key cmdlet for automation.

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
Gives focus to the browser window after opening the simulation.

.PARAMETER SetForeground
Brings the browser window to the foreground after opening the simulation.

.PARAMETER Maximize
Maximizes the browser window after positioning for full-screen Game of Life
experience.

.PARAMETER RestoreFocus
Returns focus to the PowerShell window after opening the browser. Useful
for automated workflows where you want to continue working in PowerShell.

.PARAMETER NewWindow
Forces creation of a new browser window instead of reusing existing windows
for each simulation instance.

.PARAMETER PassThru
Returns a PowerShell process object representing the browser process for
further automation or monitoring.

.PARAMETER ReturnURL
Don't open the web browser, just return the Game of Life simulation URL
without launching any browser.

.PARAMETER ReturnOnlyURL
After opening the web browser with the simulation, return the URL. Useful
for logging or further processing.

.PARAMETER NoFullScreen
Prevents the browser from opening in fullscreen mode. Overrides the default
fullscreen behavior.

.PARAMETER NoApplicationMode
Shows the browser controls instead of hiding them. Overrides the default
application mode behavior.

.EXAMPLE
Open-GameOfLife -Monitor 1 -FullScreen

Opens Conway's Game of Life in fullscreen mode on monitor 1.

.EXAMPLE
Open-GameOfLife -Language "French" -Chrome -Private

Opens the Game of Life in French language using Chrome in private mode.

.EXAMPLE
gameoflife -m 0 -app

Opens the Game of Life on the primary monitor in application mode using the
alias.

.EXAMPLE
conway -Edge -Left -Width 800 -Height 600

Opens Conway's Game of Life in Microsoft Edge, positioned on the left side
with specific dimensions.

.NOTES
Requires Windows 10+ Operating System.

This cmdlet is designed for interactive use and performs window manipulation
operations. Avoid touching keyboard/mouse during positioning operations.

Conway's Game of Life is a zero-player game, meaning its evolution is
determined by its initial state, requiring no further input from the user.
#>
################################################################################
function Open-GameOfLife {

    [CmdletBinding()]
    [Alias('gameoflife', 'conway')]

    param(
        ########################################################################
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
            Position = 0,
            HelpMessage = ('The language preference for the browser interface ' +
                'and content localization')
        )]
        [string] $Language,
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
            HelpMessage = ('Force enable debugging port, stopping existing ' +
                'browsers if needed')
        )]
        [switch] $Force,
        ########################################################################
        [Alias('e')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Microsoft Edge'
        )]
        [switch] $Edge,
        ########################################################################
        [Alias('ch')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Google Chrome'
        )]
        [switch] $Chrome,
        ########################################################################
        [Alias('c')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Opens in Microsoft Edge or Google Chrome, ' +
                'depending on what the default browser is')
        )]
        [switch] $Chromium,
        ########################################################################
        [Alias('ff')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Firefox'
        )]
        [switch] $Firefox,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in all registered modern browsers'
        )]
        [switch] $All,
        ########################################################################
        [Alias('m', 'mon')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('The monitor to use, 0 = default, -1 is discard, ' +
                '-2 = Configured secondary monitor, defaults to -1, no positioning')
        )]
        [int] $Monitor = -2,
        ########################################################################
        [Alias('fs', 'f')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in fullscreen mode'
        )]
        [switch] $FullScreen,
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
        [Alias('a', 'app', 'appmode')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Hide the browser controls'
        )]
        [switch] $ApplicationMode,
        ########################################################################
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
        ########################################################################
        [Alias('lang', 'locale')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser accept-lang http header'
        )]
        [string] $AcceptLang = $null,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Keystrokes to send to the Browser window, ' +
                'see documentation for cmdlet GenXdev.Windows\Send-Key')
        )]
        [string[]] $KeysToSend,
        ########################################################################
        [Alias('Escape')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Escape control characters when sending keystrokes to the browser window.'
        )]
        [switch] $SendKeyEscape,
        ########################################################################
        [Alias('HoldKeyboardFocus')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Prevent returning keyboard focus to PowerShell after sending keystrokes to the browser window.'
        )]
        [switch] $SendKeyHoldKeyboardFocus,
        ########################################################################
        [Alias('UseShiftEnter')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use Shift+Enter instead of regular Enter for line breaks when sending keystrokes to the browser.'
        )]
        [switch] $SendKeyUseShiftEnter,
        ########################################################################
        [Alias('DelayMilliSeconds')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Delay between sending different key sequences in milliseconds.'
        )]
        [int] $SendKeyDelayMilliSeconds,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Focus the browser window after opening'
        )]
        [Alias('fw','focus')]
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
            HelpMessage = 'Restore PowerShell window focus after opening the browser.'
        )]
        [Alias('rf', 'bg')]
        [switch] $RestoreFocus,
        ########################################################################
        [Alias('nw', 'new')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Don't re-use existing browser window, instead, " +
                'create a new one')
        )]
        [switch] $NewWindow,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Returns a [System.Diagnostics.Process] object ' +
                'of the browserprocess')
        )]
        [Alias('pt')]
        [switch]$PassThru,

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
        [switch] $ReturnOnlyURL,
        ########################################################################
        [Alias('nfs', 'nf')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't open in fullscreen mode"
        )]
        [switch] $NoFullScreen,
        ########################################################################
        [Alias('na', 'napp', 'noappmode')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Do show the browser controls'
        )]
        [switch] $NoApplicationMode,
        ###############################################################################
        [Alias('nb')]
        [Parameter(
            HelpMessage = 'Removes the borders of the browser window.'
        )]
        [switch] $NoBorders,
        ###############################################################################
        [Alias('sbs')]
        [Parameter(
            HelpMessage = 'Position browser window either fullscreen on different monitor than PowerShell, or side by side with PowerShell on the same monitor.'
        )]
        [switch] $SideBySide,
        ###############################################################################
        [Alias('so')]
        [Parameter(
            HelpMessage = 'Use session-only mode for browser profile (cookies and data cleared on close).'
        )]
        [switch] $SessionOnly,
        ###############################################################################
        [Parameter(
            HelpMessage = 'Clear browser session/profile data before opening.'
        )]
        [switch] $ClearSession,
        ###############################################################################
        [Alias('ss', 'FromPreferences')]
        [Parameter(
            HelpMessage = 'Skip restoring previous browser session.'
        )]
        [switch] $SkipSession
        ###############################################################################
    )

    begin {

        # determine language code based on language parameter
        $code = 'www'
        if (-not [string]::IsNullOrWhiteSpace($Language)) {

            # retrieve language code from the language dictionary
            $code = (GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]

            # set accept-lang header if not already specified
            if (-not $PSBoundParameters.ContainsKey('AcceptLang')) {

                $null = $PSBoundParameters.Add('AcceptLang', $code)
            }
        }

        # copy identical parameters from this function to open-webbrowser
        $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Webbrowser\Open-Webbrowser' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        # set the game of life simulation url
        $invocationArguments.'Url' = 'https://conway.genxdev.net/'

        # handle return url only scenario
        if ($ReturnOnlyURL) {

            Microsoft.PowerShell.Utility\Write-Output ($invocationArguments.Url)
            return
        }

        # configure application mode if not explicitly specified
        if (-not $PSBoundParameters.ContainsKey('ApplicationMode')) {

            $invocationArguments.'ApplicationMode' = -not $NoApplicationMode
        }

        # configure new window behavior if not explicitly specified
        if (-not $PSBoundParameters.ContainsKey('NewWindow')) {

            $invocationArguments.'NewWindow' = $true
        }

        # configure fullscreen behavior if not explicitly specified
        if (-not $PSBoundParameters.ContainsKey('FullScreen')) {

            $invocationArguments.'FullScreen' = -not $NoFullScreen
        }

        # remove nofullscreen parameter to prevent conflicts
        if ($PSBoundParameters.ContainsKey('NoFullScreen')) {

            $null = $PSBoundParameters.Remove('NoFullScreen') |
                Microsoft.PowerShell.Core\Out-Null
        }

        # remove noapplicationmode parameter to prevent conflicts
        if ($PSBoundParameters.ContainsKey('NoApplicationMode')) {

            $null = $PSBoundParameters.Remove('NoApplicationMode') |
                Microsoft.PowerShell.Core\Out-Null
        }
    }

    process {

        # handle return url only scenario in process block
        if ($ReturnOnlyURL) {

            Microsoft.PowerShell.Utility\Write-Output ($invocationArguments.Url)
            return
        }

        # output verbose information about launching the game of life
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Launching Conway's Game of Life simulation at " +
            $invocationArguments.Url
        )

        # launch browser with the game of life simulation
        GenXdev.Webbrowser\Open-Webbrowser @invocationArguments

        # return url if requested
        if ($ReturnURL) {

            Microsoft.PowerShell.Utility\Write-Output ($invocationArguments.Url)
        }
    }

    end {

    }
}
################################################################################