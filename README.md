<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Queries
### SYNOPSIS
    A Windows PowerShell module for finding resources and information on the internet
[![GenXdev.Queries](https://img.shields.io/powershellgallery/v/GenXdev.Queries.svg?style=flat-square&label=GenXdev.Queries)](https://www.powershellgallery.com/packages/GenXdev.Queries/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Queries?style=flat-square)](./LICENSE)

### FEATURES

    * ✅ Query multiple searchengines and content-providers at once with a single query

    * ✅ Query and control Youtube from PowerShell

    * ✅ Query the leading edge artificial intelligence, Generative Pre-trained Transformer 3 (GPT-3)

### NOTES

    In your PowerShell profile script,
    you can set a global variable named DefaultSecondaryMonitor.
    This allows you to setup your prefered webbrowser launch monitor.

    e.g.

       # Disable default placement of browser window
       Set-Variable -Name DefaultSecondaryMonitor -Value -1 -Scope Global

       # Place browser windows by default on 3th monitor (0 = Primary monitor, 1 = first, 2 = second,  etc)
       Set-Variable -Name DefaultSecondaryMonitor -Value 3 -Scope Global

### DEPENDENCIES
[![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.Webbrowser](https://img.shields.io/powershellgallery/v/GenXdev.Webbrowser.svg?style=flat-square&label=GenXdev.Webbrowser)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/) [![GenXdev.FileSystem](https://img.shields.io/powershellgallery/v/GenXdev.Filesystem.svg?style=flat-square&label=GenXdev.FileSystem)](https://www.powershellgallery.com/packages/GenXdev.FileSystem/)

### INSTALLATION
````PowerShell
Install-Module "GenXdev.Queries"
Import-Module "GenXdev.Queries"
````
### UPDATE
````PowerShell
Update-Module
````

<br/><hr/><hr/><br/>

# Cmdlet Index
### GenXdev.Queries<hr/>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-AllPossibleQueries](#Open-AllPossibleQueries) | qq | Open-AllPossibleQueries: Executes all Cmdlets that handle webpage queries |
| [Open-AllPossibleTextQueries](#Open-AllPossibleTextQueries) | qqq | Executes all Text query Cmdlets in parallel and shows the results |
| [Invoke-WebbrowserTabPollingScript](#Invoke-WebbrowserTabPollingScript) |  | Executes a background polling script in a previously selected webbrowser tab. |
| [Build-InvocationArguments](#Build-InvocationArguments) |  | Helper function for allowing different commandline parsing for query parameters |

<hr/>
&nbsp;

### GenXdev.Queries.Misc</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-Repeaters](#Open-Repeaters) | repeater | Opens HobbyScoop, Dutch amateur repeater status page |
| [Open-Timeline](#Open-Timeline) | timeline | Opens an interactive timeline, showing the current time, date, centery, millenium |
| [Open-GameOfLife](#Open-GameOfLife) | conway, gameoflife | Opens an interactive game-of-life simulation |
| [Open-ViralSimulation](#Open-ViralSimulation) | viral | Opens a very simple, interactive infection simulation |
| [Open-Yab](#Open-Yab) | yab | Opens an interactive block-falling-game in single playermode |
| [Open-YabAIBattle](#Open-YabAIBattle) | yabbattle | Opens an interactive block-falling-game in battle AI mode |

<hr/>
&nbsp;

### GenXdev.Queries.Text</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-WikipediaSummary](#Get-WikipediaSummary) | wikitxt | Performs a "Wikipedia summary" text query |
| [Get-Gpt3QuestionSummary](#Get-Gpt3QuestionSummary) | q3 | Performs a "Generative Pre-trained Transformer 3 (GPT-3), question" text query |
| [Get-Gpt3EnglishSummary](#Get-Gpt3EnglishSummary) | q3eng | Performs a "Generative Pre-trained Transformer 3 (GPT-3), English summary" text query |
| [Get-Gpt3DutchSummary](#Get-Gpt3DutchSummary) | q3nl | Performs a "Generative Pre-trained Transformer 3 (GPT-3), Dutch summary" text query |
| [Get-NextAffirmations](#Get-NextAffirmations) | WhatAboutIt | Returns a random affirmation text |
| [Get-QuoteOfTheDay](#Get-QuoteOfTheDay) | Quote | Returns a random quote |

<hr/>
&nbsp;

### GenXdev.Queries.Webbrowser</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-GoogleSearchResultUrls](#Get-GoogleSearchResultUrls) | qlinksget | Performs a google search and returns the links |
| [Open-AllGoogleLinks](#Open-AllGoogleLinks) | qlinks | Performs a google search .Opens 10 tabs each times, pauses until initial tab is revisitedClose initial tab to stop |
| [Open-AllYoutubeVideos](#Open-AllYoutubeVideos) | qvideos | Performs an infinite auto opening youtube search in a new fullscreen browser window on second monitor.The console window will show info about the video and keyboard shortcuts for controlling current playing video |
| [Open-GoogleQuery](#Open-GoogleQuery) | q | Opens a google query in a webbrowser, in a configurable manner, using commandline switches |
| [Copy-PDFsFromGoogleQuery](#Copy-PDFsFromGoogleQuery) |  | Performs a Google query in the previously selected webbrowser tab, and download all found pdf's into current directory |
| [Open-WikipediaQuery](#Open-WikipediaQuery) | wiki | Opens a Wikipedia query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WikipediaNLQuery](#Open-WikipediaNLQuery) | wikinl | Opens a 'Wikipedia - The Netherlands' query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-YoutubeQuery](#Open-YoutubeQuery) | youtube | Opens a Youtube query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-IMDBQuery](#Open-IMDBQuery) | imdb | Opens a "Internet Movie Database" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-InstantStreetViewQuery](#Open-InstantStreetViewQuery) | isv | Opens a "InstantStreetView" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-StackOverflowQuery](#Open-StackOverflowQuery) | qso | Opens a "Stack Overflow" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WolframAlphaQuery](#Open-WolframAlphaQuery) | qalpha | Opens a "Wolfram Alpha" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-GithubQuery](#Open-GithubQuery) | qgit | Opens a Github query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-GoogleSiteInfo](#Open-GoogleSiteInfo) |  | Opens a "Google siteinfo" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-BuiltWithSiteInfo](#Open-BuiltWithSiteInfo) |  | Opens a BuildWith query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WhoisHostSiteInfo](#Open-WhoisHostSiteInfo) |  | Opens a "Whois HostInfo" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WaybackMachineSiteInfo](#Open-WaybackMachineSiteInfo) | wayback | Opens a Waybackmachine query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-SimularWebSiteInfo](#Open-SimularWebSiteInfo) | simularsite | Opens a "Simular web" query in a webbrowser, in a configurable manner, using commandline switches |
| [Get-WebLanguageDictionary](#Get-WebLanguageDictionary) |  | Returns a reversed dictionary for all languages supported by Google Search |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Queries<hr/>

##	Open-AllPossibleQueries
````PowerShell
Open-AllPossibleQueries              --> qq
````

### SYNTAX
````PowerShell
Open-AllPossibleQueries [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge] [-Chrome] [-Chromium]
[-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-AllPossibleTextQueries
````PowerShell
Open-AllPossibleTextQueries          --> qqq
````

### SYNOPSIS
    Executes all Text query Cmdlets in parallel

### SYNTAX
````PowerShell
Open-AllPossibleTextQueries [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Executes all Text query Cmdlets in parallel and shows the results

### PARAMETERS
    -Queries <String[]>
        The query to perform
        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Invoke-WebbrowserTabPollingScript
````PowerShell
Invoke-WebbrowserTabPollingScript
````

### SYNOPSIS
    Executes a background polling script in a previously selected webbrowser tab.

### SYNTAX
````PowerShell
Invoke-WebbrowserTabPollingScript [[-Scripts] <Object[]>] [-InitialUrl <String>] [-Callback <ScriptBlock>]
[<CommonParameters>]
````

### DESCRIPTION
    Executes a background polling script in a previously selected webbrowser tab.

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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

### NOTES
````PowerShell
Requires the Windows 10+ Operating System
````

<br/><hr/><hr/><br/>

##	Build-InvocationArguments
````PowerShell
Build-InvocationArguments
````

### SYNOPSIS
    Helper function for allowing different commandline parsing for query parameters

### SYNTAX
````PowerShell
Build-InvocationArguments [-InvocationInfo] <Object> [[-Arguments] <String[]>] [[-SingleString]]
[<CommonParameters>]
````

### DESCRIPTION
    Helper function for allowing different commandline parsing for query parameters

### PARAMETERS
    -InvocationInfo <Object>
        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Arguments <String[]>
        Required?                    false
        Position?                    2
        Default value                @()
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -SingleString [<SwitchParameter>]
        Required?                    false
        Position?                    3
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.Misc<hr/>

##	Open-Repeaters
````PowerShell
Open-Repeaters                       --> repeater
````

### SYNTAX
````PowerShell
Open-Repeaters [[-Repeaters] {PI2NOS | PI3UTR | PI3GOE | MEETNET | PI6NOS | PI1DFT}] [-ApplicationMode]
[-Private] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <int>] [-FullScreen] [-Width <int>]
[-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to
        Global:DefaultSecondaryMonitor or 2 if not found
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-Timeline
````PowerShell
Open-Timeline                        --> timeline
````

### SYNTAX
````PowerShell
Open-Timeline [-ApplicationMode] [-Private] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <int>]
[-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to
        Global:DefaultSecondaryMonitor or 2 if not found
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-GameOfLife
````PowerShell
Open-GameOfLife                      --> conway, gameoflife
````

### SYNTAX
````PowerShell
Open-GameOfLife [-ApplicationMode] [-Private] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor
<int>] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to
        Global:DefaultSecondaryMonitor or 2 if not found
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-ViralSimulation
````PowerShell
Open-ViralSimulation                 --> viral
````

### SYNTAX
````PowerShell
Open-ViralSimulation [-ApplicationMode] [-Private] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor
<int>] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to
        Global:DefaultSecondaryMonitor or 2 if not found
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-Yab
````PowerShell
Open-Yab                             --> yab
````

### SYNTAX
````PowerShell
Open-Yab [[-Monitor] <int>] [-ApplicationMode] [-Private] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]
[-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured
        secondary monitor
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-YabAIBattle
````PowerShell
Open-YabAIBattle                     --> yabbattle
````

### SYNTAX
````PowerShell
Open-YabAIBattle [[-Monitor] <int>] [-ApplicationMode] [-Private] [-Edge] [-Chrome] [-Chromium] [-Firefox]
[-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured
        secondary monitor
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.Text<hr/>

##	Get-WikipediaSummary
````PowerShell
Get-WikipediaSummary                 --> wikitxt
````

### SYNOPSIS
    Performs a "Wikipedia summary" text query

### SYNTAX
````PowerShell
Get-WikipediaSummary [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Performs a "Wikipedia summary" text query

### PARAMETERS
    -Queries <String[]>
        The query to perform
        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Get-Gpt3QuestionSummary
````PowerShell
Get-Gpt3QuestionSummary              --> q3
````

### SYNOPSIS
    Performs a "Generative Pre-trained Transformer 3 (GPT-3), question" text query

### SYNTAX
````PowerShell
Get-Gpt3QuestionSummary [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Performs a "Generative Pre-trained Transformer 3 (GPT-3), question" text query

### PARAMETERS
    -Queries <String[]>
        The query to perform
        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Get-Gpt3EnglishSummary
````PowerShell
Get-Gpt3EnglishSummary               --> q3eng
````

### SYNOPSIS
    Performs a "Generative Pre-trained Transformer 3 (GPT-3), English summary" text query

### SYNTAX
````PowerShell
Get-Gpt3EnglishSummary [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Performs a "Generative Pre-trained Transformer 3 (GPT-3), English summary" text query

### PARAMETERS
    -Queries <String[]>
        The query to perform
        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Get-Gpt3DutchSummary
````PowerShell
Get-Gpt3DutchSummary                 --> q3nl
````

### SYNOPSIS
    Performs a "Generative Pre-trained Transformer 3 (GPT-3), Dutch summary" text query

### SYNTAX
````PowerShell
Get-Gpt3DutchSummary [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Performs a "Generative Pre-trained Transformer 3 (GPT-3), Dutch summary" text query

### PARAMETERS
    -Queries <String[]>
        The query to perform
        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Get-NextAffirmations
````PowerShell
Get-NextAffirmations                 --> WhatAboutIt
````

### SYNOPSIS
    Returns a random affirmation text

### SYNTAX
````PowerShell
Get-NextAffirmations [[-Speak]] [<CommonParameters>]
````

### DESCRIPTION
    Returns a random affirmation text

### PARAMETERS
    -Speak [<SwitchParameter>]
        Use text-to-speech to speak out affirmation
        Required?                    false
        Position?                    1
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Get-QuoteOfTheDay
````PowerShell
Get-QuoteOfTheDay                    --> Quote
````

### SYNOPSIS
    Returns a random quote

### SYNTAX
````PowerShell
Get-QuoteOfTheDay [[-Speak]] [<CommonParameters>]
````

### DESCRIPTION
    Returns a random quote

### PARAMETERS
    -Speak [<SwitchParameter>]
        Use text-to-speech to speak out the quote
        Required?                    false
        Position?                    1
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.Webbrowser<hr/>

##	Get-GoogleSearchResultUrls
````PowerShell
Get-GoogleSearchResultUrls           --> qlinksget
````

### SYNOPSIS
    Performs a google search and returns the links

### SYNTAX
````PowerShell
Get-GoogleSearchResultUrls [-Queries] <String[]> [-Max <Int32>] [-Language <String>] [<CommonParameters>]
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
    -Language <String>
        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

### NOTES
````PowerShell
    Requires the Windows 10+ Operating System
-------------------------- EXAMPLE 1 --------------------------
PS C:\> $Urls = Get-GoogleSearchResultUrls "site:github.com PowerShell module"; $Urls
````

<br/><hr/><hr/><br/>

##	Open-AllGoogleLinks
````PowerShell
Open-AllGoogleLinks                  --> qlinks
````

### SYNOPSIS
    Performs an infinite auto opening google search .

### SYNTAX
````PowerShell
Open-AllGoogleLinks [-Queries] <String[]> [-Language <String>] [<CommonParameters>]
````

### DESCRIPTION
    Performs a google search .
    Opens 10 tabs each times, pauses until initial tab is revisited
    Close initial tab to stop

### PARAMETERS
    -Queries <String[]>
        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    -Language <String>
        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

### NOTES
````PowerShell
    Requires the Windows 10+ Operating System
-------------------------- EXAMPLE 1 --------------------------
PS C:\>
Open-AllGoogleLinks "site:github.com PowerShell module"
````

<br/><hr/><hr/><br/>

##	Open-AllYoutubeVideos
````PowerShell
Open-AllYoutubeVideos                --> qvideos
````

### SYNOPSIS
    Performs an infinite auto opening youtube search in a new fullscreen browser window on second monitor.

### SYNTAX
````PowerShell
Open-AllYoutubeVideos [[-Queries] <String[]>] [-Subscriptions] [-WatchLater] [-Recommended]
[<CommonParameters>]
````

### DESCRIPTION
    Performs an infinite auto opening youtube search in a new fullscreen browser window on second monitor.
    The console window will show info about the video and keyboard shortcuts for controlling current playing
    video

### PARAMETERS
    -Queries <String[]>
        Opens all videos of each searchterm provided
        Required?                    false
        Position?                    1
        Default value                @("")
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    -Subscriptions [<SwitchParameter>]
        Opens all videos of subscribed channels
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -WatchLater [<SwitchParameter>]
        Opens all videos of the watch-later playlist
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    -Recommended [<SwitchParameter>]
        Opens all videos that youtube recommends
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

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

<br/><hr/><hr/><br/>

##	Open-GoogleQuery
````PowerShell
Open-GoogleQuery                     --> q
````

### SYNTAX
````PowerShell
Open-GoogleQuery [-Queries] <string[]> [-Monitor <int>] [-Language {Afrikaans | Akan | Albanian | Amharic |
Arabic | Armenian | Azerbaijani | Basque | Belarusian | Bemba | Bengali | Bihari | Bork, bork, bork! |
Bosnian | Breton | Bulgarian | Cambodian | Catalan | Cherokee | Chichewa | Chinese (Simplified) | Chinese
(Traditional) | Corsican | Croatian | Czech | Danish | Dutch | Elmer Fudd | English | Esperanto | Estonian |
Ewe | Faroese | Filipino | Finnish | French | Frisian | Ga | Galician | Georgian | German | Greek | Guarani
| Gujarati | Hacker | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo |
Indonesian | Interlingua | Irish | Italian | Japanese | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi
| Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish | Kurdish (Soranî) | Kyrgyz | Laothian | Latin |
Latvian | Lingala | Lithuanian | Lozi | Luganda | Luo | Macedonian | Malagasy | Malay | Malayalam | Maltese
| Maori | Marathi | Mauritian Creole | Moldavian | Mongolian | Montenegrin | Nepali | Nigerian Pidgin |
Northern Sotho | Norwegian | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto | Persian | Pirate |
Polish | Portuguese (Brazil) | Portuguese (Portugal) | Punjabi | Quechua | Romanian | Romansh | Runyakitara
| Russian | Scots Gaelic | Serbian | Serbo-Croatian | Sesotho | Setswana | Seychellois Creole | Shona |
Sindhi | Sinhalese | Slovak | Slovenian | Somali | Spanish | Spanish (Latin American) | Sundanese | Swahili
| Swedish | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka | Turkish |
Turkmen | Twi | Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish | Yoruba |
Zulu}] [-Private] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height
<int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode]
[-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough] [<CommonParameters>]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The language of the returned search results
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Copy-PDFsFromGoogleQuery
````PowerShell
Copy-PDFsFromGoogleQuery
````

### SYNOPSIS
    Performs a Google query in the previously selected webbrowser tab, and download all found pdf's into current
    directory

### SYNTAX
````PowerShell
Copy-PDFsFromGoogleQuery [-Queries] <String[]> [-Max <Int32>] [-Language <String>] [<CommonParameters>]
````

### DESCRIPTION
    Performs a Google query in the previously selected webbrowser tab, and download all found pdf's into current
    directory

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
    -Language <String>
        Required?                    false
        Position?                    named
        Default value
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

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
PS D:\Downloads>
Open-Webbrowser
    Select-WebbrowserTab
    mkdir pdfs;
    cd pdfs;
    Copy-PDFsFromGoogleQuery -Query "scientific paper co2" | Select-Object -First 10 | Open-Webbrowser
````

<br/><hr/><hr/><br/>

##	Open-WikipediaQuery
````PowerShell
Open-WikipediaQuery                  --> wiki
````

### SYNOPSIS
    Opens a Wikipedia query in a webbrowser

### SYNTAX
````PowerShell
Open-WikipediaQuery [-Queries] <String[]> [-Monitor <Int32>] [<CommonParameters>]
````

### DESCRIPTION
    Opens a Wikipedia query in a webbrowser, in a configurable manner, using commandline switches

### PARAMETERS
    -Queries <String[]>
        Required?                    true
        Position?                    1
        Default value
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
    -Monitor <Int32>
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-WikipediaNLQuery
````PowerShell
Open-WikipediaNLQuery                --> wikinl
````

### SYNTAX
````PowerShell
Open-WikipediaNLQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge] [-Chrome] [-Chromium]
[-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-YoutubeQuery
````PowerShell
Open-YoutubeQuery                    --> youtube
````

### SYNTAX
````PowerShell
Open-YoutubeQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge] [-Chrome] [-Chromium] [-Firefox]
[-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-IMDBQuery
````PowerShell
Open-IMDBQuery                       --> imdb
````

### SYNTAX
````PowerShell
Open-IMDBQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge] [-Chrome] [-Chromium] [-Firefox]
[-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]
[-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-InstantStreetViewQuery
````PowerShell
Open-InstantStreetViewQuery          --> isv
````

### SYNTAX
````PowerShell
Open-InstantStreetViewQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge] [-Chrome] [-Chromium]
[-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-StackOverflowQuery
````PowerShell
Open-StackOverflowQuery              --> qso
````

### SYNTAX
````PowerShell
Open-StackOverflowQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge] [-Chrome] [-Chromium]
[-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-WolframAlphaQuery
````PowerShell
Open-WolframAlphaQuery               --> qalpha
````

### SYNTAX
````PowerShell
Open-WolframAlphaQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge] [-Chrome] [-Chromium]
[-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-GithubQuery
````PowerShell
Open-GithubQuery                     --> qgit
````

### SYNTAX
````PowerShell
Open-GithubQuery [-Queries] <string[]> [-Language <string>] [-Monitor <int>] [-Private] [-Edge] [-Chrome]
[-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left]
[-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-GoogleSiteInfo
````PowerShell
Open-GoogleSiteInfo
````

### SYNTAX
````PowerShell
Open-GoogleSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge] [-Chrome] [-Chromium]
[-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-BuiltWithSiteInfo
````PowerShell
Open-BuiltWithSiteInfo
````

### SYNTAX
````PowerShell
Open-BuiltWithSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge] [-Chrome] [-Chromium]
[-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-WhoisHostSiteInfo
````PowerShell
Open-WhoisHostSiteInfo
````

### SYNTAX
````PowerShell
Open-WhoisHostSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge] [-Chrome] [-Chromium]
[-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-WaybackMachineSiteInfo
````PowerShell
Open-WaybackMachineSiteInfo          --> wayback
````

### SYNTAX
````PowerShell
Open-WaybackMachineSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge] [-Chrome] [-Chromium]
[-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Open-SimularWebSiteInfo
````PowerShell
Open-SimularWebSiteInfo              --> simularsite
````

### SYNTAX
````PowerShell
Open-SimularWebSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Edge] [-Chrome] [-Chromium]
[-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top]
[-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-RestoreFocus] [-NewWindow] [-PassThrough]
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
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor
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
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>

##	Get-WebLanguageDictionary
````PowerShell
Get-WebLanguageDictionary
````

### SYNOPSIS
    Returns a reversed dictionary for all languages supported by Google Search

### SYNTAX
````PowerShell
Get-WebLanguageDictionary [<CommonParameters>]
````

### DESCRIPTION
    Returns a reversed dictionary for all languages supported by Google Search

### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).

<br/><hr/><hr/><br/>
