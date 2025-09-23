<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Open-IMDBQuery.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.284.2025
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
Opens an IMDB search query in a web browser.

.DESCRIPTION
Opens a "Internet Movie Database" query in a web browser with extensive
configuration options. This function provides a convenient wrapper around
the IMDB search functionality, allowing users to search for movies, TV shows,
actors, and other entertainment content directly from PowerShell.

The function accepts search terms and constructs proper IMDB search URLs,
then opens them in the specified web browser with customizable window
positioning, browser selection, and display options. It supports all major
browsers including Edge, Chrome, and Firefox, with options for private
browsing, fullscreen mode, and window management.

Key features include multi-monitor support, language localization, keyboard
automation, and comprehensive browser configuration options. The function
can handle multiple search queries simultaneously and provides options for
both interactive use and automated workflows.

.PARAMETER Queries
The search terms to query on IMDB. Can be movie titles, actor names, TV show
names, or any other entertainment-related search terms. Accepts multiple
queries and pipeline input for batch processing.

.PARAMETER Language
The language of the returned search results. When specified, sets the browser's
Accept-Language header to display IMDB results in the selected language.
Supports a wide range of languages including major world languages and some
novelty options.

.PARAMETER Monitor
The monitor to display the browser on. 0 = default, -1 is discard,
-2 = Configured secondary monitor. Supports multi-monitor setups for
optimal viewing experience.

.PARAMETER Width
The initial width of the webbrowser window in pixels. When not specified,
uses the monitor's working area width or appropriate sizing based on
positioning options.

.PARAMETER Height
The initial height of the webbrowser window in pixels. When not specified,
uses the monitor's working area height or appropriate sizing based on
positioning options.

.PARAMETER X
The initial X position of the webbrowser window. When not specified, uses
the monitor's left edge. Can be specified relative to the selected monitor.

.PARAMETER Y
The initial Y position of the webbrowser window. When not specified, uses
the monitor's top edge. Can be specified relative to the selected monitor.

.PARAMETER AcceptLang
Set the browser accept-lang http header for internationalization. Overrides
the Language parameter when both are specified. Useful for testing IMDB
in different languages.

.PARAMETER KeysToSend
Keystrokes to send to the Browser window after opening. Uses the same format
as the GenXdev.Windows\Send-Key cmdlet. Useful for automating browser
interactions after opening IMDB search results.

.PARAMETER Private
Opens in incognito/private browsing mode. Useful for searching without
affecting browser history or cookies.

.PARAMETER Force
Force enable debugging port, stopping existing browsers if needed. Required
for certain browser automation scenarios.

.PARAMETER Edge
Opens in Microsoft Edge browser specifically.

.PARAMETER Chrome
Opens in Google Chrome browser specifically.

.PARAMETER Chromium
Opens in Microsoft Edge or Google Chrome, depending on what the default
browser is configured to be.

.PARAMETER Firefox
Opens in Firefox browser specifically.

.PARAMETER All
Opens in all registered modern browsers simultaneously.

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

.PARAMETER FullScreen
Opens in fullscreen mode for immersive IMDB browsing experience.

.PARAMETER ApplicationMode
Hide the browser controls for a distraction-free IMDB experience.

.PARAMETER NoBrowserExtensions
Prevent loading of browser extensions for cleaner IMDB browsing.

.PARAMETER DisablePopupBlocker
Disables the browser's popup blocking functionality.

.PARAMETER FocusWindow
Focus the browser window after opening the IMDB search.

.PARAMETER SetForeground
Set the browser window to foreground after opening.

.PARAMETER Maximize
Maximize the window after positioning for optimal viewing.

.PARAMETER RestoreFocus
Restore PowerShell window focus after opening the browser.

.PARAMETER NewWindow
Don't re-use existing browser window, instead, create a new one for each
IMDB search.

.PARAMETER PassThru
Returns a [System.Diagnostics.Process] object of the browserprocess for
further automation or monitoring.

.PARAMETER ReturnURL
Don't open webbrowser, just return the constructed IMDB search URL.

.PARAMETER ReturnOnlyURL
After opening webbrowser, return the constructed IMDB search URL.

.PARAMETER SendKeyEscape
Escapes control characters when sending keystrokes to the browser.

.PARAMETER SendKeyHoldKeyboardFocus
Prevents returning keyboard focus to PowerShell after sending keystrokes.

.PARAMETER SendKeyUseShiftEnter
Uses Shift+Enter instead of regular Enter for line breaks when sending keys.

.PARAMETER SendKeyDelayMilliSeconds
Delay between sending different key sequences in milliseconds.

.EXAMPLE
Open-IMDBQuery -Queries "The Matrix" -Monitor 0

Opens an IMDB search for "The Matrix" on the default monitor.

.EXAMPLE
imdb "The Matrix" -m 0

Opens an IMDB search for "The Matrix" using the alias and shorthand parameters.

.EXAMPLE
"Inception", "Interstellar" | Open-IMDBQuery -Language "French" -Chrome

Searches for multiple movies on IMDB with French language results in Chrome.

.EXAMPLE
Open-IMDBQuery -Queries "Tom Hanks" -FullScreen -RestoreFocus

Searches for Tom Hanks on IMDB in fullscreen mode, then returns focus to
PowerShell.
#>
function Open-IMDBQuery {

    [CmdletBinding()]
    [Alias('imdb')]
    param(
        ###############################################################################
        [Alias('q', 'Name', 'Text', 'Query')]
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'The search terms to query on IMDB'
        )]
        [string[]] $Queries,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'The language of the returned search results'
        )]
        [ValidateSet(
            'Afrikaans', 'Akan', 'Albanian', 'Amharic', 'Arabic', 'Armenian',
            'Azerbaijani', 'Basque', 'Belarusian', 'Bemba', 'Bengali', 'Bihari',
            'Bork, bork, bork!', 'Bosnian', 'Breton', 'Bulgarian', 'Cambodian',
            'Catalan', 'Cherokee', 'Chichewa', 'Chinese (Simplified)',
            'Chinese (Traditional)', 'Corsican', 'Croatian', 'Czech', 'Danish',
            'Dutch', 'Elmer Fudd', 'English', 'Esperanto', 'Estonian', 'Ewe',
            'Faroese', 'Filipino', 'Finnish', 'French', 'Frisian', 'Ga',
            'Galician', 'Georgian', 'German', 'Greek', 'Guarani', 'Gujarati',
            'Hacker', 'Haitian Creole', 'Hausa', 'Hawaiian', 'Hebrew', 'Hindi',
            'Hungarian', 'Icelandic', 'Igbo', 'Indonesian', 'Interlingua',
            'Irish', 'Italian', 'Japanese', 'Javanese', 'Kannada', 'Kazakh',
            'Kinyarwanda', 'Kirundi', 'Klingon', 'Kongo', 'Korean',
            'Krio (Sierra Leone)', 'Kurdish', 'Kurdish (Soranî)', 'Kyrgyz',
            'Laothian', 'Latin', 'Latvian', 'Lingala', 'Lithuanian', 'Lozi',
            'Luganda', 'Luo', 'Macedonian', 'Malagasy', 'Malay', 'Malayalam',
            'Maltese', 'Maori', 'Marathi', 'Mauritian Creole', 'Moldavian',
            'Mongolian', 'Montenegrin', 'Nepali', 'Nigerian Pidgin',
            'Northern Sotho', 'Norwegian', 'Norwegian (Nynorsk)', 'Occitan',
            'Oriya', 'Oromo', 'Pashto', 'Persian', 'Pirate', 'Polish',
            'Portuguese (Brazil)', 'Portuguese (Portugal)', 'Punjabi', 'Quechua',
            'Romanian', 'Romansh', 'Runyakitara', 'Russian', 'Scots Gaelic',
            'Serbian', 'Serbo-Croatian', 'Sesotho', 'Setswana',
            'Seychellois Creole', 'Shona', 'Sindhi', 'Sinhalese', 'Slovak',
            'Slovenian', 'Somali', 'Spanish', 'Spanish (Latin American)',
            'Sundanese', 'Swahili', 'Swedish', 'Tajik', 'Tamil', 'Tatar',
            'Telugu', 'Thai', 'Tigrinya', 'Tonga', 'Tshiluba', 'Tumbuka',
            'Turkish', 'Turkmen', 'Twi', 'Uighur', 'Ukrainian', 'Urdu',
            'Uzbek', 'Vietnamese', 'Welsh', 'Wolof', 'Xhosa', 'Yiddish',
            'Yoruba', 'Zulu'
        )]
        [string] $Language,
        ###############################################################################
        [Alias('m', 'mon')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('The monitor to use, 0 = default, -1 is discard, ' +
                '-2 = Configured secondary monitor, defaults to -1')
        )]
        [int] $Monitor = -1,
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
        [Alias('fs', 'f')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in fullscreen mode'
        )]
        [switch] $FullScreen,
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
            HelpMessage = "Disables the browser's popup blocking functionality"
        )]
        [Alias('allowpopups')]
        [switch] $DisablePopupBlocker,
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
            HelpMessage = ('Returns a [System.Diagnostics.Process] object ' +
                'of the browserprocess')
        )]
        [Alias('pt')]
        [switch] $PassThru,
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
            HelpMessage = 'Escapes control characters when sending keystrokes to the browser'
        )]
        [Alias('Escape')]
        [switch] $SendKeyEscape,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Prevents returning keyboard focus to PowerShell ' +
                'after sending keystrokes')
        )]
        [Alias('HoldKeyboardFocus')]
        [switch] $SendKeyHoldKeyboardFocus,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Uses Shift+Enter instead of regular Enter for ' +
                'line breaks when sending keys')
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
            Mandatory = $false,
            HelpMessage = 'Removes the borders of the window'
        )]
        [Alias('nb')]
        [switch] $NoBorders,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Use alternative settings stored in session for AI ' +
                'preferences')
        )]
        [switch] $SessionOnly,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Clear alternative settings stored in session for AI ' +
                'preferences')
        )]
        [switch] $ClearSession,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Store settings only in persistent preferences without ' +
                'affecting session')
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Open browser windows side by side'
        )]
        [Alias('sbs')]
        [switch] $SideBySide
    )

    begin {

        # copy all identical parameters to open-webbrowser
        $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Webbrowser\Open-Webbrowser' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        # if a language is specified, map it to acceptlang if not already set
        if (-not [string]::IsNullOrWhiteSpace($Language)) {

            # retrieve the language code from the language dictionary
            $code = (GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]

            # set accept-lang header if not already specified
            if (-not $PSBoundParameters.ContainsKey('AcceptLang')) {

                $null = $invocationArguments.AcceptLang = $code
            }
        }
    }

    process {

        # process each search query
        foreach ($query in $Queries) {

            # show which query is being processed
            Microsoft.PowerShell.Utility\Write-Verbose "Processing query: $query"

            # build the imdb search url for the query
            $invocationArguments.'Url' = ('https://www.imdb.com/find?q=' +
                [Uri]::EscapeUriString($query) + '&ref_=nv_sr_sm=')

            # if only the url should be returned, output it and continue
            if ($ReturnOnlyURL) {

                Microsoft.PowerShell.Utility\Write-Output `
                ($invocationArguments.Url)

                continue
            }

            # open the browser with the constructed parameters
            GenXdev.Webbrowser\Open-Webbrowser @invocationArguments

            # if returnurl is set, output the url after opening
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