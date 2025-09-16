<##############################################################################
Part of PowerShell module : GenXdev.Queries.Websites
Original cmdlet filename  : Open-Yab.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.264.2025
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
Opens the YAB game in a web browser with configurable settings.

.DESCRIPTION
Opens the YAB game website in a specified browser with various display and
behavior options. Supports different game modes including spectator mode.
The YAB game is an online puzzle game that can be played interactively or
watched in spectator mode where AI plays automatically.

.PARAMETER Language
The language of the game interface. Supports multiple languages including
English, Spanish, French, German, and many others.

.PARAMETER SpectateOnly
Don't start a new game, just watch the AI play automatically.

.PARAMETER Private
Opens in incognito/private browsing mode.

.PARAMETER Force
Force enable debugging port, stopping existing browsers if needed.

.PARAMETER Edge
Opens in Microsoft Edge.

.PARAMETER Chrome
Opens in Google Chrome.

.PARAMETER Chromium
Opens in Microsoft Edge or Google Chrome, depending on default browser.

.PARAMETER Firefox
Opens in Firefox.

.PARAMETER All
Opens in all registered modern browsers.

.PARAMETER Monitor
The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
monitor.

.PARAMETER FullScreen
Opens in fullscreen mode.

.PARAMETER Width
The initial width of the webbrowser window.

.PARAMETER Height
The initial height of the webbrowser window.

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
Hide the browser controls.

.PARAMETER NoBrowserExtensions
Prevent loading of browser extensions.

.PARAMETER DisablePopupBlocker
Disable the popup blocker.

.PARAMETER AcceptLang
Set the browser accept-lang http header.

.PARAMETER KeysToSend
Keystrokes to send to the browser window, see documentation for cmdlet
GenXdev.Windows\Send-Key.

.PARAMETER FocusWindow
Focus the browser window after opening.

.PARAMETER SetForeground
Set the browser window to foreground after opening.

.PARAMETER Maximize
Maximize the browser window after positioning.

.PARAMETER RestoreFocus
Restore PowerShell window focus.

.PARAMETER NewWindow
Don't re-use existing browser window, create a new one.

.PARAMETER PassThru
Returns a [System.Diagnostics.Process] object of the browser process.

.PARAMETER ReturnURL
Don't open webbrowser, just return the url.

.PARAMETER ReturnOnlyURL
After opening webbrowser, return the url.

.PARAMETER NoFullScreen
Don't open in fullscreen mode.

.PARAMETER NoApplicationMode
Do show the browser controls.

.PARAMETER SendKeyEscape
Escape control characters when sending keys.

.PARAMETER SendKeyHoldKeyboardFocus
Prevent returning keyboard focus to PowerShell after sending keys.

.PARAMETER SendKeyUseShiftEnter
Send Shift+Enter instead of regular Enter for line breaks.

.PARAMETER SendKeyDelayMilliSeconds
Delay between sending different key sequences in milliseconds.

.EXAMPLE
Open-Yab -SpectateOnly -Chrome -NoFullScreen -Language "English"

Opens YAB game in spectator mode using Chrome browser without fullscreen,
with English language interface.

.EXAMPLE
yab -e -Private -Monitor 2

Opens YAB game in Edge browser with private browsing on monitor 2 using
aliases for quick access.
#>
function Open-Yab {

    [CmdletBinding()]
    [Alias('yab')]
    param(
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
            Position = 0,
            HelpMessage = 'The language of the game interface'
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
            HelpMessage = ('Force enable debugging port, stopping existing ' +
                'browsers if needed')
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
            HelpMessage = ('Opens in Microsoft Edge or Google Chrome, ' +
                'depending on what the default browser is')
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
            HelpMessage = ('The monitor to use, 0 = default, -1 is discard, ' +
                '-2 = Configured secondary monitor, defaults to -1, no ' +
                'positioning')
        )]
        [int] $Monitor = -2,
        ###############################################################################
        [Alias('fs', 'f')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in fullscreen mode'
        )]
        [switch] $FullScreen,
        ###############################################################################
        [Alias('sw')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Show the browser window (not minimized or hidden)'
        )]
        [switch] $ShowWindow,
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
        [string] $AcceptLang = $null,
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

        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Restore PowerShell window focus'
        )]
        [Alias('r', 'bg', 'rf')]
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
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Returns a [System.Diagnostics.Process] object of ' +
                'the browserprocess')
        )]
        [Alias('pt')]
        [switch]$PassThru,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't open webbrowser, just return the url"
        )]
        [switch] $ReturnURL,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'After opening webbrowser, return the url'
        )]
        [switch] $ReturnOnlyURL,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't start a new game, just watch the AI play"
        )]
        [switch] $SpectateOnly,
        ###############################################################################
        [Alias('nfs', 'nf')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't open in fullscreen mode"
        )]
        [switch] $NoFullScreen,
        ###############################################################################
        [Alias('na', 'napp', 'noappmode')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Do show the browser controls'
        )]
        [switch] $NoApplicationMode,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Escape control characters when sending keys'
        )]
        [Alias('Escape')]
        [switch] $SendKeyEscape,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Prevent returning keyboard focus to PowerShell ' +
                'after sending keys')
        )]
        [Alias('HoldKeyboardFocus')]
        [switch] $SendKeyHoldKeyboardFocus,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Send Shift+Enter instead of regular Enter for ' +
                'line breaks')
        )]
        [Alias('UseShiftEnter')]
        [switch] $SendKeyUseShiftEnter,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Delay between sending different key sequences ' +
                'in milliseconds')
        )]
        [Alias('DelayMilliSeconds')]
        [int] $SendKeyDelayMilliSeconds,
        ###############################################################################
        [Parameter(
            HelpMessage = 'Removes the borders of the browser window.'
        )]
        [Alias('nb')]
        [switch] $NoBorders,
        ###############################################################################
        [Parameter(
            HelpMessage = 'Position browser window either fullscreen on different monitor than PowerShell, or side by side with PowerShell on the same monitor.'
        )]
        [Alias('sbs')]
        [switch] $SideBySide,
        ###############################################################################
        [Parameter(
            HelpMessage = 'Use alternative settings stored in session for AI preferences.'
        )]
        [switch] $SessionOnly,
        ###############################################################################
        [Parameter(
            HelpMessage = 'Clear alternative settings stored in session for AI preferences.'
        )]
        [switch] $ClearSession,
        ###############################################################################
        [Parameter(
            HelpMessage = 'Store settings only in persistent preferences without affecting session.'
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession
    )

    begin {

        # determine google domain based on language
        $code = 'www'
        if (-not [string]::IsNullOrWhiteSpace($Language)) {

            # get the language code from the language dictionary
            $code = (GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]

            # set accept-lang header if not already specified
            if (-not $PSBoundParameters.ContainsKey('AcceptLang')) {

                $null = $PSBoundParameters.Add('AcceptLang', $code)
            }
        }

        # configure default application mode behavior
        if (-not $PSBoundParameters.ContainsKey('NoApplicationMode')) {

            # enable application mode for clean interface
            $null = $PSBoundParameters.Add('ApplicationMode', $true);

            # create new window for application mode
            if (-not $PSBoundParameters.ContainsKey('NewWindow')) {

                $null = $PSBoundParameters.Add('-NewWindow', $true);
            }

            # enable fullscreen mode for immersive experience
            if (-not $PSBoundParameters.ContainsKey('FullScreen')) {

                $null = $PSBoundParameters.Add('FullScreen', $true);
            }
        }

        # remove nofullscreen parameters from bound parameters
        if ($PSBoundParameters.ContainsKey('NoFullScreen')) {

            $null = $PSBoundParameters.Remove('NoFullScreen')
        }

        # remove duplicate nofullscreen check
        if ($PSBoundParameters.ContainsKey('NoFullScreen')) {

            $null = $PSBoundParameters.Remove('NoFullScreen')
        }

        # remove noapplicationmode parameter from bound parameters
        if ($PSBoundParameters.ContainsKey('NoApplicationMode')) {

            $null = $PSBoundParameters.Remove('NoApplicationMode')
        }

        # configure browser extensions behavior
        if (-not $PSBoundParameters.ContainsKey('BrowserExtensions')) {

            # disable browser extensions by default for clean gaming experience
            $null = $PSBoundParameters.Add('NoBrowserExtensions', $true);
        }
        else {

            # remove browserextensions parameter if present
            $null = $PSBoundParameters.Remove('BrowserExtensions')
        }

        # remove spectateonly parameter from bound parameters
        if ($PSBoundParameters.ContainsKey('SpectateOnly')) {

            $null = $PSBoundParameters.Remove('SpectateOnly')
        }

        # construct the yab game url based on spectate mode
        $url = ("https://yab.genxdev.net/#/single/$($SpectateOnly ? ' +
            "spectate': 'marathon')/")

        # add url to bound parameters if not already present
        if (-not $PSBoundParameters.ContainsKey('Url')) {

            $null = $PSBoundParameters.Add('Url', $url)
        }

        # Copy identical parameters between functions
        $params = GenXdev.Helpers\Copy-IdenticalParamValues `
            -FunctionName 'GenXdev.Webbrowser\Open-Webbrowser' `
            -BoundParameters $PSBoundParameters `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable -Scope Local -ErrorAction SilentlyContinue)

        # set the constructed url in invocation arguments
        $params.'Url' = $url

        # output verbose information about the game url
        Microsoft.PowerShell.Utility\Write-Verbose "Game URL: $url"

        # handle return url only scenario
        if ($ReturnOnlyURL) {

            # return the url without opening browser
            Microsoft.PowerShell.Utility\Write-Output $url
            return
        }
    }

    process {

        # launch browser with the yab game
        GenXdev.Webbrowser\Open-Webbrowser @params

        # return url if requested
        if ($ReturnURL) {

            # output the game url
            Microsoft.PowerShell.Utility\Write-Output $url
        }
    }

    end {
    }
}
###############################################################################