<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Open-SearchEngine.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.290.2025
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
Opens a search query in the specified search engine using a web browser.

.DESCRIPTION
This function provides a unified interface to search across multiple search
engines including Google, Bing, GitHub, Wikipedia, YouTube, and others. It
supports extensive browser configuration options including window positioning,
size, browser selection, and language preferences. The function dynamically
routes queries to the appropriate search engine specific functions.

.PARAMETER Queries
The search query or queries to execute. Supports multiple queries and accepts
pipeline input.

.PARAMETER EndPoint
The search engine to use for the query. Supports major search engines including
Google (default), Bing, GitHub, IMDB, StackOverflow, Wikipedia, YouTube, and
others.

.PARAMETER Language
The language for search results. Supports a comprehensive list of languages
from Afrikaans to Zulu, including regional variants and novelty languages.

.PARAMETER Private
Opens the browser in incognito or private browsing mode to prevent storing
search history and cookies.

.PARAMETER Force
Forces enabling of debugging port and stops existing browser instances if
needed for proper operation.

.PARAMETER Edge
Opens the search results in Microsoft Edge browser instead of the default
browser.

.PARAMETER Chrome
Opens the search results in Google Chrome browser instead of the default
browser.

.PARAMETER Chromium
Opens the search results in either Microsoft Edge or Google Chrome, depending
on which is set as the default browser.

.PARAMETER Firefox
Opens the search results in Mozilla Firefox browser instead of the default
browser.

.PARAMETER All
Opens the search results in all registered modern browsers simultaneously for
comparison or broader access.

.PARAMETER Monitor
Specifies which monitor to use for positioning the browser window. 0 for
default, -1 to discard positioning, -2 for configured secondary monitor.

.PARAMETER FullScreen
Opens the browser window in fullscreen mode, hiding all browser chrome and
window decorations.

.PARAMETER Width
Sets the initial width of the browser window in pixels. Use -1 for default
system sizing.

.PARAMETER Height
Sets the initial height of the browser window in pixels. Use -1 for default
system sizing.

.PARAMETER X
Sets the initial horizontal position of the browser window. Use -999999 for
default positioning.

.PARAMETER Y
Sets the initial vertical position of the browser window. Use -999999 for
default positioning.

.PARAMETER Left
Positions the browser window on the left side of the screen, automatically
calculating appropriate dimensions.

.PARAMETER Right
Positions the browser window on the right side of the screen, automatically
calculating appropriate dimensions.

.PARAMETER Top
Positions the browser window on the top portion of the screen, automatically
calculating appropriate dimensions.

.PARAMETER Bottom
Positions the browser window on the bottom portion of the screen, automatically
calculating appropriate dimensions.

.PARAMETER Centered
Centers the browser window on the screen, useful for focused viewing or
presentation scenarios.

.PARAMETER ApplicationMode
Hides browser controls and chrome to create an app-like experience with minimal
interface distractions.

.PARAMETER NoBrowserExtensions
Prevents loading of browser extensions to ensure clean execution without
third-party interference.

.PARAMETER AcceptLang
Sets the browser accept-language HTTP header to control content localization
and language preferences.

.PARAMETER KeysToSend
Specifies keystrokes to send to the browser window after opening. See
GenXdev.Windows\Send-Key documentation for supported key sequences.

.PARAMETER FocusWindow
Brings the browser window to focus after opening, ensuring it becomes the
active window.

.PARAMETER SetForeground
Sets the browser window as the foreground application, bringing it to the front
of all other windows.

.PARAMETER Maximize
Maximizes the browser window after positioning, overriding any size
constraints.

.PARAMETER RestoreFocus
Returns focus to the PowerShell window after opening the browser, allowing
continued command-line work.

.PARAMETER NewWindow
Creates a new browser window instead of reusing an existing window, useful for
maintaining separate browsing contexts.

.PARAMETER PassThru
Returns a System.Diagnostics.Process object representing the browser process
for further manipulation.

.PARAMETER ReturnURL
Returns the constructed search URL without opening the browser, useful for
programmatic URL generation.

.PARAMETER ReturnOnlyURL
Opens the browser and then returns the search URL, combining both actions for
specific workflows.

.EXAMPLE
Open-SearchEngine -Queries "PowerShell cmdlets" -EndPoint "Google" -Language "English"

Searches for "PowerShell cmdlets" on Google with English language results.

.EXAMPLE
q "GitHub PowerShell" Bing -Chrome -Private

Uses the alias 'q' to search for "GitHub PowerShell" on Bing using Chrome in
private mode.
#>
function Open-SearchEngine {

    [CmdletBinding()]
    [Alias('q')]
    param(
        ###############################################################################
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
        ###############################################################################
        [ValidateSet(
            'Bing',
            'Github',
            'Google',
            'IMDB',
            'InstantStreetView',
            'StackOverflow',
            'Wikipedia',
            'WikipediaNL',
            'WolframAlpha',
            'Youtube'
        )]
        [Parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'The enpoint to invoke the query on'
        )]
        [string] $EndPoint = 'Google',
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
            'Zulu'
        )]
        [Parameter(
            Mandatory = $false,
            Position = 2,
            HelpMessage = 'The language of the returned search results'
        )]
        [string] $Language,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            Position = 3,
            HelpMessage = 'The monitor to use, 0 = default, -1 is discard, ' +
                          '-2 = Configured secondary monitor, defaults to -1, ' +
                          'no positioning'
        )]
        [Alias('m', 'mon')]
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
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Opens in incognito/private browsing mode'
        )]
        [Alias('incognito', 'inprivate')]
        [switch] $Private,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Force enable debugging port, stopping existing ' +
                          'browsers if needed'
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
            HelpMessage = 'Opens in Microsoft Edge or Google Chrome, depending ' +
                          'on what the default browser is'
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
            HelpMessage = 'Opens in fullscreen mode'
        )]
        [Alias('fs', 'f')]
        [switch] $FullScreen,
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
            HelpMessage = 'Focus the browser window after opening'
        )]
        [switch] $FocusWindow,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser window to foreground after opening'
        )]
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
            HelpMessage = "Don't re-use existing browser window, instead, " +
                          "create a new one"
        )]
        [Alias('nw', 'new')]
        [switch] $NewWindow,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Returns a [System.Diagnostics.Process] object of ' +
                          'the browserprocess'
        )]
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
        [switch] $ReturnOnlyURL
        ###############################################################################
    )

    begin {

        # initialize default language code for google domain determination
        $code = 'www'

        # check if language parameter was provided and is not empty
        if (-not[string]::IsNullOrWhiteSpace($Language)) {

            Microsoft.PowerShell.Utility\Write-Verbose (
                "Language specified: ${Language}, determining language code"
            )

            # retrieve language code from the web language dictionary
            $code = (GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]

            # if accept language header is not already set, use the language code
            if ($null -eq $AcceptLang) {

                $AcceptLang = $code

                # add accept language to bound parameters if not already present
                if (-not $PSBoundParameters.ContainsKey('AcceptLang')) {

                    $null = $PSBoundParameters.Add('AcceptLang', $AcceptLang)
                }
            }
        }

        # store the endpoint value for command resolution
        $endpointValue = $EndPoint

        Microsoft.PowerShell.Utility\Write-Verbose (
            "Resolving command for endpoint: ${endpointValue}"
        )

        # get the command info for the specific endpoint query function
        $command = Microsoft.PowerShell.Core\Get-Command `
            -Name "Open-$($endpointValue)Query" `
            -ErrorAction SilentlyContinue

        # copy identical parameter values to pass to the endpoint function
        $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName "GenXdev.Queries\Open-$($endpointValue)Query" `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        Microsoft.PowerShell.Utility\Write-Verbose (
            "Prepared invocation arguments for ${endpointValue} query function"
        )
    }

    process {

        # invoke the endpoint-specific query function with prepared arguments
        & $command @invocationArguments
    }

    end {
    }
}
################################################################################