<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Open-WaybackMachineSiteInfo.ps1
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
Opens WaybackMachine site information in a web browser.

.DESCRIPTION
Opens a Waybackmachine query in a web browser, displaying historical versions
of the specified URL or website. Supports multiple queries and monitor
selection. Provides access to archived web content through the Internet
Archive's Wayback Machine service.

.PARAMETER Queries
The URL or website addresses to search in the Wayback Machine. Can be a single
URL or multiple URLs to search for archived versions.

.PARAMETER Language
The language preference for the browser interface. This affects the browser's
accept-language header and helps display content in the preferred language.

.PARAMETER Private
Opens the browser in incognito or private browsing mode to prevent storing
browsing history and cookies.

.PARAMETER Force
Force enables debugging port, stopping existing browsers if needed for
automation purposes.

.PARAMETER Edge
Opens the Wayback Machine query specifically in Microsoft Edge browser.

.PARAMETER Chrome
Opens the Wayback Machine query specifically in Google Chrome browser.

.PARAMETER Chromium
Opens the Wayback Machine query in Microsoft Edge or Google Chrome, depending
on what the default browser is set to.

.PARAMETER Firefox
Opens the Wayback Machine query specifically in Mozilla Firefox browser.

.PARAMETER All
Opens the Wayback Machine query in all registered modern browsers
simultaneously.

.PARAMETER Monitor
The monitor to display the browser on. 0 = default monitor, -1 = discard
window positioning, -2 = configured secondary monitor. Default is -1.

.PARAMETER FullScreen
Opens the browser in fullscreen mode for an immersive viewing experience.

.PARAMETER Width
The initial width of the browser window in pixels.

.PARAMETER Height
The initial height of the browser window in pixels.

.PARAMETER X
The initial X position of the browser window on the screen.

.PARAMETER Y
The initial Y position of the browser window on the screen.

.PARAMETER Left
Places the browser window on the left side of the screen.

.PARAMETER Right
Places the browser window on the right side of the screen.

.PARAMETER Top
Places the browser window on the top side of the screen.

.PARAMETER Bottom
Places the browser window on the bottom side of the screen.

.PARAMETER Centered
Places the browser window in the center of the screen.

.PARAMETER ApplicationMode
Hides the browser controls for a distraction-free viewing experience.

.PARAMETER NoBrowserExtensions
Prevents loading of browser extensions during the session.

.PARAMETER DisablePopupBlocker
Disables the browser's popup blocking functionality.

.PARAMETER AcceptLang
Sets the browser's accept-language HTTP header for internationalization.

.PARAMETER KeysToSend
Keystrokes to send to the browser window after opening. Uses the same format
as the GenXdev.Windows\Send-Key cmdlet.

.PARAMETER SendKeyEscape
Escapes control characters when sending keystrokes to the browser.

.PARAMETER SendKeyHoldKeyboardFocus
Prevents returning keyboard focus to PowerShell after sending keystrokes.

.PARAMETER SendKeyUseShiftEnter
Uses Shift+Enter instead of regular Enter for line breaks when sending keys.

.PARAMETER SendKeyDelayMilliSeconds
Delay between sending different key sequences in milliseconds.

.PARAMETER FocusWindow
Focuses the browser window after opening.

.PARAMETER SetForeground
Sets the browser window to foreground after opening.

.PARAMETER Maximize
Maximizes the window after positioning.

.PARAMETER RestoreFocus
Restores PowerShell window focus after opening the browser.

.PARAMETER NewWindow
Creates a new browser window instead of reusing existing windows.

.PARAMETER NoBorders
Removes the borders of the browser window.

.PARAMETER SessionOnly
Use alternative settings stored in session for Wayback Machine preferences.

.PARAMETER ClearSession
Clear alternative settings stored in session for Wayback Machine preferences.

.PARAMETER SkipSession
Store settings only in persistent preferences without affecting session.

.PARAMETER PassThru
Returns a System.Diagnostics.Process object of the browser process.

.PARAMETER ReturnURL
Returns the URL without opening the browser.

.PARAMETER ReturnOnlyURL
Returns the URL after opening the browser.

.EXAMPLE
Open-WaybackMachineSiteInfo -Queries "www.example.com" -Monitor 0

Opens the Wayback Machine archive for example.com on the default monitor.

.EXAMPLE
wayback example.com -mon -1

Opens the Wayback Machine archive for example.com using aliases with monitor
positioning discarded.

.EXAMPLE
Open-WaybackMachineSiteInfo -Queries "microsoft.com" -Chrome -Private

Opens the Wayback Machine archive for microsoft.com in Chrome's incognito mode.
#>
function Open-WaybackMachineSiteInfo {

    [CmdletBinding()]
    [Alias('wayback')]
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
            HelpMessage = ('The language preference for the browser interface ' +
                'and content')
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
        [string] $AcceptLang,
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
            Mandatory = $false,
            HelpMessage = ('Returns a [System.Diagnostics.Process] object ' +
                'of the browserprocess')
        )]
        [Alias('pt')]
        [switch] $PassThru,
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
            HelpMessage = ('Use alternative settings stored in session for ' +
                'Wayback Machine preferences')
        )]
        [switch] $SessionOnly,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Clear alternative settings stored in session for ' +
                'Wayback Machine preferences')
        )]
        [switch] $ClearSession,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Store settings only in persistent preferences ' +
                'without affecting session')
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession,
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
            HelpMessage = 'Position browser window either fullscreen on different monitor than PowerShell, or side by side with PowerShell on the same monitor.'
        )]
        [Alias('sbs')]
        [switch] $SideBySide
        ########################################################################
    )

    begin {

        # copy identical parameter values from this function to open-webbrowser
        $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Webbrowser' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        # process language setting if provided
        if (-not [string]::IsNullOrWhiteSpace($Language)) {

            # get language code from the language dictionary
            $code = (GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]

            # set accept-lang header if not already specified by user
            if (-not $PSBoundParameters.ContainsKey('AcceptLang')) {

                $null = $invocationArguments.AcceptLang = $code
            }
        }
    }

    process {

        # process each search query provided
        foreach ($query in $Queries) {

            # output verbose information about the query being processed
            Microsoft.PowerShell.Utility\Write-Verbose "Processing query: $query"

            # construct the wayback machine url for the query
            $invocationArguments.'Url' = ('https://web.archive.org/web/*/' +
                "$([Uri]::EscapeUriString($query))")

            # handle return url only scenario without opening browser
            if ($ReturnOnlyURL) {

                Microsoft.PowerShell.Utility\Write-Output (
                    $invocationArguments.Url
                )
                continue
            }

            # launch browser with the constructed url
            GenXdev.Webbrowser\Open-Webbrowser @invocationArguments

            # return url if requested by user
            if ($ReturnURL) {

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