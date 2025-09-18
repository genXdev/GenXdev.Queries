<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Open-InstantStreetViewQuery.ps1
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
################################################################################
<#
.SYNOPSIS
Opens InstantStreetView queries in a web browser.

.DESCRIPTION
Opens InstantStreetView queries in a configurable manner using web browser
command line switches. Supports multiple queries and monitor selection.
Provides comprehensive browser control including window positioning, language
settings, and browser-specific features.

The function automatically constructs InstantStreetView URLs by URL-encoding
location queries and opening them in the specified browser. Supports all
major browsers including Edge, Chrome, and Firefox with extensive
customization options.

.PARAMETER Queries
The location queries to view in InstantStreetView. Accepts multiple queries
and supports pipeline input.

.PARAMETER Language
The language of the returned search results. Automatically sets the
Accept-Language HTTP header if not explicitly specified.

.PARAMETER Private
Opens in incognito/private browsing mode. Uses InPrivate for Edge and
incognito for Chrome.

.PARAMETER Force
Force enable debugging port, stopping existing browsers if needed.

.PARAMETER Edge
Opens in Microsoft Edge browser.

.PARAMETER Chrome
Opens in Google Chrome browser.

.PARAMETER Chromium
Opens in Microsoft Edge or Google Chrome, depending on what the default
browser is.

.PARAMETER Firefox
Opens in Firefox browser.

.PARAMETER All
Opens in all registered modern browsers.

.PARAMETER Monitor
The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
monitor, defaults to -1, no positioning.

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

.EXAMPLE
Open-InstantStreetViewQuery -Queries "Times Square, New York" -Monitor 0

Opens InstantStreetView for Times Square in the default browser on the
primary monitor.

.EXAMPLE
isv "Eiffel Tower, Paris" -mon -2

Opens InstantStreetView for the Eiffel Tower using the alias 'isv' and
displays on the secondary monitor.

.EXAMPLE
Open-InstantStreetViewQuery -Queries "Big Ben, London" -Language "English" -Private

Opens InstantStreetView for Big Ben in English language using private
browsing mode.

.EXAMPLE
"Central Park, New York", "Golden Gate Bridge, San Francisco" | isv -Chrome -Left

Opens multiple InstantStreetView queries via pipeline in Chrome browser
positioned on the left side of the screen.
#>
################################################################################
function Open-InstantStreetViewQuery {

    [CmdletBinding()]
    [Alias('isv')]
    param(
        #######################################################################
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The location queries to view in InstantStreetView'
        )]
        [Alias('q', 'Name', 'Text', 'Query')]
        [string[]] $Queries,

        #######################################################################
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
            'Zulu'
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
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Microsoft Edge'
        )]
        [Alias('e')]
        [switch] $Edge,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Google Chrome'
        )]
        [Alias('ch')]
        [switch] $Chrome,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Opens in Microsoft Edge or Google Chrome, ' +
                'depending on what the default browser is')
        )]
        [Alias('c')]
        [switch] $Chromium,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in Firefox'
        )]
        [Alias('ff')]
        [switch] $Firefox,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in all registered modern browsers'
        )]
        [switch] $All,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('The monitor to use, 0 = default, -1 is discard, ' +
                '-2 = Configured secondary monitor, defaults to ' +
                "`$Global:DefaultSecondaryMonitor or 2 if not found")
        )]
        [Alias('m', 'mon')]
        [int] $Monitor = -1,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in fullscreen mode'
        )]
        [Alias('fs', 'f')]
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
            HelpMessage = 'Place browser window on the right side of the screen'
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
            HelpMessage = 'Place browser window on the bottom side of the screen'
        )]
        [switch] $Bottom,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Place browser window in the center of the screen'
        )]
        [switch] $Centered,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Hide the browser controls'
        )]
        [Alias('a', 'app', 'appmode')]
        [switch] $ApplicationMode,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Prevent loading of browser extensions'
        )]
        [Alias('de', 'ne', 'NoExtensions')]
        [switch] $NoBrowserExtensions,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Disable the popup blocker'
        )]
        [Alias('allowpopups')]
        [switch] $DisablePopupBlocker,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser accept-lang http header'
        )]
        [Alias('lang', 'locale')]
        [string] $AcceptLang,

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
        [Alias('fw', 'focus')]
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
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Don't re-use existing browser window, instead, " +
                'create a new one')
        )]
        [Alias('nw', 'new')]
        [switch] $NewWindow,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Returns a PowerShell object of ' +
                'the browserprocess')
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
            HelpMessage = 'Open browser windows side by side'
        )]
        [Alias('sbs')]
        [switch] $SideBySide,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Use alternative settings stored in session for AI preferences'
        )]
        [switch] $SessionOnly,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Clear alternative settings stored in session for AI preferences'
        )]
        [switch] $ClearSession,

        #######################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Store settings only in persistent preferences without affecting session'
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession
        #######################################################################
    )

    begin {

        # copy identical parameters between functions for open-webbrowser call
        $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Webbrowser\Open-Webbrowser' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local -ErrorAction SilentlyContinue)

        # set accept-language header based on language parameter
        if (-not [string]::IsNullOrWhiteSpace($Language)) {

            # get language code from the language dictionary
            $code = (GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]

            # set accept-language header if not already specified
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

            # url-encode the query for safe url construction
            $encodedQuery = [System.Web.HttpUtility]::UrlEncode($query)

            # construct the instantstreetview url with the encoded query
            $url = "https://www.instantstreetview.com/s/$encodedQuery"

            # store the url in the invocation arguments
            $invocationArguments.'Url' = $url

            # handle return url only scenario without opening browser
            if ($ReturnOnlyURL) {

                # output the url and continue to next query
                Microsoft.PowerShell.Utility\Write-Output ($invocationArguments.Url)
                continue
            }

            # launch browser with the instantstreetview url
            GenXdev.Webbrowser\Open-Webbrowser @invocationArguments

            # return url if requested after opening browser
            if ($ReturnURL) {

                Microsoft.PowerShell.Utility\Write-Output ($invocationArguments.Url)
            }
        }
    }

    end {
    }
}
################################################################################