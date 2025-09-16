<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Open-WikipediaQuery.ps1
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
Opens a Wikipedia query in a webbrowser.

.DESCRIPTION
Opens one or more Wikipedia search queries in a web browser with extensive
configuration options. Supports configurable browser behavior, monitor
selection, and window positioning. Queries are URL encoded and opened using
the specified language's Wikipedia domain with full localization support.

The function provides comprehensive browser control including private browsing
modes, window positioning, keyboard automation, and multi-monitor support.
It automatically handles URL encoding and language code mapping for
international Wikipedia domains.

.PARAMETER Queries
One or more search terms to look up on Wikipedia. Multiple queries will open
in separate browser instances. Supports pipeline input for batch processing.

.PARAMETER Language
The Wikipedia language to use for searches. Accepts full language names from
the ValidateSet list. Automatically maps language names to Wikipedia language
codes and sets appropriate Accept-Language headers.

.PARAMETER Private
Opens in incognito/private browsing mode for anonymous searches.

.PARAMETER Force
Force enable debugging port, stopping existing browsers if needed.

.PARAMETER Edge
Opens in Microsoft Edge browser.

.PARAMETER Chrome
Opens in Google Chrome browser.

.PARAMETER Chromium
Opens in Microsoft Edge or Google Chrome, depending on default browser.

.PARAMETER Firefox
Opens in Mozilla Firefox browser.

.PARAMETER All
Opens in all registered modern browsers simultaneously.

.PARAMETER Monitor
The monitor to use for window placement. 0=default, -1=discard positioning,
-2=configured secondary monitor, positive numbers=specific monitor.

.PARAMETER FullScreen
Opens in fullscreen mode using F11 key simulation.

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
Hide the browser controls for distraction-free reading.

.PARAMETER NoBrowserExtensions
Prevent loading of browser extensions.

.PARAMETER DisablePopupBlocker
Disable the popup blocker.

.PARAMETER AcceptLang
Set the browser accept-lang http header for language preferences.

.PARAMETER KeysToSend
Keystrokes to send to the browser window after opening. Uses the same format
as GenXdev.Windows\Send-Key cmdlet.

.PARAMETER SendKeyEscape
Escape control characters when sending keystrokes to the browser.

.PARAMETER SendKeyHoldKeyboardFocus
Prevent returning keyboard focus to PowerShell after sending keystrokes.

.PARAMETER SendKeyUseShiftEnter
Send Shift+Enter instead of regular Enter for line breaks.

.PARAMETER SendKeyDelayMilliSeconds
Delay between sending different key sequences in milliseconds.

.PARAMETER FocusWindow
Focus the browser window after opening.

.PARAMETER SetForeground
Set the browser window to foreground after opening.

.PARAMETER Maximize
Maximize the window after positioning.

.PARAMETER RestoreFocus
Restore PowerShell window focus after opening browser.

.PARAMETER NewWindow
Don't re-use existing browser window, instead create a new one.

.PARAMETER PassThru
Returns a PowerShell process object representing the browser process.

.PARAMETER ReturnURL
Don't open webbrowser, just return the formatted Wikipedia URL.

.PARAMETER ReturnOnlyURL
After opening webbrowser, return the formatted Wikipedia URL.

.EXAMPLE
Open-WikipediaQuery -Queries "PowerShell" -Monitor 0 -Language "English"

Opens a Wikipedia search for "PowerShell" in English on the default monitor.

.EXAMPLE
wiki "PowerShell" -mon 0

Opens a Wikipedia search using the alias with positional parameters.

.EXAMPLE
"PowerShell", "Windows" | Open-WikipediaQuery -Language "German" -Private

Searches for multiple terms in German Wikipedia using private browsing mode.
#>
################################################################################
function Open-WikipediaQuery {

    [CmdletBinding()]
    [Alias('wiki')]

    param(
        ########################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The Wikipedia search query to execute'
        )]
        [Alias('q', 'Name', 'Text', 'Query')]
        [string[]] $Queries,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = ('The language of the Wikipedia search results')
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
            HelpMessage = ('The monitor to use, 0 = default, -1 is discard, ' +
                '-2 = Configured secondary monitor')
        )]
        [Alias('m', 'mon')]
        [int] $Monitor = -1,
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
            HelpMessage = 'Restore PowerShell window focus'
        )]
        [Alias('rf', 'bg')]
        [switch] $RestoreFocus,
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
            HelpMessage = ('Returns a PowerShell process object representing ' +
                'the browser process')
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
            Mandatory = $false,
            HelpMessage = 'Removes the borders of the browser window.'
        )]
        [Alias('nb')]
        [switch] $NoBorders,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Position browser window either fullscreen on different monitor than PowerShell, or side by side with PowerShell on the same monitor.'
        )]
        [Alias('sbs')]
        [switch] $SideBySide,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use alternative settings stored in session for AI preferences.'
        )]
        [switch] $SessionOnly,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Clear alternative settings stored in session for AI preferences.'
        )]
        [switch] $ClearSession,

        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Store settings only in persistent preferences without affecting session.'
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

            # retrieve the language code from the language dictionary
            $code = (GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]

            # set accept-lang header if not already specified by user
            if (-not $PSBoundParameters.ContainsKey('AcceptLang')) {

                # assign the language code to the accept-lang parameter
                $null = $invocationArguments.AcceptLang = $code
            }
        }

        # set default language code to english if no language specified
        if ([string]::IsNullOrWhiteSpace($code)) {

            $code = 'en'
        }
    }

    process {

        # process each search query provided by the user
        foreach ($query in $Queries) {

            # output verbose information about the query being processed
            Microsoft.PowerShell.Utility\Write-Verbose ('Processing query: ' +
                $query)

            # build the wikipedia search url with language code and query
            $invocationArguments.'Url' = ("https://$($code).wikipedia.org/" +
                'wiki/Special:Search?search=' +
                "$([Uri]::EscapeUriString($query))")

            # handle return url only scenario without opening browser
            if ($ReturnOnlyURL) {

                # output the formatted url and skip to next query
                Microsoft.PowerShell.Utility\Write-Output (
                    $invocationArguments.Url)

                continue
            }

            # launch browser with the wikipedia search url
            GenXdev.Webbrowser\Open-Webbrowser @invocationArguments

            # return url if specifically requested by user
            if ($ReturnURL) {

                # output the formatted url after opening browser
                Microsoft.PowerShell.Utility\Write-Output (
                    $invocationArguments.Url)
            }
        }
    }

    end {
    }
}
################################################################################