<##############################################################################
Part of PowerShell module : GenXdev.Queries.Websites
Original cmdlet filename  : Open-Timeline.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.280.2025
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
Opens an interactive timeline showing current time, date, century, and
millennium.

.DESCRIPTION
Opens a web-based interactive timeline that displays temporal information in an
artistic theme. Supports multiple languages and visual customization options.
The timeline provides an immersive experience with artistic backgrounds
inspired by famous artists and painters, with configurable themes and
multilingual support.

.PARAMETER Private
Opens in incognito/private browsing mode

.PARAMETER Force
Force enable debugging port, stopping existing browsers if needed

.PARAMETER Edge
Opens in Microsoft Edge

.PARAMETER Chrome
Opens in Google Chrome

.PARAMETER Chromium
Opens in Microsoft Edge or Google Chrome, depending on what the default
browser is

.PARAMETER Firefox
Opens in Firefox

.PARAMETER All
Opens in all registered modern browsers

.PARAMETER Monitor
The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
monitor, defaults to Global:DefaultSecondaryMonitor or 2 if not found

.PARAMETER NoFullScreen
Don't open in fullscreen mode

.PARAMETER Width
The initial width of the webbrowser window

.PARAMETER Height
The initial height of the webbrowser window

.PARAMETER X
The initial X position of the webbrowser window

.PARAMETER Y
The initial Y position of the webbrowser window

.PARAMETER Left
Place browser window on the left side of the screen

.PARAMETER Right
Place browser window on the right side of the screen

.PARAMETER Top
Place browser window on the top side of the screen

.PARAMETER Bottom
Place browser window on the bottom side of the screen

.PARAMETER Centered
Place browser window in the center of the screen

.PARAMETER NoApplicationMode
Do show the browser controls

.PARAMETER BrowserExtensions
Don't prevent loading of browser extensions

.PARAMETER AcceptLang
Set the browser accept-lang http header

.PARAMETER KeysToSend
Keystrokes to send to the Browser window, see documentation for cmdlet
GenXdev.Windows\Send-Key

.PARAMETER FocusWindow
Focus the browser window after opening

.PARAMETER SetForeground
Set the browser window to foreground after opening

.PARAMETER Maximize
Maximize the window after positioning

.PARAMETER RestoreFocus
Restore PowerShell window focus

.PARAMETER NewWindow
Don't re-use existing browser window, instead, create a new one

.PARAMETER PassThru
Returns a [System.Diagnostics.Process] object of the browserprocess

.PARAMETER SpectateOnly
Don't start a new game, just watch the AI play

.PARAMETER ReturnURL
Don't open webbrowser, just return the url

.PARAMETER ReturnOnlyURL
After opening webbrowser, return the url

.PARAMETER Theme
Selects All or limit the theme to a specific one, default = PicassoPulse

.PARAMETER Language
Override default browser language, or select [All] for rotation of all
languages every minute

.PARAMETER DragedNodeBackground
Overwrite the css-color-style for painting the currently dragged node's
background

.PARAMETER FocusedNodeBackground
Overwrite the css-color-style for painting the focused node's (In center)
background

.PARAMETER FocusedNodeForeground
Overwrite the css-color-style for painting the focused node's (in center)
foreground text

.PARAMETER UnFocusedNodeBackground
Overwrite the css-color-style for painting the focused node's (In center)
background

.PARAMETER UnFocusedNodeForeground
Overwrite the css-color-style for painting the unfocused node's (in center)
foreground text

.PARAMETER BorderLightColor
Overwrite the default css border-light-color colorstyle

.PARAMETER BorderDarkColor
Overwrite the default css border-dark-color colorstyle

.PARAMETER BorderWidth
Overwrite the default width for painting the node borders

.PARAMETER RotationDelaySeconds
Overwrite the default width for the background rotation delay

.PARAMETER FullScreen
Opens in fullscreen mode

.PARAMETER ApplicationMode
Hide the browser controls

.PARAMETER NoBrowserExtensions
Prevent loading of browser extensions

.PARAMETER DisablePopupBlocker
Disable the popup blocker

.PARAMETER SendKeyEscape
Escape control characters when sending keys

.PARAMETER SendKeyHoldKeyboardFocus
Prevent returning keyboard focus to PowerShell after sending keys

.PARAMETER SendKeyUseShiftEnter
Send Shift+Enter instead of regular Enter for line breaks

.PARAMETER SendKeyDelayMilliSeconds
Delay between sending different key sequences in milliseconds

.PARAMETER NoBorders
Removes the borders of the browser window

.PARAMETER SideBySide
Position browser window either fullscreen on different monitor than
PowerShell, or side by side with PowerShell on the same monitor

.PARAMETER SessionOnly
Use alternative settings stored in session for AI preferences

.PARAMETER ClearSession
Clear alternative settings stored in session for AI preferences

.PARAMETER SkipSession
Store settings only in persistent preferences without affecting session

.EXAMPLE
Open-Timeline -Theme "VanGoghSkies" -Language "English"

Opens an interactive timeline with Van Gogh-inspired visuals in English.

.EXAMPLE
timeline -Theme "MonetMoods" -mon 2

Opens timeline with Monet theme on monitor 2 using aliases.

.EXAMPLE
Open-Timeline -Private -Chrome -FullScreen

Opens timeline in Chrome incognito mode in fullscreen.

.EXAMPLE
timeline -Theme "[All]" -Language "[All]" -Monitor 1 -Centered

Opens timeline with rotating themes and languages, centered on monitor 1.
#>
function Open-Timeline {

    [CmdletBinding()]
    [Alias('timeline')]

    param(
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
            HelpMessage = 'Force enable debugging port, stopping existing browsers if needed'
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
            HelpMessage = 'Opens in Microsoft Edge or Google Chrome, depending on what the default browser is'
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
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to `Global:DefaultSecondaryMonitor or 2 if not found"
        )]
        [int] $Monitor = -2,
        ###############################################################################
        [Alias('nfs', 'nf')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't open in fullscreen mode"
        )]
        [switch] $NoFullScreen,
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
        [Alias('na', 'napp', 'noappmode')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Do show the browser controls'
        )]
        [switch] $NoApplicationMode,
        ###############################################################################
        [Alias('ext', 'Extensions')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't prevent loading of browser extensions"
        )]
        [switch] $BrowserExtensions,
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
        [Alias('rf', 'bg')]
        [switch] $RestoreFocus,
        ###############################################################################
        [Alias('nw', 'new')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = "Don't re-use existing browser window, instead, create a new one"
        )]
        [switch] $NewWindow,
        ###############################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Returns a [System.Diagnostics.Process] object of the browserprocess'
        )]
        [Alias('pt')]
        [switch]$PassThru,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Don't start a new game, just watch the AI play"
        )]
        [switch] $SpectateOnly,
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
            Position = 0,
            HelpMessage = 'Selects All or limit the theme to a specific one, default = PicassoPulse'
        )]
        [ValidateSet(
            '[All]',
            'VanGoghSkies',
            'MonetMoods',
            'PicassoPulse',
            'DaliDreams',
            'KandinskyKaleidoscope',
            'PollockPoints',
            'HokusaiWaves',
            'EscherEchoes',
            'WarholWaves',
            'KlimtKaleidoscope',
            'MiroMirage',
            'RothkoRhythms',
            'SeuratStipples',
            'RembrandtRadiance',
            'VermeerVisions',
            'BoschBizarre',
            'TurnerTwilight',
            'FridaFeelings',
            'CezanneContours',
            'GauguinGlow',
            'RenoirReflections'
        )]
        [string] $Theme = '[All]',
        ###############################################################################
        [parameter(
            Mandatory = $false,
            Position = 1,
            HelpMessage = 'Override default browser language, or select [All] for rotation of all languages every minute'
        )]
        [ValidateSet(
            'English',
            'Kotava',
            'Arabic',
            'German',
            'Spanish',
            'French',
            'Italian',
            'Japanese',
            'Korean',
            'Dutch',
            'Polish',
            'Portuguese',
            'Russian',
            'Thai',
            'Turkish',
            'Ukrainian',
            'Vietnamese',
            'Yiddish',
            'Chinese',
            '[All]')]
        [string] $Language,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the currently dragged node's background"
        )]
        [string]$DragedNodeBackground = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the focused node's (In center) background"
        )]
        [string]$FocusedNodeBackground = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the focused node's (in center) foreground text"
        )]
        [string]$FocusedNodeForeground = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the focused node's (In center) background"
        )]
        [string]$UnFocusedNodeBackground = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "Overwrite the css-color-style for painting the unfocused node's (in center) foreground text"
        )]
        [string]$UnFocusedNodeForeground = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Overwrite the default css border-light-color colorstyle'
        )]
        [string]$BorderLightColor = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Overwrite the default css border-dark-color colorstyle'
        )]
        [string]$BorderDarkColor = $null,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Overwrite the default width for painting the node borders'
        )]
        [int] $BorderWidth = 1,
        ###############################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = 'Overwrite the default width for the background rotation delay'
        )]
        [int] $RotationDelaySeconds = 15,
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
            HelpMessage = 'Prevent returning keyboard focus to PowerShell after sending keys'
        )]
        [switch] $SendKeyHoldKeyboardFocus,
        ###############################################################################
        [Alias('UseShiftEnter')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Send Shift+Enter instead of regular Enter for line breaks'
        )]
        [switch] $SendKeyUseShiftEnter,
        ###############################################################################
        [Alias('DelayMilliSeconds')]
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Delay between sending different key sequences in milliseconds'
        )]
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
            HelpMessage = 'Use alternative settings stored in session for AI preferences'
        )]
        [switch] $SessionOnly,
        ###############################################################################
        [Parameter(
            HelpMessage = 'Clear alternative settings stored in session for AI preferences'
        )]
        [switch] $ClearSession,
        ###############################################################################
        [Parameter(
            HelpMessage = 'Store settings only in persistent preferences without affecting session'
        )]
        [Alias('FromPreferences')]
        [switch] $SkipSession
    )

    begin {

        # define supported languages for the timeline interface
        $supportedLanguages = @(
            @{ code = 'en'; name = 'English' }
            @{ code = 'avk'; name = 'Kotava' }
            @{ code = 'ar'; name = 'Arabic' }
            @{ code = 'de'; name = 'German' }
            @{ code = 'es'; name = 'Spanish' }
            @{ code = 'fr'; name = 'French' }
            @{ code = 'it'; name = 'Italian' }
            @{ code = 'ja'; name = 'Japanese' }
            @{ code = 'ko'; name = 'Korean' }
            @{ code = 'nl'; name = 'Dutch' }
            @{ code = 'pl'; name = 'Polish' }
            @{ code = 'pt'; name = 'Portuguese' }
            @{ code = 'ru'; name = 'Russian' }
            @{ code = 'th'; name = 'Thai' }
            @{ code = 'tr'; name = 'Turkish' }
            @{ code = 'uk'; name = 'Ukrainian' }
            @{ code = 'vi'; name = 'Vietnamese' }
            @{ code = 'yi'; name = 'Yiddish' }
            @{ code = 'zh'; name = 'Chinese' }
        )

        # remove parameters specific to this function before passing to
        # open-webbrowser
        if ($PSBoundParameters.ContainsKey('Language')) {
            $null = $PSBoundParameters.Remove('Language')
        }

        if ($PSBoundParameters.ContainsKey('Theme')) {
            $null = $PSBoundParameters.Remove('Theme')
        }

        if ($PSBoundParameters.ContainsKey('DragedNodeBackground')) {
            $null = $PSBoundParameters.Remove('DragedNodeBackground')
        }

        if ($PSBoundParameters.ContainsKey('FocusedNodeBackground')) {
            $null = $PSBoundParameters.Remove('FocusedNodeBackground')
        }

        if ($PSBoundParameters.ContainsKey('FocusedNodeForeground')) {
            $null = $PSBoundParameters.Remove('FocusedNodeForeground')
        }

        if ($PSBoundParameters.ContainsKey('UnFocusedNodeBackground')) {
            $null = $PSBoundParameters.Remove('UnFocusedNodeBackground')
        }

        if ($PSBoundParameters.ContainsKey('UnFocusedNodeForeground')) {
            $null = $PSBoundParameters.Remove('UnFocusedNodeForeground')
        }

        if ($PSBoundParameters.ContainsKey('BorderLightColor')) {
            $null = $PSBoundParameters.Remove('BorderLightColor')
        }

        if ($PSBoundParameters.ContainsKey('BorderDarkColor')) {
            $null = $PSBoundParameters.Remove('BorderDarkColor')
        }

        if ($PSBoundParameters.ContainsKey('BorderWidth')) {
            $null = $PSBoundParameters.Remove('BorderWidth')
        }

        if ($PSBoundParameters.ContainsKey('RotationDelaySeconds')) {
            $null = $PSBoundParameters.Remove('RotationDelaySeconds')
        }

        if ($PSBoundParameters.ContainsKey('ReturnUrl')) {
            $null = $PSBoundParameters.Remove('ReturnUrl')
        }
    }

    process {

        # construct query parameters for the timeline url
        [string] $queryParams = ("?BorderWidth=$BorderWidth" +
            "&RotationDelaySeconds=$RotationDelaySeconds")

        # output verbose information about parameter construction
        Microsoft.PowerShell.Utility\Write-Verbose ('Building URL with ' +
            "parameters: $queryParams")

        # handle language selection if specified by user
        if (-not [String]::IsNullOrWhiteSpace($Language)) {

            # lookup language code from supported languages array
            $langCode = $supportedLanguages |
                Microsoft.PowerShell.Core\Where-Object { $_.name -eq $Language } |
                Microsoft.PowerShell.Utility\Select-Object -ExpandProperty code

            # append language parameter to query string
            $queryParams += "&lang=$langCode"
        }

        # add optional appearance parameters if specified by user
        if (-not [String]::IsNullOrWhiteSpace($FocusedNodeBackground)) {
            $queryParams += "&FocusedNodeBackground=$FocusedNodeBackground"
        }

        if (-not [String]::IsNullOrWhiteSpace($FocusedNodeForeground)) {
            $queryParams += "&FocusedNodeForeground=$FocusedNodeForeground"
        }

        if (-not [String]::IsNullOrWhiteSpace($UnFocusedNodeBackground)) {
            $queryParams += "&UnFocusedNodeBackground=$UnFocusedNodeBackground"
        }

        if (-not [String]::IsNullOrWhiteSpace($UnFocusedNodeForeground)) {
            $queryParams += "&UnFocusedNodeForeground=$UnFocusedNodeForeground"
        }

        if (-not [String]::IsNullOrWhiteSpace($BorderLightColor)) {
            $queryParams += "&BorderLightColor=$BorderLightColor"
        }

        if (-not [String]::IsNullOrWhiteSpace($BorderDarkColor)) {
            $queryParams += "&BorderDarkColor=$BorderDarkColor"
        }

        if (-not [String]::IsNullOrWhiteSpace($DragedNodeBackground)) {
            $queryParams += "&DragedNodeBackground=$DragedNodeBackground"
        }

        # construct the complete timeline url with theme fragment
        $url = "https://timeline.genxdev.net/$queryParams#$Theme"

        # handle return url only scenario without opening browser
        if ($ReturnOnlyURL) {
            Microsoft.PowerShell.Utility\Write-Output $url
            return
        }

        # configure default browser behavior settings for timeline display
        if (-not $PSBoundParameters.ContainsKey('NoApplicationMode')) {

            $null = $PSBoundParameters.Add('ApplicationMode', $true)

            if (-not $PSBoundParameters.ContainsKey('NewWindow')) {

                $null = $PSBoundParameters.Add('NewWindow', $true)
            }

            if (-not $PSBoundParameters.ContainsKey('FullScreen')) {

                $null = $PSBoundParameters.Add('FullScreen', $true)
            }
        }

        # remove the nofullscreen parameter as it's not used by open-webbrowser
        if ($PSBoundParameters.ContainsKey('NoFullScreen')) {

            $null = $PSBoundParameters.Remove('NoFullScreen')
        }

        # remove the noapplicationmode parameter as it's not used by
        # open-webbrowser
        if ($PSBoundParameters.ContainsKey('NoApplicationMode')) {

            $null = $PSBoundParameters.Remove('NoApplicationMode')
        }

        # configure browser extension settings based on user preference
        if (-not $PSBoundParameters.ContainsKey('BrowserExtensions')) {

            $null = $PSBoundParameters.Add('NoBrowserExtensions', $true)
        }
        else {

            $null = $PSBoundParameters.Remove('BrowserExtensions')
        }

        # add the constructed url to the parameters for open-webbrowser
        if (-not $PSBoundParameters.ContainsKey('Url')) {

            $null = $PSBoundParameters.Add('Url', $url)
        }

        # copy matching parameters between this function and open-webbrowser
        $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Webbrowser\Open-Webbrowser' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local -ErrorAction SilentlyContinue)

        # open the timeline in the web browser with configured parameters
        GenXdev.Webbrowser\Open-Webbrowser @invocationArguments

        # return url if requested by user
        if ($ReturnURL) {

            Microsoft.PowerShell.Utility\Write-Output $url
        }
    }

    end {
    }
}
###############################################################################