<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Open-GithubQuery.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.268.2025
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
Opens a Github repository search query in a web browser or executes advanced
searches against the GitHub REST API supporting all available qualifiers and
search categories (repositories, code, issues, users, commits, discussions,
topics, wikis).
.DESCRIPTION
Opens a Github repository search query in a web browser with extensive
customization options or performs advanced API searches. This function
provides a powerful interface for quickly accessing Github repositories from
PowerShell with support for multiple browsers, window positioning, language
filtering, and keyboard automation, or retrieving structured data via API.
Key features:

Multiple search query support with pipeline input
Language-specific filtering with automatic localization
Multi-browser support (Edge, Chrome, Firefox)
Advanced window positioning and monitor selection
Private/incognito browsing mode
Application mode for distraction-free browsing
Keyboard automation and focus management
URL return options for programmatic use
Advanced API search with qualifiers, sorting, pagination
Support for all GitHub search types
Authentication with personal access token
Asynchronous job execution for API searches
Raw JSON or structured object output

The function automatically constructs Github search URLs for web mode or API
endpoints for API mode and passes all browser-related parameters to the
underlying Open-Webbrowser function for consistent behavior.
.PARAMETER Query
The search queries to perform on Github. Supports multiple queries and
pipeline input for batch searching. Each query will be URL-encoded and used
to search Github.
.PARAMETER Type
The major category to search. Defaults to 'Code'.
.PARAMETER In
Field(s) to search. Only valid options for the selected Type will be
accepted.
.PARAMETER User
Restrict the search to a user's resources (repos, code, issues, etc.).
.PARAMETER Org
Restrict search to an organization.
.PARAMETER Repo
Restrict search to a named repository ('owner/repo').
.PARAMETER Path
Restrict code search to specific file or directory paths (supports wildcards
per GitHub Search Syntax).
.PARAMETER Filename
Filter results by the filename (not path).
.PARAMETER Extension
Restrict code search to file extensions.
.PARAMETER Language
Filter by programming language.
.PARAMETER Size
File/repo size. Supports numeric and range syntax (see examples).
.PARAMETER State
For issues/PR.
.PARAMETER Author
Issues/PR: limit to those created by a specified user.
.PARAMETER Assignee
Issues/PR: limit to those assigned a user.
.PARAMETER Labels
Issues/PR: must be labeled with all specified strings.
.PARAMETER No
Issues/PR: must lack certain metadata (e.g., label, milestone).
.PARAMETER SortBy
Sort field (depends on Type). E.g., 'stars', 'forks', 'updated', etc.
.PARAMETER Order
'asc' or 'desc' order for sorting.
.PARAMETER PerPage
Page size (max 100).
.PARAMETER Page
Page number for paged results.
.PARAMETER Token
GitHub OAuth or Personal Access Token. If not supplied, uses GITHUB_TOKEN or
environment variable.
.PARAMETER AcceptLang
Set the browser accept-lang http header.
.PARAMETER SendKeyDelayMilliSeconds
Delay between sending different key sequences in milliseconds.
.PARAMETER Monitor
The monitor to display results on. 0 = default, -1 = discard, -2 = secondary.
.PARAMETER Width
The initial width of the browser window.
.PARAMETER Height
The initial height of the browser window.
.PARAMETER X
The initial X position of the browser window.
.PARAMETER Y
The initial Y position of the browser window.
.PARAMETER KeysToSend
Keystrokes to send to the browser window, see documentation for cmdlet
GenXdev.Windows\Send-Key.
.PARAMETER CaseSensitive
Only match case-sensitive results (where supported).
.PARAMETER AsJob
Run the search asynchronously as a PowerShell job.
.PARAMETER RawResponse
Output raw JSON result from the API.
.PARAMETER Api
Use API mode instead of opening in web browser.
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
.PARAMETER FullScreen
Opens the browser in fullscreen mode.
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
Returns a [System.Diagnostics.Process] object of the browserprocess in web
mode or query object in API mode.
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
Open-GithubQuery -Query "powershell module" -Language "PowerShell"
Opens a search for PowerShell modules in Github with language filtering.
.EXAMPLE
qgithub "azure functions" -Monitor 0
Opens a search for Azure Functions on the primary monitor using the alias.
.EXAMPLE
Open-GithubQuery -Type Repository -Query PowerShell -SortBy stars -Order desc
-PerPage 1
Repository search: Find top-starred PowerShell repo in GitHub
.EXAMPLE
Open-GithubQuery -Type Code -Query "def " -Language python -In File
Code search for function definitions in Python
.EXAMPLE
Open-GithubQuery -Type Issue -Query security -Repo microsoft/vscode -Labels
bug -State open
Issue search: All open bugs mentioning 'security' in microsoft/vscode
.EXAMPLE
Open-GithubQuery -Type Repository -Query PowerShell -SortBy stars -Order desc
-PerPage 1 -Api
API mode for repository search.
#>
function Open-GithubQuery {

    [CmdletBinding(
        DefaultParameterSetName = 'Web',
        SupportsShouldProcess = $true,
        HelpUri = 'https://docs.github.com/en/rest/search'
    )]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Alias('qgithub', 'qgh')]
    [OutputType([PSCustomObject])]
    param(
        ########################################################################
        [Alias('q', 'Name', 'Text', 'Queries')]
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = ('The search queries to execute on Github. Supports ' +
            'multiple queries and pipeline input for batch searching. Each ' +
            'query will be URL-encoded and used to search Github.')
            )
            ]
        [string[]] $Query,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("The major category to search. Defaults to 'Code'.")
            )
        ]
        [ValidateSet(
            'Repository',
            'Code',
            'Issue',
            'PullRequest',
            'Commit',
            'User',
            'Discussion',
            'Topic',
            'Wiki'
            )
        ]
        [string] $Type = 'Code',
        ########################################################################
        [Parameter(
        Mandatory = $false,
        HelpMessage = ('Field(s) to search. Only valid options for the ' +
        'selected Type will be accepted.')
        )]
        [ValidateSet(
            'Name',
            'Description',
            'Readme',
            'File',
            'Path',
            'Title',
            'Body',
            'Comments',
            'Login',
            'Email',
            'FullName',
            'Topics'
        )]
        [string[]] $In,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Restrict the search to a user's resources (repos, " +
            'code, issues, etc.).')
        )]
        [string] $User,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Restrict search to an organization.'
        )]
        [string] $Org,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ("Restrict search to a named repository " +
            "('owner/repo').")
            )]
        [string] $Repo,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Code',
            HelpMessage = ('Restrict code search to specific file or directory ' +
            'paths (supports wildcards per GitHub Search Syntax).')
            )]
        [string] $Path,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Code',
            HelpMessage = 'Filter results by the filename (not path).'
            )]
        [string] $Filename,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Code',
            HelpMessage = 'Restrict code search to file extensions.'
            )]
        [string] $Extension,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Filter by programming language.'
            )]
        [string] $Language,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('File/repo size. Supports numeric and range syntax ' +
            '(see examples).')
            )]
        [string] $Size,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Issue',
            HelpMessage = 'For issues/PR.'
            )]
        [ValidateSet('open', 'closed', 'all')]
        [string] $State,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Issue',
            HelpMessage = ('Issues/PR: limit to those created by a specified ' +
            'user.')
            )]
        [string] $Author,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Issue',
            HelpMessage = 'Issues/PR: limit to those assigned a user.'
            )]
        [string] $Assignee,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Issue',
            HelpMessage = ('Issues/PR: must be labeled with all specified ' +
            'strings.')
        )]
        [string[]] $Labels,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Issue',
            HelpMessage = ('Issues/PR: must lack certain metadata (e.g., label, ' +
            'milestone).')
            )]
        [string[]] $No,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Sort field (depends on Type). E.g., "stars", ' +
            '"forks", "updated", etc.')
            )]
        [string] $SortBy,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = '"asc" or "desc" order for sorting.'
            )]
        [ValidateSet('asc', 'desc')]
        [string] $Order,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Page size (max 100).'
            )]
        [ValidateRange(1, 100)]
        [int] $PerPage = 10,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Page number for paged results.'
            )]
        [ValidateRange(1, 1000)]
        [int] $Page = 1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Api',
            HelpMessage = ('GitHub OAuth or Personal Access Token. If not ' +
            'supplied, uses GITHUB_TOKEN or environment variable.')
            )]
        [string] $Token,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Set the browser accept-lang http header.'
            )]
        [Alias('lang', 'locale')]
        [string] $AcceptLang = $null,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Delay between sending different key sequences in ' +
            'milliseconds.')
            )]
        [Alias('DelayMilliSeconds')]
        [int] $SendKeyDelayMilliSeconds,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('The monitor to display results on. 0 = default, ' +
            '-1 = discard, -2 = secondary.')
            )]
        [Alias('m', 'mon')]
        [int] $Monitor = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'The initial width of the browser window.'
            )]
        [int] $Width = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'The initial height of the browser window.'
            )]
        [int] $Height = -1,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'The initial X position of the browser window.'
            )]
        [int] $X = -999999,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'The initial Y position of the browser window.'
            )]
        [int] $Y = -999999,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Keystrokes to send to the browser window, see ' +
            'documentation for cmdlet GenXdev.Windows\Send-Key.')
            )]
        [string[]] $KeysToSend,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = 'Only match case-sensitive results (where supported).'
            )]
        [switch] $CaseSensitive,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Api',
            HelpMessage = ('Run the search asynchronously as a PowerShell ' +
            'job.')
            )]
        [switch] $AsJob,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Api',
            HelpMessage = 'Output raw JSON result from the API.'
            )]
        [switch] $RawResponse,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Api',
            HelpMessage = 'Use API mode instead of opening in web browser.'
            )]
        [switch] $Api,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Opens the browser in private/incognito browsing ' +
            'mode for anonymous searching.')
            )]
        [Alias('incognito', 'inprivate')]
        [switch] $Private,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Force enable debugging port, stopping existing ' +
            'browsers if needed.')
            )]
        [switch] $Force,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Opens the search results in Microsoft Edge browser.'
            )]
        [Alias('e')]
        [switch] $Edge,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Opens the search results in Google Chrome browser.'
            )]
        [Alias('ch')]
        [switch] $Chrome,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Opens the search results in Microsoft Edge or ' +
            'Google Chrome, depending on what the default browser is.')
            )]
        [Alias('c')]
        [switch] $Chromium,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Opens the search results in Mozilla Firefox browser.'
            )]
            [Alias('ff')]
        [switch] $Firefox,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Opens the search results in all registered modern ' +
            'browsers.')
            )]
        [switch] $All,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Opens the browser in fullscreen mode.'
            )]
        [Alias('fs', 'f')]
        [switch] $FullScreen,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Place browser window on the left side of the screen.'
            )]
        [switch] $Left,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Place browser window on the right side of the ' +
            'screen.')
            )]
        [switch] $Right,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Place browser window on the top side of the screen.'
            )]
        [switch] $Top,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Place browser window on the bottom side of the ' +
            'screen.')
            )]
        [switch] $Bottom,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Place browser window in the center of the screen.'
            )]
        [switch] $Centered,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Hide the browser controls.'
            )]
        [Alias('a', 'app', 'appmode')]
        [switch] $ApplicationMode,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Prevent loading of browser extensions.'
            )]
        [Alias('de', 'ne', 'NoExtensions')]
        [switch] $NoBrowserExtensions,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Disable the popup blocker in the browser.'
            )]
        [Alias('allowpopups')]
        [switch] $DisablePopupBlocker,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Focus the browser window after opening.'
            )]
        [Alias('fw', 'focus')]
        [switch] $FocusWindow,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Set the browser window to foreground after ' +
            'opening.')
            )]
        [Alias('fg')]
        [switch] $SetForeground,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Maximize the window after positioning.'
            )]
        [switch] $Maximize,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Restore PowerShell window focus.'
            )]
        [Alias('rf', 'bg')]
        [switch] $RestoreFocus,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ("Don't re-use existing browser window, instead, " +
            'create a new one.')
            )]
        [Alias('nw', 'new')]
        [switch] $NewWindow,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            HelpMessage = ('Returns a [System.Diagnostics.Process] object of ' +
            'the browserprocess in web mode or query object in API mode.')
        )]
        [Alias('pt')]
        [switch] $PassThru,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = "Don't open webbrowser, just return the url."
            )]
        [switch] $ReturnURL,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'After opening webbrowser, return the url.'
            )]
        [switch] $ReturnOnlyURL,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = 'Escape control characters when sending keys.'
            )]
        [Alias('Escape')]
        [switch] $SendKeyEscape,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Prevent returning keyboard focus to PowerShell ' +
            'after sending keys.')
        )]
        [Alias('HoldKeyboardFocus')]
        [switch] $SendKeyHoldKeyboardFocus,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Send Shift+Enter instead of regular Enter for ' +
            'line breaks.')
            )]
        [Alias('UseShiftEnter')]
        [switch] $SendKeyUseShiftEnter,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Remove window borders and title bar for a cleaner ' +
            'appearance.')
            )]
        [Alias('nb')]
        [switch] $NoBorders,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Place browser window side by side with PowerShell ' +
            'on the same monitor.')
            )]
        [Alias('sbs')]
        [switch] $SideBySide,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Use alternative settings stored in session for ' +
            'preferences.')
            )]
        [switch] $SessionOnly,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Clear alternative settings stored in session for ' +
            'preferences.')
            )]
        [switch] $ClearSession,
        ########################################################################
        [Parameter(
            Mandatory = $false,
            ParameterSetName = 'Web',
            HelpMessage = ('Store settings only in persistent preferences ' +
            'without affecting session.')
            )]
        [Alias('FromPreferences')]
        [switch] $SkipSession
        ########################################################################
    )

    begin
    {
        $invocationArguments = GenXdev.Helpers\Copy-IdenticalParamValues `
            -BoundParameters $PSBoundParameters `
            -FunctionName 'GenXdev.Webbrowser\Open-Webbrowser' `
            -DefaultValues (Microsoft.PowerShell.Utility\Get-Variable `
                -Scope Local `
                -ErrorAction SilentlyContinue)

        $ProgressActivity = "Executing GitHub query"
        Microsoft.PowerShell.Utility\Write-Verbose "Preparing request for type: $Type"

        if ($PSCmdlet.ParameterSetName -eq 'Api') {

            if (-not $Token) {
                $Token = $env:GITHUB_TOKEN
                if (-not $Token) {
                    Microsoft.PowerShell.Utility\Write-Warning "No GitHub API token provided; you will be subject to very strict rate limits."
                }
            }
            $AuthHeader = @{}
            if ($Token) {
                $AuthHeader['Authorization'] = "token $Token"
            }
            $Headers = $AuthHeader + @{
                "Accept" = "application/vnd.github.v3+json"
                "User-Agent" = "Open-GithubQuery-PS/1.0"
            }

            $ApiEndpoint = switch ($Type) {
                'Repository' { "https://api.github.com/search/repositories" }
                'Code'       { "https://api.github.com/search/code" }
                'Issue'      { "https://api.github.com/search/issues" }
                'PullRequest'{ "https://api.github.com/search/issues" }
                'Commit'     { "https://api.github.com/search/commits" }
                'User'       { "https://api.github.com/search/users" }
                'Discussion' { "https://api.github.com/search/discussions" }
                'Topic'      { "https://api.github.com/search/topics" }
                'Wiki'       { "https://api.github.com/search/wikis" }
                default      { throw "Unsupported search type: $Type" }
            }
        }

        $Qualifiers = @()
        if ($User)     { $Qualifiers += "user:$User" }
        if ($Org)      { $Qualifiers += "org:$Org" }
        if ($Repo)     { $Qualifiers += "repo:$Repo" }
        if ($In)       { foreach($f in $In) { $Qualifiers += "in:$f" } }
        if ($Language) { $Qualifiers += "language:$Language" }
        if ($Size)     { $Qualifiers += "size:$Size" }
        if ($Path -and $Type -eq 'Code')      { $Qualifiers += "path:$Path" }
        if ($Filename -and $Type -eq 'Code')  { $Qualifiers += "filename:$Filename" }
        if ($Extension -and $Type -eq 'Code') { $Qualifiers += "extension:$Extension" }
        if ($CaseSensitive.IsPresent)         { $Qualifiers += "case:yes" }
        if ($State -and ($Type -eq 'Issue' -or $Type -eq 'PullRequest')) {
            $Qualifiers += "state:$State"
        }
        if ($Author -and ($Type -eq 'Issue' -or $Type -eq 'PullRequest')) {
            $Qualifiers += "author:$Author"
        }
        if ($Assignee -and ($Type -eq 'Issue' -or $Type -eq 'PullRequest')) {
            $Qualifiers += "assignee:$Assignee"
        }
        if ($Labels -and ($Type -eq 'Issue' -or $Type -eq 'PullRequest')) {
            foreach($label in $Labels) { $Qualifiers += "label:$label" }
        }
        if ($No -and ($Type -eq 'Issue' -or $Type -eq 'PullRequest')) {
            foreach($noq in $No) { $Qualifiers += "no:$noq" }
        }
        if ($Type -eq 'PullRequest') { $Qualifiers += "is:pr" }
        elseif ($Type -eq 'Issue')   { $Qualifiers += "is:issue" }
    }

    process
    {
        foreach ($q in $Query) {

            Microsoft.PowerShell.Utility\Write-Verbose "Processing Github search query: $q"

            $QueryString = [string]::Join(" ", $q, $Qualifiers -join ' ')

            if ($PSCmdlet.ParameterSetName -eq 'Api') {

                $Uri = "$ApiEndpoint?q=$([Uri]::EscapeDataString($QueryString))&per_page=$PerPage&page=$Page"
                if ($SortBy)  { $Uri += "&sort=$SortBy" }
                if ($Order)   { $Uri += "&order=$Order" }

                if ($PSCmdlet.ShouldProcess("GitHub", "Run $Type search query")) {
                    try {
                        Microsoft.PowerShell.Utility\Write-Progress -Activity $ProgressActivity -Status "Calling GitHub REST API" -PercentComplete 10

                        $Result = if ($AsJob.IsPresent) {
                            Microsoft.PowerShell.Core\Start-Job -ScriptBlock {
                                param($Uri, $Headers)
                                Microsoft.PowerShell.Utility\Invoke-RestMethod -Uri $Uri -Headers $Headers -Method Get
                            } -ArgumentList $Uri, $Headers | Microsoft.PowerShell.Core\Wait-Job | Microsoft.PowerShell.Core\Receive-Job
                        } else {
                            Microsoft.PowerShell.Utility\Invoke-RestMethod -Uri $Uri -Headers $Headers -Method Get
                        }

                        Microsoft.PowerShell.Utility\Write-Progress -Activity $ProgressActivity -Completed

                        if ($RawResponse.IsPresent) {
                            Microsoft.PowerShell.Utility\Write-Output $Result
                            return
                        }

                        if ($null -ne $Result.items) {
                            foreach ($item in $Result.items) {
                                switch ($Type) {
                                    'Repository' {
                                        [PSCustomObject]@{
                                            Name        = $item.name
                                            FullName    = $item.full_name
                                            Owner       = $item.owner.login
                                            Url         = $item.html_url
                                            Description = $item.description
                                            Fork        = $item.fork
                                            LastUpdated = $item.updated_at
                                            LastPushed  = $item.pushed_at
                                            Language    = $item.language
                                            Stars       = $item.stargazers_count
                                            Forks       = $item.forks_count
                                            Topics      = $item.topics
                                            Visibility  = $item.visibility
                                        }
                                    }
                                    'Code' {
                                        [PSCustomObject]@{
                                            Name        = $item.name
                                            Path        = $item.path
                                            Repository  = $item.repository.full_name
                                            RepoUrl     = $item.repository.html_url
                                            HtmlUrl     = $item.html_url
                                            Language    = $item.language
                                            Score       = $item.score
                                            Lines       = $item.line_numbers
                                            Sha         = $item.sha
                                        }
                                    }
                                    'Issue'{
                                        [PSCustomObject]@{
                                            Number      = $item.number
                                            Title       = $item.title
                                            Url         = $item.html_url
                                            State       = $item.state
                                            Author      = $item.user.login
                                            Labels      = $item.labels
                                            Comments    = $item.comments
                                            Created     = $item.created_at
                                            Updated     = $item.updated_at
                                            Closed      = $item.closed_at
                                            Body        = $item.body
                                        }
                                    }

                                    'PullRequest' {
                                        [PSCustomObject]@{
                                            Number      = $item.number
                                            Title       = $item.title
                                            Url         = $item.html_url
                                            State       = $item.state
                                            Author      = $item.user.login
                                            Labels      = $item.labels
                                            Comments    = $item.comments
                                            Created     = $item.created_at
                                            Updated     = $item.updated_at
                                            Closed      = $item.closed_at
                                            Body        = $item.body
                                        }
                                    }
                                    'User' {
                                        [PSCustomObject]@{
                                            UserName    = $item.login
                                            Type        = $item.type
                                            Url         = $item.html_url
                                            Avatar      = $item.avatar_url
                                            Score       = $item.score
                                        }
                                    }
                                    default { Microsoft.PowerShell.Utility\Write-Output $item }
                                }
                            }
                        } else {
                            Microsoft.PowerShell.Utility\Write-Warning "No results returned from GitHub API. Check parameters."
                        }

                        if ($PassThru.IsPresent) {
                            Microsoft.PowerShell.Utility\Write-Output ([PSCustomObject]@{
                                Query      = $q
                                Type       = $Type
                                Parameters = $PSBoundParameters
                                RawUri     = $Uri
                            })
                        }
                    }
                    catch {
                        Microsoft.PowerShell.Utility\Write-Error "GitHub API request failed: $_"
                        if ($_.Exception.Response -and $_.Exception.Response.Headers) {
                            try {
                                $RateLimit = $_.Exception.Response.Headers["X-RateLimit-Remaining"]
                                $LimitReset = $_.Exception.Response.Headers["X-RateLimit-Reset"]
                                if ($null -ne $RateLimit) {
                                    Microsoft.PowerShell.Utility\Write-Warning ("GitHub API rate limit remaining: $RateLimit. " +
                                           "Resets at: $([DateTimeOffset]::FromUnixTimeSeconds([int]$LimitReset))")
                                }
                            } catch {

                            }
                        }
                    }
                }
            } else {

                $webType = switch ($Type) {
                    'Repository' { 'repositories' }
                    'Code'       { 'code' }
                    'Issue'      { 'issues' }
                    'PullRequest'{ 'issues' }
                    'Commit'     { 'commits' }
                    'User'       { 'users' }
                    'Discussion' { 'discussions' }
                    'Topic'      { 'topics' }
                    'Wiki'       { 'wikis' }
                    default      { 'repositories' }
                }

                $webUrl = "https://github.com/search?q=$([Uri]::EscapeDataString($QueryString))&type=$webType"
                if ($SortBy)  { $webUrl += "&s=$SortBy" }
                if ($Order)   { $webUrl += "&o=$Order" }
                if ($PerPage -ne 10) { $webUrl += "&per_page=$PerPage" }
                if ($Page -ne 1) { $webUrl += "&p=$Page" }

                $invocationArguments.'Url' = $webUrl

                if ($ReturnOnlyURL) {
                    Microsoft.PowerShell.Utility\Write-Output ($invocationArguments.Url)
                    continue
                }

                GenXdev.Webbrowser\Open-Webbrowser @invocationArguments

                if ($ReturnURL) {
                    Microsoft.PowerShell.Utility\Write-Output ($invocationArguments.Url)
                }
            }
        }
    }

    end {

    }
}
################################################################################