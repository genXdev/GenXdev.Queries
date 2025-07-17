################################################################################
<#
.SYNOPSIS
Opens a Github repository search query in a web browser.

.DESCRIPTION
Opens a Github repository search query in a web browser with extensive
customization options. This function provides a powerful interface for quickly
accessing Github repositories from PowerShell with support for multiple
browsers, window positioning, language filtering, and keyboard automation.

Key features:
- Multiple search query support with pipeline input
- Language-specific filtering with automatic localization
- Multi-browser support (Edge, Chrome, Firefox)
- Advanced window positioning and monitor selection
- Private/incognito browsing mode
- Application mode for distraction-free browsing
- Keyboard automation and focus management
- URL return options for programmatic use

The function automatically constructs Github search URLs and passes all
browser-related parameters to the underlying Open-Webbrowser function for
consistent behavior across the GenXdev module ecosystem.

.PARAMETER Queries
The search queries to perform on Github repositories. Supports multiple
queries and pipeline input for batch searching. Each query will be
URL-encoded and used to search Github repositories.

.PARAMETER Language
Optional programming language filter for the search results. This will be
automatically converted to the appropriate accept-lang header if not
explicitly overridden. Supports a comprehensive list of language options.

.PARAMETER Private
Opens the browser in private/incognito browsing mode for anonymous searching.

.PARAMETER Force
Force enable debugging port, stopping existing browsers if needed.

.PARAMETER Edge
Opens the search results in Microsoft Edge browser.

.PARAMETER Chrome
Opens the search results in Google Chrome browser.

.PARAMETER Chromium
Opens the search results in Microsoft Edge or Google Chrome, depending on
what the default browser is.

.PARAMETER Firefox
Opens the search results in Mozilla Firefox browser.

.PARAMETER All
Opens the search results in all registered modern browsers.

.PARAMETER Monitor
The monitor to display results on. 0 = default, -1 = discard, -2 = secondary.

.PARAMETER FullScreen
Opens the browser in fullscreen mode.

.PARAMETER Width
The initial width of the browser window.

.PARAMETER Height
The initial height of the browser window.

.PARAMETER X
The initial X position of the browser window.

.PARAMETER Y
The initial Y position of the browser window.

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
Disable the popup blocker in the browser.

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
Maximize the window after positioning.

.PARAMETER RestoreFocus
Restore PowerShell window focus.

.PARAMETER NewWindow
Don't re-use existing browser window, instead, create a new one.

.PARAMETER PassThru
Returns a [System.Diagnostics.Process] object of the browserprocess.

.PARAMETER ReturnURL
Don't open webbrowser, just return the url.

.PARAMETER ReturnOnlyURL
After opening webbrowser, return the url.

.PARAMETER SendKeyEscape
Escape control characters when sending keys.

.PARAMETER SendKeyHoldKeyboardFocus
Prevent returning keyboard focus to PowerShell after sending keys.

.PARAMETER SendKeyUseShiftEnter
Send Shift+Enter instead of regular Enter for line breaks.

.PARAMETER SendKeyDelayMilliSeconds
Delay between sending different key sequences in milliseconds.

.PARAMETER NoBorders
Remove window borders and title bar for a cleaner appearance.

.PARAMETER SideBySide
Place browser window side by side with PowerShell on the same monitor.

.PARAMETER SessionOnly
Use alternative settings stored in session for preferences.

.PARAMETER ClearSession
Clear alternative settings stored in session for preferences.

.PARAMETER SkipSession
Store settings only in persistent preferences without affecting session.

.EXAMPLE
Open-GithubQuery -Queries "powershell module" -Language "PowerShell"

Opens a search for PowerShell modules in Github with language filtering.

.EXAMPLE
qgithub "azure functions" -Monitor 0

Opens a search for Azure Functions on the primary monitor using the alias.
#>
function Open-GithubQuery {

    [CmdletBinding()]
    [Alias('qgithub')]
    param(
        ########################################################################
        [Alias('q', 'Name', 'Text', 'Query')]
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The search queries to execute on Github repositories.'
        )]
        [string[]] $Queries,
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
            Position = 1,
            HelpMessage = ('The language of the returned search results for ' +
                'internationalization')
        )]
        [string] $Language,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in private/incognito browsing mode'
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
                '-2 = Configured secondary monitor, defaults to -1, ' +
                'no positioning')
        )]
        [int] $Monitor = -1,

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
            HelpMessage = 'Disable the popup blocker in the browser.'
        )]
        [Alias('allowpopups')]
        [switch] $DisablePopupBlocker,

        ########################################################################
        [Parameter(
            HelpMessage = 'Set the browser accept-lang http header'
        )]
        [Alias('lang', 'locale')]
        [string] $AcceptLang = $null,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Keystrokes to send to the Browser window, ' +
                'see documentation for cmdlet GenXdev.Windows\Send-Key')
        )]
        [string[]] $KeysToSend,

        ########################################################################
        [Parameter(
            HelpMessage = 'Focus the browser window after opening.'
        )]
        [Alias('fw', 'focus')]
        [switch] $FocusWindow,

        ########################################################################
        [Parameter(
            HelpMessage = 'Set the browser window to foreground after opening.'
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
            HelpMessage = 'Restore PowerShell window focus'
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
            HelpMessage = 'Returns a [System.Diagnostics.Process] object of the browserprocess.'
        )]
        [Alias('pt')]
        [switch] $PassThru,

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
        [Parameter(
            HelpMessage = 'Escape control characters when sending keys.'
        )]
        [Alias('Escape')]
        [switch] $SendKeyEscape,

        ########################################################################
        [Parameter(
            HelpMessage = 'Prevent returning keyboard focus to PowerShell after sending keys.'
        )]
        [Alias('HoldKeyboardFocus')]
        [switch] $SendKeyHoldKeyboardFocus,

        ########################################################################
        [Parameter(
            HelpMessage = 'Send Shift+Enter instead of regular Enter for line breaks.'
        )]
        [Alias('UseShiftEnter')]
        [switch] $SendKeyUseShiftEnter,

        ########################################################################
        [Parameter(
            HelpMessage = 'Delay between sending different key sequences in milliseconds.'
        )]
        [Alias('DelayMilliSeconds')]
        [int] $SendKeyDelayMilliSeconds,
        ########################################################################
        [Alias('nb')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Remove window borders and title bar for a cleaner appearance'
        )]
        [switch] $NoBorders,
        ########################################################################
        [Parameter(
            HelpMessage = ('Place browser window side by side with PowerShell ' +
                'on the same monitor')
        )]
        [Alias('sbs')]
        [switch] $SideBySide,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use alternative settings stored in session for preferences'
        )]
        [switch] $SessionOnly,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Clear alternative settings stored in session for preferences'
        )]
        [switch] $ClearSession,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Store settings only in persistent preferences without ' +
                'affecting session')
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession
        ########################################################################
    )

    begin {

        # copy identical parameter values from this function to open-webbrowser
        $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Webbrowser\Open-Webbrowser' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        # check if language parameter was provided for localization
        if (-not [string]::IsNullOrWhiteSpace($Language)) {

            # retrieve language code mapping for the specified language
            $code = (GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]

            # set accept-lang header if not explicitly overridden by user
            if (-not $PSBoundParameters.ContainsKey('AcceptLang')) {

                $null = $invocationArguments.AcceptLang = $code
            }
        }
    }

    process {

        # process each search query individually
        foreach ($query in $Queries) {

            # output verbose information about the current query being processed
            Microsoft.PowerShell.Utility\Write-Verbose `
                "Processing Github search query: $query"

            # construct github search url with query and language filter
            $invocationArguments.'Url' = ('https://github.com/search?q=' +
                "$([Uri]::EscapeUriString($query))$Language&type=repositories")

            # handle return url only scenario without opening browser
            if ($ReturnOnlyURL) {

                Microsoft.PowerShell.Utility\Write-Output `
                ($invocationArguments.Url)

                continue
            }

            # launch browser with configured parameters using splatting
            GenXdev.Webbrowser\Open-Webbrowser @invocationArguments

            # return url if requested after opening browser
            if ($ReturnURL) {

                Microsoft.PowerShell.Utility\Write-Output `
                ($invocationArguments.Url)
            }
        }
    }

    end {

    }
}
################################################################################