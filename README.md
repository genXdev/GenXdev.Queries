<hr/>

<img src="powershell.jpg" alt="drawing" width="50%"/>

<hr/>

### NAME
    GenXdev.Queries
### SYNOPSIS
    A Windows PowerShell module for finding resources and information on the internet
[![GenXdev.Queries](https://img.shields.io/powershellgallery/v/GenXdev.Queries.svg?style=flat-square&label=GenXdev.Queries)](https://www.powershellgallery.com/packages/GenXdev.Queries/) [![License](https://img.shields.io/github/license/renevaessen/GenXdev.Queries?style=flat-square)](./LICENSE)

### FEATURES
````PowerShell
Open-AllPossibleQueries     -Queries <string[]>          -> qq
    Open-AllPossibleTextQueries -Queries <string[]>          -> qqq

    Get-Gpt3DutchSummary        -Queries <string[]>          -> q3
    Get-Gpt3EnglishSummary      -Queries <string[]>
    Get-Gpt3QuestionSummary     -Queries <string[]>

    Get-WikipediaSummary        -Queries <string[]>          -> wikitxt

    Open-GoogleQuery            -Queries <string[]>          -> q
    Open-StackOverflowQuery     -Queries <string[]>          -> qso
    Open-GithubQuery            -Queries <string[]>          -> qgit
    Open-YoutubeQuery           -Queries <string[]>          -> youtube
    Open-IMDBQuery              -Queries <string[]>          -> imdb
    Open-WolframAlphaQuery      -Queries <string[]>          -> qalpha
    Open-WikipediaQuery         -Queries <string[]>          -> wiki
    Open-WikipediaNLQuery       -Queries <string[]>          -> wikinl

    Open-GoogleSiteInfo         -Queries <string[]>
    Open-SimularWebSiteInfo     -Queries <string[]>
    Open-WaybackMachineSiteInfo -Queries <string[]>
    Open-WhoisHostSiteInfo      -Queries <string[]>
    Open-BuiltWithSiteInfo      -Queries <string[]>

    Get-NextAffirmations                                     -> WhatAboutIt
    Get-NextJoke                                             -> TellAJoke

    Get-GoogleSearchResultUrls  -Queries <string[] [[-Max] <int>]

    Open-AllYoutubeVideos       [-Queries <string[]>]        -> qvideos
    Open-AllGoogleLinks         -Queries <string[]>          -> qlinks
    Copy-PDFsFromGoogleQuery    -Queries <string[]>
````
### TYPE
    PowerShell Module

### DEPENDENCIES
[![WinOS - Windows-10](https://img.shields.io/badge/WinOS-Windows--10--10.0.19041--SP0-brightgreen)](https://www.microsoft.com/en-us/windows/get-windows-10)  [![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.Webbrowser](https://img.shields.io/powershellgallery/v/GenXdev.Webbrowser.svg?style=flat-square&label=GenXdev.Webbrowser)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/)

### INSTALLATION
````PowerShell
Install-Module "GenXdev.Queries" -Force
Import-Module "GenXdev.Queries"
````
### UPDATE
````PowerShell
Update-Module
````

<br/><hr/><hr/><hr/><hr/><br/>
# Cmdlets
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Build-InvocationArguments
### SYNTAX
````PowerShell
Build-InvocationArguments [-InvocationInfo] <Object> [-Arguments]
<string[]> [<CommonParameters>]
````
### PARAMETERS
    -Arguments <string[]>
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -InvocationInfo <Object>
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Copy-PDFsFromGoogleQuery
### SYNOPSIS
    Performs a google query in the previously selected webbrowser tab, and
    download all found pdf's into current directory
### SYNTAX
````PowerShell
Copy-PDFsFromGoogleQuery -Queries <string[]> [-Max <Int32>]
[<CommonParameters>]
````
### DESCRIPTION
    Performs a google query in the previously selected webbrowser tab, and
    download all found pdf's into current directory
### PARAMETERS
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -Max <Int32>
        The maximum number of results to obtain, defaults to 200
        Required?                    false
        Position?                    named
        Default value                200
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
### NOTES
````PowerShell
Requires the Windows 10+ Operating System
-------------------------- EXAMPLE 1 --------------------------
PS D:\Downloads>

    Open-Webbrowser
    Select-WebbrowserTab

    mkdir pdfs;
    cd pdfs;

    Copy-PDFsFromGoogleQuery scientific paper co2
-------------------------- EXAMPLE 2 --------------------------

    Open-Webbrowser
    Select-WebbrowserTab

    mkdir pdfs;
    cd pdfs;

    Copy-PDFsFromGoogleQuery -Query "scientific paper co2" | Select-Object -First 10 | Open-Webbrowser
````
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Get-GoogleSearchResultUrls           --> qlinksget
````

### SYNOPSIS
    Performs a google search and returns
    the links
### SYNTAX
````PowerShell
Get-GoogleSearchResultUrls [-Queries] <String[]> [-Max <Int32>]
[<CommonParameters>]
````
### DESCRIPTION
    Performs a google search and returns the links
### PARAMETERS
    -Queries <String[]>
        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    -Max <Int32>
        The maximum number of results to obtain, defaults to 200
        Required?                    false
        Position?                    named
        Default value                200
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
### NOTES
````PowerShell
Requires the Windows 10+ Operating System
-------------------------- EXAMPLE 1 --------------------------
PS C:\> $Urls = Get-GoogleSearchResultUrls "site:github.com PowerShell
module"; $Urls
````
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Get-Gpt3DutchSummary                 --> q3
````

### SYNTAX
````PowerShell
Get-Gpt3DutchSummary [-Queries] <string[]> [<CommonParameters>]
````
### PARAMETERS
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Get-Gpt3EnglishSummary
### SYNTAX
````PowerShell
Get-Gpt3EnglishSummary [-Queries] <string[]> [<CommonParameters>]
````
### PARAMETERS
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Get-Gpt3QuestionSummary
### SYNTAX
````PowerShell
Get-Gpt3QuestionSummary [-Queries] <string[]> [<CommonParameters>]
````
### PARAMETERS
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Get-NextAffirmations                 --> WhatAboutIt
````

### SYNTAX
````PowerShell
Get-NextAffirmations [[-Speak]] [<CommonParameters>]
````
### PARAMETERS
    -Speak
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Get-NextJoke                         --> TellAJoke
````

### SYNTAX
````PowerShell
Get-NextJoke [[-Speak]] [<CommonParameters>]
````
### PARAMETERS
    -Speak
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Get-WikipediaSummary                 --> wikitxt
````

### SYNTAX
````PowerShell
Get-WikipediaSummary [-Queries] <string[]> [<CommonParameters>]
````
### PARAMETERS
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Invoke-WebbrowserTabPollingScript
### SYNOPSIS
    Executes a background polling script in a previously selected webbrowser
    tab.
### SYNTAX
````PowerShell
Invoke-WebbrowserTabPollingScript [[-Scripts] <Object[]>] [-InitialUrl
<String>] [-Callback <ScriptBlock>] [<CommonParameters>]
````
### DESCRIPTION
    Executes a background polling script in a previously selected webbrowser
    tab.
### PARAMETERS
    -Scripts <Object[]>
        The scripts to load
        Required?                    false
        Position?                    1
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    -InitialUrl <String>
        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Callback <ScriptBlock>
        A scriptblock that gets executed each time the tab has been polled
        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
### NOTES
````PowerShell
Requires the Windows 10+ Operating System
````
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-AllGoogleLinks                  --> qlinks
````

### SYNOPSIS
    Performs an infinite auto opening google search in previously selected
    webbrowser tab.
### SYNTAX
````PowerShell
Open-AllGoogleLinks -Queries <string[]> [<CommonParameters>]
````
### DESCRIPTION
    Performs a google search .
    Opens 10 tabs each times, pauses until initial tab is revisited
    Close initial tab to stop
### PARAMETERS
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
### NOTES
````PowerShell
Requires the Windows 10+ Operating System
-------------------------- EXAMPLE 1 --------------------------
PS C:\>
Open-AllGoogleLinks "site:github.com PowerShell module"
````
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-AllPossibleQueries              --> qq
````

### SYNTAX
````PowerShell
Open-AllPossibleQueries [-Queries] <string[]> [-Monitor <int>] [-Private]
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width
<int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions]
[-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor, -2 = Configured secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-AllPossibleTextQueries          --> qqq
````

### SYNTAX
````PowerShell
Open-AllPossibleTextQueries [-Queries] <string[]> [<CommonParameters>]
````
### PARAMETERS
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-AllYoutubeVideos                --> qvideos
````

### SYNOPSIS
    Performs an infinite auto opening youtube search in a new fullscreen
    browser window on second monitor
### SYNTAX
````PowerShell
Open-AllYoutubeVideos [-Queries <string[]>] [<CommonParameters>]
````
### DESCRIPTION
    Performs an infinite auto opening youtube search in a new fullscreen
    browser window on second monitor
    Console window will show info about the video and keyboard shortcuts for
    controlling current playing video
### PARAMETERS
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
### NOTES
````PowerShell
Requires the Windows 10+ Operating System
-------------------------- EXAMPLE 1 --------------------------
PS C:\>
Open-AllYoutubeVideos "PowerShell Windows Terminal"
-------------------------- EXAMPLE 2 --------------------------
PS C:\>
qvideos PowerShell tutorial, vscode tips
    qvideos -Queries "PowerShell tutorials", "vscode tips"
````
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-BuiltWithSiteInfo
### SYNTAX
````PowerShell
Open-BuiltWithSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private]
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width
<int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions]
[-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-GameOfLife                      --> conway, gameoflife
````

### SYNTAX
````PowerShell
Open-GameOfLife [-FullScreen] [-ApplicationMode] [-Private] [-Edge]
[-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <int>] [-Width <int>]
[-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow]
[-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     false
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     false
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor, defaults to Global:DefaultSecondaryMonitor or 1 if
        not found
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     true
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-GithubQuery                     --> qgit
````

### SYNTAX
````PowerShell
Open-GithubQuery [-Queries] <string[]> [-Language <string>] [-Monitor
<int>] [-Private] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]
[-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left]
[-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode]
[-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
[<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Language <string>
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-GoogleQuery                     --> q
````

### SYNTAX
````PowerShell
Open-GoogleQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge]
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>]
[-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus]
[-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-GoogleSiteInfo
### SYNTAX
````PowerShell
Open-GoogleSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private]
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width
<int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions]
[-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-IMDBQuery                       --> imdb
````

### SYNTAX
````PowerShell
Open-IMDBQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge]
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>]
[-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus]
[-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-Repeaters
### SYNTAX
````PowerShell
Open-Repeaters [[-Repeaters] {PI2NOS | PI3UTR | PI3GOE | MEETNET | PI6NOS
| PI1DFT}] [-FullScreen] [-ApplicationMode] [-Private] [-Edge] [-Chrome]
[-Chromium] [-Firefox] [-All] [-Monitor <int>] [-Width <int>] [-Height
<int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]
[-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
[<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     false
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     false
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor, defaults to Global:DefaultSecondaryMonitor or 1 if
        not found
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     true
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Repeaters <string[]>
        Required?                    false
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-SimularWebSiteInfo
### SYNTAX
````PowerShell
Open-SimularWebSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private]
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width
<int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions]
[-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-StackOverflowQuery              --> qso
````

### SYNTAX
````PowerShell
Open-StackOverflowQuery [-Queries] <string[]> [-Monitor <int>] [-Private]
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width
<int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions]
[-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-Tetris                          --> tetris
````

### SYNTAX
````PowerShell
Open-Tetris [[-Monitor] <int>] [-FullScreen] [-ApplicationMode] [-Private]
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height
<int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]
[-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
[<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     false
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     false
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor, -2 = Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-TetrisAIBattle                  --> tetrisbattle
````

### SYNTAX
````PowerShell
Open-TetrisAIBattle [[-Monitor] <int>] [-FullScreen] [-ApplicationMode]
[-Private] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>]
[-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow]
[-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     false
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     false
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor, -2 = Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-Timeline                        --> timeline
````

### SYNTAX
````PowerShell
Open-Timeline [-FullScreen] [-ApplicationMode] [-Private] [-Edge]
[-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <int>] [-Width <int>]
[-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow]
[-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     false
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     false
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor, defaults to Global:DefaultSecondaryMonitor or 1 if
        not found
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     true
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-ViralSimulation                 --> viral
````

### SYNTAX
````PowerShell
Open-ViralSimulation [-FullScreen] [-ApplicationMode] [-Private] [-Edge]
[-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <int>] [-Width <int>]
[-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow]
[-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     false
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     false
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor, defaults to Global:DefaultSecondaryMonitor or 1 if
        not found
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     true
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-WaybackMachineSiteInfo
### SYNTAX
````PowerShell
Open-WaybackMachineSiteInfo [-Queries] <string[]> [-Monitor <int>]
[-Private] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen]
[-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right]
[-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions]
[-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-WhoisHostSiteInfo
### SYNTAX
````PowerShell
Open-WhoisHostSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private]
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width
<int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions]
[-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-WikipediaNLQuery                --> wikinl
````

### SYNTAX
````PowerShell
Open-WikipediaNLQuery [-Queries] <string[]> [-Monitor <int>] [-Private]
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width
<int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions]
[-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-WikipediaQuery                  --> wiki
````

### SYNTAX
````PowerShell
Open-WikipediaQuery [-Queries] <string[]> [-Monitor <int>] [-Private]
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width
<int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions]
[-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-WolframAlphaQuery               --> qalpha
````

### SYNTAX
````PowerShell
Open-WolframAlphaQuery [-Queries] <string[]> [-Monitor <int>] [-Private]
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width
<int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions]
[-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
````PowerShell
Open-YoutubeQuery                    --> youtube
````

### SYNTAX
````PowerShell
Open-YoutubeQuery [-Queries] <string[]> [-Monitor <int>] [-Private]
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width
<int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions]
[-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
````
### PARAMETERS
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -ApplicationMode
        Hide the browser controls
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      a, app, appmode
        Dynamic?                     true
        Accept wildcard characters?  false
    -Bottom
        Place browser window on the bottom side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Centered
        Place browser window in the center of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chrome
        Opens in Google Chrome
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     true
        Accept wildcard characters?  false
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the
        default browser is
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     true
        Accept wildcard characters?  false
    -Edge
        Opens in Microsoft Edge
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     true
        Accept wildcard characters?  false
    -Firefox
        Opens in Firefox
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     true
        Accept wildcard characters?  false
    -FullScreen
        Opens in fullscreen mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      fs, f
        Dynamic?                     true
        Accept wildcard characters?  false
    -Height <int>
        The initial height of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured
        secondary monitor
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
    -NewWindow
        Do not re-use existing browser window, instead, create a new one
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     true
        Accept wildcard characters?  false
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThrough
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito-/in-private browsing- mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      q, Value, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore PowerShell window focus
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      bg
        Dynamic?                     true
        Accept wildcard characters?  false
    -Right
        Place browser window on the right side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Width <int>
        The initial width of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -X <int>
        The initial X position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Y <int>
        The initial Y position of the webbrowser window
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).