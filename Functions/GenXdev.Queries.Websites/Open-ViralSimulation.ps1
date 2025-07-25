﻿###############################################################################
<#
.SYNOPSIS
Opens a viral simulation game in a web browser with extensive configuration
options.

.DESCRIPTION
Opens the viral simulation game at https://viral.genxdev.net/ in a specified
web browser with configurable window settings, positioning, and behavior
options. Supports multiple browsers, private browsing, application mode, and
comprehensive window management features.

The function provides an interactive viral simulation experience with features
like:
- Multiple browser support (Edge, Chrome, Firefox)
- Window positioning and sizing controls
- Full-screen and application mode options
- Private browsing capabilities
- Keyboard automation support
- Multi-monitor support

.PARAMETER Language
The language for the web content display and browser language settings.

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
Keystrokes to send to the Browser window, see documentation for cmdlet
GenXdev.Windows\Send-Key.

.PARAMETER SendKeyEscape
Escape control characters when sending keys.

.PARAMETER SendKeyHoldKeyboardFocus
Prevent returning keyboard focus to PowerShell after sending keys.

.PARAMETER SendKeyUseShiftEnter
Send Shift+Enter instead of regular Enter for line breaks.

.PARAMETER SendKeyDelayMilliSeconds
Delay between sending different key sequences in milliseconds.

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
Returns a [System.Diagnostics.Process] object of the browserprocess.

.PARAMETER ReturnURL
Don't open webbrowser, just return the url.

.PARAMETER ReturnOnlyURL
After opening webbrowser, return the url.

.PARAMETER NoFullScreen
Don't open in fullscreen mode.

.PARAMETER NoApplicationMode
Do show the browser controls.

.PARAMETER NoBorders
Removes the borders of the browser window.

.PARAMETER SideBySide
Position browser window either fullscreen on different monitor than PowerShell, or side by side with PowerShell on the same monitor.

.PARAMETER SessionOnly
Use alternative settings stored in session for AI preferences.

.PARAMETER ClearSession
Clear alternative settings stored in session for AI preferences.

.PARAMETER SkipSession
Store settings only in persistent preferences without affecting session.

.EXAMPLE
Open-ViralSimulation -Chrome -Private -NoFullScreen

Opens viral simulation in Google Chrome with private browsing mode and no
fullscreen.

.EXAMPLE
viral -ch -incognito -nfs

Opens viral simulation using aliases with Chrome, incognito mode, and no
fullscreen.
#>
function Open-ViralSimulation {

    [CmdletBinding()]
    [Alias('viral')]

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
        [Parameter(
            Mandatory = $false,
            Position = 0,
            HelpMessage = 'The language for the web content display and browser language settings'
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
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Microsoft Edge'
        )]
        [Alias('e')]
        [switch] $Edge,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Google Chrome'
        )]
        [Alias('ch')]
        [switch] $Chrome,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Opens in Microsoft Edge or Google Chrome, ' +
                'depending on what the default browser is')
        )]
        [Alias('c')]
        [switch] $Chromium,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Firefox'
        )]
        [Alias('ff')]
        [switch] $Firefox,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in all registered modern browsers'
        )]
        [switch] $All,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('The monitor to use, 0 = default, -1 is discard, ' +
                '-2 = Configured secondary monitor, defaults to ' +
                "`$Global:DefaultSecondaryMonitor or 2 if not found")
        )]
        [Alias('m', 'mon')]
        [int] $Monitor = -2,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in fullscreen mode'
        )]
        [Alias('fs', 'f')]
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
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Hide the browser controls'
        )]
        [Alias('a', 'app', 'appmode')]
        [switch] $ApplicationMode,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Prevent loading of browser extensions'
        )]
        [Alias('de', 'ne', 'NoExtensions')]
        [switch] $NoBrowserExtensions,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Disable the popup blocker'
        )]
        [Alias('allowpopups')]
        [switch] $DisablePopupBlocker,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser accept-lang http header'
        )]
        [Alias('lang', 'locale')]
        [string] $AcceptLang = $null,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Keystrokes to send to the Browser window, ' +
                'see documentation for cmdlet GenXdev.Windows\Send-Key')
        )]
        [string[]] $KeysToSend,
        ###############################################################################
        [Alias('Escape')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Escape control characters when sending keys'
        )]
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
        [Alias('rf', 'bg')]
        [switch] $RestoreFocus,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Don't re-use existing browser window, instead, " +
                'create a new one')
        )]
        [Alias('nw', 'new')]
        [switch] $NewWindow,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Returns a PowerShell object of ' +
                'the browserprocess')
        )]
        [Alias('pt')]
        [switch]$PassThru,

        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't open webbrowser, just return the url"
        )]
        [switch] $ReturnURL,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'After opening webbrowser, return the url'
        )]
        [switch] $ReturnOnlyURL,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't open in fullscreen mode"
        )]
        [Alias('nfs', 'nf')]
        [switch] $NoFullScreen,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Do show the browser controls'
        )]
        [Alias('na', 'napp', 'noappmode')]
        [switch] $NoApplicationMode,
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

        # determine language code based on language parameter
        $code = 'www'
        if (-not [string]::IsNullOrWhiteSpace($Language)) {

            # retrieve language code from language dictionary
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

        # set the viral simulation website url
        $invocationArguments.'Url' = 'https://viral.genxdev.net/'

        # handle return url only scenario without opening browser
        if ($ReturnOnlyURL) {

            Microsoft.PowerShell.Utility\Write-Output ($invocationArguments.Url)
            return
        }

        # configure application mode based on user preference
        if (-not $PSBoundParameters.ContainsKey('ApplicationMode')) {

            $invocationArguments.'ApplicationMode' = -not $NoApplicationMode
        }

        # ensure new window is created for the viral simulation
        if (-not $PSBoundParameters.ContainsKey('NewWindow')) {

            $invocationArguments.'NewWindow' = $true
        }

        # configure fullscreen mode based on user preference
        if (-not $PSBoundParameters.ContainsKey('FullScreen')) {

            $invocationArguments.'FullScreen' = -not $NoFullScreen
        }

        # remove internal parameter that shouldn't be passed to open-webbrowser
        if ($PSBoundParameters.ContainsKey('NoFullScreen')) {

            $null = $PSBoundParameters.Remove('NoFullScreen') |
                Microsoft.PowerShell.Core\Out-Null
        }

        # remove duplicate parameter removal check
        if ($PSBoundParameters.ContainsKey('NoFullScreen')) {

            $null = $PSBoundParameters.Remove('NoFullScreen') |
                Microsoft.PowerShell.Core\Out-Null
        }
    }

    process {

        # handle return url only scenario without opening browser
        if ($ReturnOnlyURL) {

            Microsoft.PowerShell.Utility\Write-Output ($invocationArguments.Url)
            return
        }

        # output verbose information about launching the viral simulation
        Microsoft.PowerShell.Utility\Write-Verbose (
            "Opening viral simulation at: $($invocationArguments.Url)"
        )

        # launch the viral simulation in the browser
        GenXdev.Webbrowser\Open-Webbrowser @invocationArguments

        # return url if requested by user
        if ($ReturnURL) {

            Microsoft.PowerShell.Utility\Write-Output ($invocationArguments.Url)
        }
    }

    end {

    }
}
###############################################################################