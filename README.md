<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Queries
### SYNOPSIS
    A Windows PowerShell module for finding resources and information on the internet
[![GenXdev.Queries](https://img.shields.io/powershellgallery/v/GenXdev.Queries.svg?style=flat-square&label=GenXdev.Queries)](https://www.powershellgallery.com/packages/GenXdev.Queries/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Queries?style=flat-square)](./LICENSE)

## MIT License

```text
MIT License

Copyright (c) [year] [fullname]

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
````

### FEATURES

    * ✅ use, Ask "anything" to query any of the popular LLM's
    * ✅ search "any topic" on any of the popular searchengines using the 'q' cmdlet
    * ✅ query multiple searchengines and content-providers at once with a single query using the 'qq' cmdlet
    * ✅ query text from a variety of api providers, all at once with a single query using the 'qqq' cmdlet
    * ✅ cool way of viewing and controlling youtube with 'qvideos' cmdlet

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
[![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/)  [![GenXdev.Webbrowser](https://img.shields.io/powershellgallery/v/GenXdev.Webbrowser.svg?style=flat-square&label=GenXdev.Webbrowser)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/) [![GenXdev.Console](https://img.shields.io/powershellgallery/v/GenXdev.Console.svg?style=flat-square&label=GenXdev.Console)](https://www.powershellgallery.com/packages/GenXdev.Console/) [![GenXdev.FileSystem](https://img.shields.io/powershellgallery/v/GenXdev.Filesystem.svg?style=flat-square&label=GenXdev.FileSystem)](https://www.powershellgallery.com/packages/GenXdev.FileSystem/)

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
| [ConvertTo-Uris](#ConvertTo-Uris) |  | Parses strings for any valid URI. |
| [Invoke-WebbrowserTabPollingScript](#Invoke-WebbrowserTabPollingScript) |  | Executes a background polling script in a previously selected webbrowser tab. |
| [Open-AllPossibleQueries](#Open-AllPossibleQueries) | qq | Opens all possible query types for given search terms or URLs. |
| [Open-AllPossibleTextQueries](#Open-AllPossibleTextQueries) | qqq | Executes all Text query Cmdlets in parallel and displays results. |

<hr/>
&nbsp;

### GenXdev.Queries.AI</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-BingCopilotQuery](#Open-BingCopilotQuery) | aibc | Opens a Bing CoPilot query in a webbrowser |
| [Open-ChatGPTQuery](#Open-ChatGPTQuery) | aicgpt, askchatgpt | Opens a ChatGPT query in a web browser. |
| [Open-CloudLLMChat](#Open-CloudLLMChat) | ask | Opens a cloud LLM chat interface for AI queries. |
| [Open-DeepSearchQuery](#Open-DeepSearchQuery) | aideepseek, askdeepsearch | Opens a DeepSeek query in a webbrowser |
| [Open-GithubCopilotQuery](#Open-GithubCopilotQuery) | aigc, askghcopilot | Opens a Github CoPilot query in a webbrowser |
| [Open-GoogleGeminiQuery](#Open-GoogleGeminiQuery) | aigg, askgemini | Opens a Google Gemini query in a webbrowser |
| [Open-XGrokQuery](#Open-XGrokQuery) | aixg, askxgrok | Opens a X Grok query in a webbrowser |

<hr/>
&nbsp;

### GenXdev.Queries.Text</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-NextAffirmation](#Get-NextAffirmation) | whataboutit | Returns a random affirmation text from affirmations.dev API. |
| [Get-WikipediaSummary](#Get-WikipediaSummary) | wikitxt | Retrieves a summary of a topic from Wikipedia. |

<hr/>
&nbsp;

### GenXdev.Queries.Webbrowser</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Clear-YoutubeWatched](#Clear-YoutubeWatched) |  | Clears the YouTube watch history from the browser's local storage. |
| [Copy-PDFsFromGoogleQuery](#Copy-PDFsFromGoogleQuery) |  | Downloads PDF files found through Google search results. |
| [Get-GoogleSearchResultUrls](#Get-GoogleSearchResultUrls) | qlinksget | Performs a google search and returns the links |
| [Open-AllGoogleLinks](#Open-AllGoogleLinks) | qlinks | Performs an infinite auto opening google search . |
| [Open-AllYoutubeVideos](#Open-AllYoutubeVideos) | qvideos, qyt | Opens and controls YouTube videos in a browser window with keyboard shortcuts. |
| [Open-BingQuery](#Open-BingQuery) | bq | Opens a Bing search query in a web browser. |
| [Open-BuiltWithSiteInfo](#Open-BuiltWithSiteInfo) |  | Opens BuiltWith website queries in a web browser. |
| [Open-GithubQuery](#Open-GithubQuery) | qgithub | Opens a Github repository search query in a web browser. |
| [Open-GoogleQuery](#Open-GoogleQuery) | q |  |
| [Open-GoogleSiteInfo](#Open-GoogleSiteInfo) |  | Opens Google site information queries in a web browser. |
| [Open-IMDBQuery](#Open-IMDBQuery) | imdb | Opens an IMDB search query in a web browser. |
| [Open-InstantStreetViewQuery](#Open-InstantStreetViewQuery) | isv | Opens InstantStreetView queries in a web browser. |
| [Open-MovieQuote](#Open-MovieQuote) | moviequote | Opens a video of a movie quote in a web browser. |
| [Open-SearchEngine](#Open-SearchEngine) | q |  |
| [Open-SimularWebSiteInfo](#Open-SimularWebSiteInfo) | simularsite | Opens SimilarWeb website information for specified URLs in a web browser. |
| [Open-StackOverflowQuery](#Open-StackOverflowQuery) | qso | Opens Stack Overflow search queries in a web browser. |
| [Open-WaybackMachineSiteInfo](#Open-WaybackMachineSiteInfo) | wayback | Opens WaybackMachine site information in a web browser. |
| [Open-WebsiteAndPerformQuery](#Open-WebsiteAndPerformQuery) | owaq | Opens a webpage in a webbrowser and performs one or more queries. |
| [Open-WhoisHostSiteInfo](#Open-WhoisHostSiteInfo) | whois | Opens a Whois host information query in a web browser. |
| [Open-WikipediaNLQuery](#Open-WikipediaNLQuery) | wikinl | Opens Dutch Wikipedia searches in a web browser. |
| [Open-WikipediaQuery](#Open-WikipediaQuery) | wiki | Opens a Wikipedia query in a webbrowser. |
| [Open-WolframAlphaQuery](#Open-WolframAlphaQuery) | qalpha | Opens a Wolfram Alpha query in a web browser. |
| [Open-YoutubeQuery](#Open-YoutubeQuery) | youtube | Opens YouTube search queries in a web browser. |

<hr/>
&nbsp;

### GenXdev.Queries.Websites</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-GameOfLife](#Open-GameOfLife) | gameoflife, conway | Opens Conway's Game of Life simulation in a web browser. |
| [Open-GenXdevAppCatalog](#Open-GenXdevAppCatalog) | appcatalog | Opens the GenXdev progressive webapps catalog in a web browser. |
| [Open-Timeline](#Open-Timeline) | timeline | Opens an interactive timeline showing current time, date, century, and millennium. |
| [Open-ViralSimulation](#Open-ViralSimulation) | viral |  |
| [Open-Yab](#Open-Yab) | yab | Opens the YAB game in a web browser with configurable settings. |
| [Open-YabAIBattle](#Open-YabAIBattle) | yabbattle | Opens the YabAI Battle game in a web browser. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Queries<hr/> 
NAME
    ConvertTo-Uris
    
SYNOPSIS
    Parses strings for any valid URI.
    
    
SYNTAX
    ConvertTo-Uris [[-Text] <String[]>] [<CommonParameters>]
    
    
DESCRIPTION
    Extracts all valid URIs from input text, supporting standard and custom URI
    schemes like http:, https:, ftp:, magnet:, about:, etc. Returns Uri objects for
    each valid URI found.
    

PARAMETERS
    -Text <String[]>
        One or more text strings that may contain URIs to parse.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue)
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > ConvertTo-Uris -Text "Check out https://github.com and about:config"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > "Visit http://example.com" | ConvertTo-Uris
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Invoke-WebbrowserTabPollingScript
    
SYNOPSIS
    Executes a background polling script in a previously selected webbrowser tab.
    
    
SYNTAX
    Invoke-WebbrowserTabPollingScript [[-Scripts] <Object[]>] [[-InitialUrl] <String>] [[-Callback] <ScriptBlock>] [<CommonParameters>]
    
    
DESCRIPTION
    Continuously executes JavaScript in a browser tab and processes results through
    an optional callback. The script runs in a separate thread to prevent blocking.
    

PARAMETERS
    -Scripts <Object[]>
        JavaScript code, URLs, or file paths to execute in the browser tab.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -InitialUrl <String>
        Optional URL to navigate to before starting the polling process.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Callback <ScriptBlock>
        Optional scriptblock that processes results after each poll iteration.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        Requires Windows 10 or later.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Invoke-WebbrowserTabPollingScript -Scripts "console.log('polling')" `
        -InitialUrl "https://example.com" `
        -Callback { Write-Host "Polled" }
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-AllPossibleQueries
    
SYNOPSIS
    Opens all possible query types for given search terms or URLs.
    
    
SYNTAX
    Open-AllPossibleQueries [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-ShowWindow] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
    Executes all cmdlets that handle webpage queries, processing both URLs and search
    terms. For URLs, it performs site-specific queries, and for search terms it
    executes general web queries. This function dynamically discovers and executes
    all available query cmdlets from the GenXdev.Queries module family.
    

PARAMETERS
    -Queries <String[]>
        The search terms or URLs to query. Can be provided as strings or URLs.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default
        browser is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
        monitor, defaults to -1, no positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ShowWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-AllPossibleQueries -Queries "powershell scripting" -Monitor 0
    
    Opens all possible query types for "powershell scripting" on the default monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > qq "https://github.com" -m -1
    
    Opens all possible query types for the GitHub URL using alias and short parameters.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-AllPossibleTextQueries
    
SYNOPSIS
    Executes all Text query Cmdlets in parallel and displays results.
    
    
SYNTAX
    Open-AllPossibleTextQueries [-Queries] <String[]> [<CommonParameters>]
    
    
DESCRIPTION
    Executes all Text query Cmdlets in parallel and shows the results for each
    query. This function processes URLs and text queries differently, providing
    appropriate information for each type.
    

PARAMETERS
    -Queries <String[]>
        One or more queries to perform. Can be URLs or text queries.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-AllPossibleTextQueries -Queries "powershell scripting"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > qqq "https://github.com"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Queries.AI<hr/> 
NAME
    Open-BingCopilotQuery
    
SYNOPSIS
    Opens a Bing CoPilot query in a webbrowser
    
    
SYNTAX
    Open-BingCopilotQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-ShowWindow] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
    Opens a Bing CoPilot query in the webbrowser. The function automatically types
    the query and submits it using the underlying Open-WebsiteAndPerformQuery
    function. This provides a convenient way to interact with Microsoft Copilot
    from PowerShell.
    

PARAMETERS
    -Queries <String[]>
        The query text to submit to Bing Copilot.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser
        is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
        monitor, defaults to -1, no positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ShowWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-BingCopilotQuery -Queries "How to write better PowerShell functions?"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > aibc "What is the capital of France?"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-ChatGPTQuery
    
SYNOPSIS
    Opens a ChatGPT query in a web browser.
    
    
SYNTAX
    Open-ChatGPTQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-ShowWindow] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
    Opens ChatGPT in a web browser, automatically enters the specified query and
    submits it. Supports multiple queries that will be executed using the
    underlying Open-WebsiteAndPerformQuery function. This function provides a
    convenient way to interact with OpenAI's ChatGPT from PowerShell with extensive
    browser configuration options.
    

PARAMETERS
    -Queries <String[]>
        One or more queries to submit to ChatGPT. Can be provided as strings or from
        pipeline input.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser
        is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
        monitor, defaults to -1, no positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ShowWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-ChatGPTQuery -Queries "What is PowerShell?", "How do I use functions?"
    
    Submit multiple queries using full parameter name.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > "What is PowerShell?" | aicgpt
    
    Submit a query using alias and pipeline.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-CloudLLMChat
    
SYNOPSIS
    Opens a cloud LLM chat interface for AI queries.
    
    
SYNTAX
    Open-CloudLLMChat [-Queries] <String[]> [[-EndPoint] <String>] [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-ShowWindow] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    This function provides a unified interface to open various cloud-based AI chat
    services in a web browser. It supports multiple AI platforms including ChatGPT,
    BingCopilot, Google Gemini, X Grok, DeepSearch, and GitHub Copilot. The
    function automatically selects the appropriate endpoint-specific function and
    passes through all relevant parameters for browser configuration and window
    positioning.
    

PARAMETERS
    -Queries <String[]>
        One or more queries to submit to the selected AI service. Can be provided as
        strings or from pipeline input.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -EndPoint <String>
        The AI service endpoint to use for the query. Supported values are:
        BingCopilot, ChatGPT, DeepSearch, GithubCopilot, GoogleGemini, XGrok.
        
        Required?                    false
        Position?                    2
        Default value                XGrok
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default
        browser is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
        monitor, defaults to -1, no positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ShowWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-CloudLLMChat -Queries "How to write better PowerShell functions?" -EndPoint "ChatGPT"
    
    Opens ChatGPT and submits the query about PowerShell functions.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > ask "What is machine learning?" -EndPoint "GoogleGemini"
    
    Uses the alias to ask Google Gemini about machine learning.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > "PowerShell", "Python", "JavaScript" | Open-CloudLLMChat -EndPoint "XGrok" -Monitor 0
    
    Processes multiple queries through X Grok on the default monitor.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-DeepSearchQuery
    
SYNOPSIS
    Opens a DeepSeek query in a webbrowser
    
    
SYNTAX
    Open-DeepSearchQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-ShowWindow] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
    Opens a DeepSeek query in the webbrowser, types in the query and presses enter
    to execute the search. This function leverages the DeepSeek AI search engine
    to provide intelligent answers and insights for the provided queries.
    

PARAMETERS
    -Queries <String[]>
        One or more queries to perform on DeepSeek. Each query will be processed
        individually and sent to the DeepSeek AI search interface.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results. This affects the browser's
        accept-lang header and influences the language of the search results.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode for enhanced privacy during the
        search session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed to ensure
        proper browser automation functionality.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default
        browser is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers simultaneously.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
        monitor, defaults to -1, no positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode for distraction-free searching.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ShowWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls for a cleaner search interface.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions during the search session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker to allow search-related popups.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header for localized search results.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus after opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browser process.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys to the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        Remove window borders and title bar for a cleaner appearance.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        Use alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        Clear alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        Store settings only in persistent preferences without affecting session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        Position browser window either fullscreen on different monitor than PowerShell,
        or side by side with PowerShell on the same monitor.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-DeepSearchQuery -Queries "powershell function"
    
    Opens DeepSeek and searches for "powershell function" using default settings.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > aideepseek "powershell function"
    
    Uses the alias to search for "powershell function" with default parameters.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > Open-DeepSearchQuery -Queries "machine learning basics" -Monitor 0 -FullScreen
    
    Opens DeepSeek in fullscreen mode on the primary monitor to search for
    "machine learning basics".
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-GithubCopilotQuery
    
SYNOPSIS
    Opens a Github CoPilot query in a webbrowser
    
    
SYNTAX
    Open-GithubCopilotQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-ShowWindow] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [-PassThru] [<CommonParameters>]
    
    
DESCRIPTION
    Opens a Github CoPilot query in the webbrowser and automatically enters the
    specified query. The function waits for the page to load before typing the
    query. This function uses the underlying Open-WebsiteAndPerformQuery function
    to handle browser automation and provides a convenient way to interact with
    GitHub Copilot from PowerShell with extensive browser configuration options.
    

PARAMETERS
    -Queries <String[]>
        One or more queries to perform in Github CoPilot
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to -1, no positioning
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ShowWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet GenXdev.Windows\Send-Key
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-GithubCopilotQuery -Queries "How to implement bubble sort in C#"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > aigc "implement binary search"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-GoogleGeminiQuery
    
SYNOPSIS
    Opens a Google Gemini query in a webbrowser
    
    
SYNTAX
    Open-GoogleGeminiQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-ShowWindow] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [-PassThru] [<CommonParameters>]
    
    
DESCRIPTION
    Opens a Google Gemini query in the webbrowser, automatically enters the query
    and submits it. This provides a quick way to interact with Google's Gemini AI.
    The function supports extensive browser control including monitor selection,
    window positioning, and keyboard automation features.
    

PARAMETERS
    -Queries <String[]>
        One or more queries to submit to Google Gemini.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser
        is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
        monitor, defaults to -1, no positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ShowWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-GoogleGeminiQuery -Queries "What is PowerShell?"
    
    Opens Google Gemini and submits the query "What is PowerShell?".
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > "How to use arrays?" | aigg
    
    Uses the alias to submit a query about arrays via pipeline input.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-XGrokQuery
    
SYNOPSIS
    Opens a X Grok query in a webbrowser
    
    
SYNTAX
    Open-XGrokQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-ShowWindow] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
    Opens a X Grok query in the webbrowser, types in the query and presses enter to
    execute the search. This function provides a convenient way to interact with
    X's Grok AI assistant through automated browser control. The function supports
    extensive browser control including monitor selection, window positioning, and
    keyboard automation features.
    

PARAMETERS
    -Queries <String[]>
        One or more queries to perform on X Grok.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser
        is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
        monitor, defaults to -1, no positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ShowWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-XGrokQuery -Queries "powershell function"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > aixg "powershell function"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Queries.Text<hr/> 
NAME
    Get-NextAffirmation
    
SYNOPSIS
    Returns a random affirmation text from affirmations.dev API.
    
    
SYNTAX
    Get-NextAffirmation [[-Speak]] [<CommonParameters>]
    
    
DESCRIPTION
    Retrieves an affirmation from the affirmations.dev API and optionally speaks it
    using text-to-speech.
    

PARAMETERS
    -Speak [<SwitchParameter>]
        When specified, uses text-to-speech to speak the affirmation out loud.
        
        Required?                    false
        Position?                    1
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-NextAffirmation
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > WhatAboutIt -Speak
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-WikipediaSummary
    
SYNOPSIS
    Retrieves a summary of a topic from Wikipedia.
    
    
SYNTAX
    Get-WikipediaSummary [-Queries] <String[]> [<CommonParameters>]
    
    
DESCRIPTION
    Queries the Wikipedia API to get a concise summary of the specified topic,
    removing parenthetical content for improved readability.
    

PARAMETERS
    -Queries <String[]>
        One or more search terms to look up on Wikipedia.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Get-WikipediaSummary -Queries "PowerShell"
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > wikitxt "PowerShell", "Typescript", "C#"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Queries.Webbrowser<hr/> 
NAME
    Clear-YoutubeWatched
    
SYNOPSIS
    Clears the YouTube watch history from the browser's local storage.
    
    
SYNTAX
    Clear-YoutubeWatched [<CommonParameters>]
    
    
DESCRIPTION
    This function selects a YouTube tab in the browser and clears the watch history
    by resetting the local storage value for watched videos of the
    Open-AllYoutubeVideos -> qvideos cmdlet. It requires an open
    YouTube tab in the browser.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Clear-YoutubeWatched
    Clears the watch history of the Open-AllYoutubeVideos -> qvideos cmdlet, in the
    currently open YouTube tab.
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Copy-PDFsFromGoogleQuery
    
SYNOPSIS
    Downloads PDF files found through Google search results.
    
    
SYNTAX
    Copy-PDFsFromGoogleQuery [-Queries] <String[]> [[-Max] <Int32>] [[-Language] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Performs a Google query in the previously selected webbrowser tab and downloads
    all found PDF files into the current directory. Supports multiple queries and
    language filtering.
    

PARAMETERS
    -Queries <String[]>
        The search terms to query Google for PDF files.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Max <Int32>
        Maximum number of results to retrieve (default: 200).
        
        Required?                    false
        Position?                    2
        Default value                200
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        Optional language filter for search results.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-Webbrowser
    Select-WebbrowserTab
    $null = New-Item -ItemType Directory -Name pdfs
    Set-Location pdfs
    Copy-PDFsFromGoogleQuery "scientific paper co2" -Max 50 -Language "English"
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Get-GoogleSearchResultUrls
    
SYNOPSIS
    Performs a google search and returns the links
    
    
SYNTAX
    Get-GoogleSearchResultUrls [-Queries] <String[]> [-Max <Int32>] [-Language <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Performs a google search and returns the links
    

PARAMETERS
    -Queries <String[]>
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Max <Int32>
        The maximum number of results to obtain, defaults to 200
        
        Required?                    false
        Position?                    named
        Default value                200
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        Requires the Windows 10+ Operating System
        ##############################################################################
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>$Urls = Get-GoogleSearchResultUrls "site:github.com PowerShell module"; $Urls
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-AllGoogleLinks
    
SYNOPSIS
    Performs an infinite auto opening google search .
    
    
SYNTAX
    Open-AllGoogleLinks [-Queries] <String[]> [-Language <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Performs a google search .
    Opens 10 tabs each times, pauses until initial tab is revisited
    Close initial tab to stop
    

PARAMETERS
    -Queries <String[]>
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        Requires the Windows 10+ Operating System
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>
    
    Open-AllGoogleLinks "site:github.com PowerShell module"
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-AllYoutubeVideos
    
SYNOPSIS
    Opens and controls YouTube videos in a browser window with keyboard shortcuts.
    
    
SYNTAX
    Open-AllYoutubeVideos [[-Queries] <String[]>] [-Subscriptions] [-WatchLater] [-Recommended] [-Trending] [-Private] [-Edge] [-Chrome] [-Monitor <Int32>] [-NoFullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [<CommonParameters>]
    
    
DESCRIPTION
    Opens YouTube videos matching search terms or from various YouTube sections in a
    browser window. Provides keyboard controls for video playback and navigation.
    

PARAMETERS
    -Queries <String[]>
        YouTube search terms to find videos for. Opens all videos matching each term.
        
        Required?                    false
        Position?                    1
        Default value                @('')
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Subscriptions [<SwitchParameter>]
        Opens all videos from subscribed channels.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -WatchLater [<SwitchParameter>]
        Opens all videos from the watch-later playlist.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Recommended [<SwitchParameter>]
        Opens all recommended videos from YouTube homepage.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Trending [<SwitchParameter>]
        Opens all currently trending videos on YouTube.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Use Microsoft Edge browser instead of default.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Use Google Chrome browser instead of default.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -2
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoFullScreen [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-AllYoutubeVideos -Queries "PowerShell tutorial","vscode tips" -Edge
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > qvideos "PowerShell tutorial" -e
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-BingQuery
    
SYNOPSIS
    Opens a Bing search query in a web browser.
    
    
SYNTAX
    Open-BingQuery [-Queries] <String[]> [[-Language] <String>] [-Monitor <Int32>] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-AcceptLang <String>] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-FullScreen] [-Private] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-FocusWindow] [-SetForeground] [-Maximize] [-PassThru] [-NoBorders] [-RestoreFocus] [-SideBySide] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-SessionOnly] [-ClearSession] [-SkipSession] [-NewWindow] [-ReturnURL] [-ReturnOnlyURL] [<CommonParameters>]
    
    
DESCRIPTION
    Opens one or more Bing search queries in a web browser, using configurable
    browser settings and command line switches. This function provides a
    comprehensive interface for performing Bing searches with extensive browser
    customization options including window positioning, monitor selection, private
    browsing, and keystroke automation.
    
    The function automatically URL-encodes queries and formats them for Bing's
    search API. It supports all major browsers including Edge, Chrome, and Firefox
    with features like private browsing, application mode, precise window
    management, and keystroke automation.
    

PARAMETERS
    -Queries <String[]>
        The search queries to perform on Bing. Each query is automatically URL-encoded
        and formatted for Bing's search API.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results. Supports a wide range of languages
        including standard languages like English, Spanish, French, as well as
        specialized variants like "Bork, bork, bork!" and "Klingon".
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to display the browser on:
        0 = default monitor
        -1 = discard window positioning
        -2 = configured secondary monitor
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header for localized search results.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens the search in Microsoft Edge browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens the search in Google Chrome browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens the search in Microsoft Edge or Google Chrome, depending on which is
        set as the default browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens the search in Mozilla Firefox browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens the search in all registered modern browsers simultaneously.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens the browser in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens the browser in incognito/private browsing mode for anonymous searching.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls for a distraction-free search experience.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions during the search session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker to allow search-related popups.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening the search.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the browser window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a PowerShell process object representing the browser process.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        Removes the borders of the window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus after opening the search.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        Will either set the window fullscreen on a different monitor than Powershell,
        or side by side with Powershell on the same monitor.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the browser window after opening. Uses the same format
        as the GenXdev.Windows\Send-Key cmdlet.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keystrokes to the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keystrokes.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        Use alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        Clear alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        Store settings only in persistent preferences without affecting session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the formatted search URL.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the formatted search URL.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-BingQuery -Queries "PowerShell scripting" -Monitor 0
    
    Opens a Bing search for "PowerShell scripting" on the default monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > bq "PowerShell scripting" -m 0
    
    Opens a Bing search using the alias and short parameter names.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > Open-BingQuery -Queries "machine learning" -Language "English" -Private
    
    Opens a private browsing session to search for "machine learning" with
    English language results.
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > "PowerShell", "automation", "scripting" | Open-BingQuery -All -Left
    
    Searches for multiple terms via pipeline and opens results in all installed
    browsers, positioning windows on the left side of the screen.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-BuiltWithSiteInfo
    
SYNOPSIS
    Opens BuiltWith website queries in a web browser.
    
    
SYNTAX
    Open-BuiltWithSiteInfo [-Queries] <String[]> [[-Language] <String>] [[-Monitor] <Int32>] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyDelayMilliSeconds <Int32>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-FullScreen] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-FocusWindow] [-SetForeground] [-PassThru] [-SideBySide] [-NewWindow] [-Maximize] [-NoBorders] [-RestoreFocus] [-ReturnURL] [-ReturnOnlyURL] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
    Opens a BuiltWith query in a web browser, with configurable monitor settings and
    browser behavior options. The function analyzes website technology stacks by
    querying BuiltWith.com's technology profiling service, which provides detailed
    information about web technologies, frameworks, and services used by websites.
    
    BuiltWith.com is a comprehensive technology lookup service that identifies web
    technologies, frameworks, content management systems, analytics tools, hosting
    providers, and other software components used by any website. This function
    provides a PowerShell interface to quickly analyze technology stacks without
    manually navigating to the BuiltWith website.
    

PARAMETERS
    -Queries <String[]>
        The website URLs or domains to query on BuiltWith.com. Accepts both domain names
        (e.g., "microsoft.com") and full URLs (e.g., "https://microsoft.com"). Multiple
        queries can be processed via pipeline input or comma-separated values.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results. This sets the browser's accept-lang
        header to display BuiltWith results in the specified language if supported.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
        monitor, defaults to -1, no positioning.
        
        Required?                    false
        Position?                    3
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        Will either set the window fullscreen on a different monitor than Powershell, or
        side by side with Powershell on the same monitor.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        Removes the borders of the window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        Use alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        Clear alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        Store settings only in persistent preferences without affecting session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-BuiltWithSiteInfo -Queries "microsoft.com" -Monitor 0
    
    Opens a BuiltWith technology analysis for Microsoft.com on the default monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > "microsoft.com" | Open-BuiltWithSiteInfo -m -1
    
    Analyzes Microsoft.com using pipeline input with monitor positioning discarded.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-GithubQuery
    
SYNOPSIS
    Opens a Github repository search query in a web browser.
    
    
SYNTAX
    Open-GithubQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
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
    

PARAMETERS
    -Queries <String[]>
        The search queries to perform on Github repositories. Supports multiple
        queries and pipeline input for batch searching. Each query will be
        URL-encoded and used to search Github repositories.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        Optional programming language filter for the search results. This will be
        automatically converted to the appropriate accept-lang header if not
        explicitly overridden. Supports a comprehensive list of language options.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens the browser in private/incognito browsing mode for anonymous searching.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens the search results in Microsoft Edge browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens the search results in Google Chrome browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens the search results in Microsoft Edge or Google Chrome, depending on
        what the default browser is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens the search results in Mozilla Firefox browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens the search results in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to display results on. 0 = default, -1 = discard, -2 = secondary.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens the browser in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the browser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the browser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the browser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the browser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker in the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        Remove window borders and title bar for a cleaner appearance.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        Place browser window side by side with PowerShell on the same monitor.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        Use alternative settings stored in session for preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        Clear alternative settings stored in session for preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        Store settings only in persistent preferences without affecting session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-GithubQuery -Queries "powershell module" -Language "PowerShell"
    
    Opens a search for PowerShell modules in Github with language filtering.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > qgithub "azure functions" -Monitor 0
    
    Opens a search for Azure Functions on the primary monitor using the alias.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-GoogleQuery
    
SYNOPSIS
    Opens Google queries in a web browser with configurable settings and extensive
    customization options.
    
    
SYNTAX
    Open-GoogleQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
    Opens one or more Google queries in a web browser with comprehensive support
    for multiple languages, monitor selection, window positioning, browser
    selection, and keyboard automation. The function provides a feature-rich
    interface for performing Google searches with precise control over browser
    behavior and appearance.
    
    Key features include:
    - Support for 100+ languages via Google's language filtering
    - Multi-monitor support with automatic or manual monitor selection
    - Window positioning (left, right, top, bottom, centered, fullscreen)
    - Private/incognito browsing mode support
    - Application mode for distraction-free browsing
    - Extension and popup blocking options
    - Focus management and window manipulation
    - Batch query processing with pipeline support
    - Keystroke automation to browser windows
    - Smart parameter pass-through to underlying browser functions
    
    The function automatically formats search queries for Google's search engine
    and applies language filtering when specified. All browser positioning and
    management features are inherited from the underlying Open-Webbrowser function.
    

PARAMETERS
    -Queries <String[]>
        The search terms to query on Google. Supports multiple queries via pipeline
        input or array specification. Each query is automatically URL-encoded for
        safe transmission to Google's search servers.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language for Google search results. Supports over 100 languages including
        major world languages, regional dialects, and specialty languages like
        Klingon and Pirate. The language setting affects both the search interface
        and result filtering.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens the browser in private/incognito browsing mode. Uses InPrivate for
        Edge and incognito for Chrome to prevent search history retention.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Forces enabling of the debugging port by stopping existing browser instances
        if needed. Useful when browser automation features are required.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Specifically opens queries in Microsoft Edge browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Specifically opens queries in Google Chrome browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens queries in either Microsoft Edge or Google Chrome, depending on which
        is set as the default browser. Prefers Chromium-based browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Specifically opens queries in Mozilla Firefox browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens the specified queries in all installed modern browsers simultaneously.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use for window placement:
        - 0 = Primary monitor
        - -1 = Discard positioning (no window management)
        - -2 = Configured secondary monitor
        Defaults to -1 for fast query execution without positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens the browser in fullscreen mode using F11 key simulation.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the browser window in pixels. When not specified,
        uses the monitor's working area width or half-width for side positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the browser window in pixels. When not specified,
        uses the monitor's working area height or half-height for top/bottom
        positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X coordinate for window placement. When not specified, uses
        the monitor's left edge. Can be specified relative to the selected monitor.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y coordinate for window placement. When not specified, uses
        the monitor's top edge. Can be specified relative to the selected monitor.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Positions the browser window on the left half of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Positions the browser window on the right half of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Positions the browser window on the top half of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Positions the browser window on the bottom half of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Centers the browser window on the screen using 80% of the screen dimensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hides browser controls for a distraction-free search experience. Creates an
        app-like interface for focused research.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevents loading of browser extensions during the search session. Uses safe
        mode for Firefox and --disable-extensions for Chromium browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disables the browser's popup blocking functionality to allow search-related
        popups and advertisements.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Sets the browser's Accept-Language HTTP header for internationalization.
        Overrides the language parameter when both are specified.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the browser window after opening the search. Uses the
        same format as the GenXdev.Windows\Send-Key cmdlet for automation.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escapes control characters when sending keystrokes to the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevents returning keyboard focus to PowerShell after sending keystrokes
        to the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Uses Shift+Enter instead of regular Enter for line breaks when sending
        keystrokes to the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds. Useful for
        slower systems or complex automation scenarios.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Gives focus to the browser window after opening the search.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Brings the browser window to the foreground after opening the search.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximizes the browser window after positioning for full-screen search
        experience.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Returns focus to the PowerShell window after opening the browser. Useful
        for automated workflows where you want to continue working in PowerShell.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Forces creation of a new browser window instead of reusing existing windows
        for each search query.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a PowerShell process object representing the browser process for
        further automation or monitoring.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open the web browser, just return the formatted Google search URL
        for the query without launching any browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening the web browser with the search, return the formatted Google
        search URL. Useful for logging or further processing.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-GoogleQuery -Queries "PowerShell scripting" -Language "English" -Monitor 0
    
    Opens a Google search for "PowerShell scripting" in English on the primary
    monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > q "machine learning algorithms" -m 2 -fs
    
    Opens a Google search for "machine learning algorithms" in fullscreen mode
    on monitor 2 using aliases.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > "PowerShell", "Python", "JavaScript" | Open-GoogleQuery -Language "English" -Chrome
    
    Opens multiple Google searches in Chrome via pipeline input, each in English.
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > Open-GoogleQuery -Queries "artificial intelligence" -Private -NewWindow
    
    Opens a private browsing search for "artificial intelligence" in a new window.
    
    
    
    
    -------------------------- EXAMPLE 5 --------------------------
    
    PS > Open-GoogleQuery -Queries "web development" -ApplicationMode -Centered
    
    Opens a search in application mode (no browser controls) centered on screen.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-GoogleSiteInfo
    
SYNOPSIS
    Opens Google site information queries in a web browser.
    
    
SYNTAX
    Open-GoogleSiteInfo [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [<CommonParameters>]
    
    
DESCRIPTION
    Opens multiple Google search queries related to site information (site:, link:,
    related:) in a web browser for the specified domain(s).
    

PARAMETERS
    -Queries <String[]>
        The domain names to query for site information.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to display the browser on. 0 = default, -1 = discard,
        -2 = configured secondary monitor.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-GoogleSiteInfo -Queries "example.com" -Monitor 0
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > "example.com" | Open-GoogleSiteInfo -mon -1
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-IMDBQuery
    
SYNOPSIS
    Opens an IMDB search query in a web browser.
    
    
SYNTAX
    Open-IMDBQuery [-Queries] <String[]> [[-Language] <String>] [-Monitor <Int32>] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-AcceptLang <String>] [-KeysToSend <String[]>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-FullScreen] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
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
    

PARAMETERS
    -Queries <String[]>
        The search terms to query on IMDB. Can be movie titles, actor names, TV show
        names, or any other entertainment-related search terms. Accepts multiple
        queries and pipeline input for batch processing.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results. When specified, sets the browser's
        Accept-Language header to display IMDB results in the selected language.
        Supports a wide range of languages including major world languages and some
        novelty options.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to display the browser on. 0 = default, -1 is discard,
        -2 = Configured secondary monitor. Supports multi-monitor setups for
        optimal viewing experience.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window in pixels. When not specified,
        uses the monitor's working area width or appropriate sizing based on
        positioning options.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window in pixels. When not specified,
        uses the monitor's working area height or appropriate sizing based on
        positioning options.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window. When not specified, uses
        the monitor's left edge. Can be specified relative to the selected monitor.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window. When not specified, uses
        the monitor's top edge. Can be specified relative to the selected monitor.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header for internationalization. Overrides
        the Language parameter when both are specified. Useful for testing IMDB
        in different languages.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window after opening. Uses the same format
        as the GenXdev.Windows\Send-Key cmdlet. Useful for automating browser
        interactions after opening IMDB search results.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode. Useful for searching without
        affecting browser history or cookies.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed. Required
        for certain browser automation scenarios.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default
        browser is configured to be.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers simultaneously.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode for immersive IMDB browsing experience.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls for a distraction-free IMDB experience.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions for cleaner IMDB browsing.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disables the browser's popup blocking functionality.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening the IMDB search.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning for optimal viewing.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus after opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one for each
        IMDB search.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess for
        further automation or monitoring.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the constructed IMDB search URL.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the constructed IMDB search URL.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escapes control characters when sending keystrokes to the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevents returning keyboard focus to PowerShell after sending keystrokes.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Uses Shift+Enter instead of regular Enter for line breaks when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-IMDBQuery -Queries "The Matrix" -Monitor 0
    
    Opens an IMDB search for "The Matrix" on the default monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > imdb "The Matrix" -m 0
    
    Opens an IMDB search for "The Matrix" using the alias and shorthand parameters.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > "Inception", "Interstellar" | Open-IMDBQuery -Language "French" -Chrome
    
    Searches for multiple movies on IMDB with French language results in Chrome.
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > Open-IMDBQuery -Queries "Tom Hanks" -FullScreen -RestoreFocus
    
    Searches for Tom Hanks on IMDB in fullscreen mode, then returns focus to
    PowerShell.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-InstantStreetViewQuery
    
SYNOPSIS
    Opens InstantStreetView queries in a web browser.
    
    
SYNTAX
    Open-InstantStreetViewQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-NoBorders] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
    Opens InstantStreetView queries in a configurable manner using web browser
    command line switches. Supports multiple queries and monitor selection.
    Provides comprehensive browser control including window positioning, language
    settings, and browser-specific features.
    
    The function automatically constructs InstantStreetView URLs by URL-encoding
    location queries and opening them in the specified browser. Supports all
    major browsers including Edge, Chrome, and Firefox with extensive
    customization options.
    

PARAMETERS
    -Queries <String[]>
        The location queries to view in InstantStreetView. Accepts multiple queries
        and supports pipeline input.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results. Automatically sets the
        Accept-Language HTTP header if not explicitly specified.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode. Uses InPrivate for Edge and
        incognito for Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default
        browser is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
        monitor, defaults to -1, no positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-InstantStreetViewQuery -Queries "Times Square, New York" -Monitor 0
    
    Opens InstantStreetView for Times Square in the default browser on the
    primary monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > isv "Eiffel Tower, Paris" -mon -2
    
    Opens InstantStreetView for the Eiffel Tower using the alias 'isv' and
    displays on the secondary monitor.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > Open-InstantStreetViewQuery -Queries "Big Ben, London" -Language "English" -Private
    
    Opens InstantStreetView for Big Ben in English language using private
    browsing mode.
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > "Central Park, New York", "Golden Gate Bridge, San Francisco" | isv -Chrome -Left
    
    Opens multiple InstantStreetView queries via pipeline in Chrome browser
    positioned on the left side of the screen.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-MovieQuote
    
SYNOPSIS
    Opens a video of a movie quote in a web browser.
    
    
SYNTAX
    Open-MovieQuote [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-ReturnURL] [-ReturnOnlyURL] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
    Searches for and opens movie quotes using playphrase.me, allowing specification
    of monitor and browser settings. This function provides access to an extensive
    database of movie quotes with video clips, supporting multiple languages and
    advanced browser configuration options.
    
    Key features:
    - Search movie quotes from an extensive database
    - Multi-language support with automatic language detection
    - Advanced browser positioning and window management
    - Support for multiple browsers (Edge, Chrome, Firefox)
    - Private browsing mode support
    - Keyboard automation for browser interaction
    - Multi-monitor support with precise positioning
    

PARAMETERS
    -Queries <String[]>
        The movie quote or phrase to search for. Supports multiple queries via
        pipeline input or array specification.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results. Supports over 100 languages
        including common ones like English, Spanish, French, German, etc.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default
        browser is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to display the browser on. 0 = default, -1 = discard,
        -2 = configured secondary monitor.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-MovieQuote -Queries "I'll be back"
    
    Opens a search for the famous Terminator quote "I'll be back".
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Open-MovieQuote -Queries "Here's looking at you kid" -Monitor 1
    
    Opens a search for the Casablanca quote on monitor 1.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > moviequote "May the Force be with you" -Language "English" -Private
    
    Opens a search for the Star Wars quote in English using private browsing.
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > "I'll be back", "Frankly, my dear" | Open-MovieQuote -Chrome -FullScreen
    
    Opens multiple movie quote searches in Chrome fullscreen mode via pipeline.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-SearchEngine
    
SYNTAX
    Open-SearchEngine [-Queries] <string[]> [[-EndPoint] {Bing | Github | Google | IMDB | InstantStreetView | StackOverflow | Wikipedia | WikipediaNL | WolframAlpha | Youtube}] [[-Language] {Afrikaans | Akan | Albanian | Amharic | Arabic | Armenian | Azerbaijani | Basque | Belarusian | Bemba | Bengali | Bihari | Bork, bork, bork! | Bosnian | Breton | Bulgarian | Cambodian | Catalan | Cherokee | Chichewa | Chinese (Simplified) | Chinese (Traditional) | Corsican | Croatian | Czech | Danish | Dutch | Elmer Fudd | English | Esperanto | Estonian | Ewe | Faroese | Filipino | Finnish | French | Frisian | Ga | Galician | Georgian | German | Greek | Guarani | Gujarati | Hacker | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo | Indonesian | Interlingua | Irish | Italian | Japanese | Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala | Lithuanian | Lozi | Luganda | Luo | Macedonian | Malagasy | Malay | Malayalam | Maltese | Maori | Marathi | Mauritian Creole | Moldavian | Mongolian | Montenegrin | Nepali | Nigerian Pidgin | Northern Sotho | Norwegian | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto | Persian | Pirate | Polish | Portuguese (Brazil) | Portuguese (Portugal) | Punjabi | Quechua | Romanian | Romansh | Runyakitara | Russian | Scots Gaelic | Serbian | Serbo-Croatian | Sesotho | Setswana | Seychellois Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian | Somali | Spanish | Spanish (Latin American) | Sundanese | Swahili | Swedish | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi | Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish | Yoruba | Zulu}] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <int>] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <string>] [-KeysToSend <string[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [<CommonParameters>]
    
    
PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -All
        Opens in all registered modern browsers
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Centered
        Place browser window in the center of the screen
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Chrome
        Opens in Google Chrome
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ch
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Chromium
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      c
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Edge
        Opens in Microsoft Edge
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      e
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -EndPoint <string>
        The enpoint to invoke the query on
        
        Required?                    false
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Firefox
        Opens in Firefox
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      ff
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -FocusWindow
        Focus the browser window after opening
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Force
        Force enable debugging port, stopping existing browsers if needed
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -KeysToSend <string[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet GenXdev.Windows\Send-Key
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Language <string>
        The language of the returned search results
        
        Required?                    false
        Position?                    2
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
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Maximize
        Maximize the window after positioning
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to -1, no positioning
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -NewWindow
        Don't re-use existing browser window, instead, create a new one
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      nw, new
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -NoBrowserExtensions
        Prevent loading of browser extensions
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Private
        Opens in incognito/private browsing mode
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Queries <string[]>
        The query to execute.
        
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Parameter set name           (All)
        Aliases                      q, Name, Text, Query
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -RestoreFocus
        Restore PowerShell window focus
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      rf, bg
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -ReturnOnlyURL
        After opening webbrowser, return the url
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -ReturnURL
        Don't open webbrowser, just return the url
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Right
        Place browser window on the right side of the screen
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -SetForeground
        Set the browser window to foreground after opening
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Top
        Place browser window on the top side of the screen
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Width <int>
        The initial width of the webbrowser window
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -X <int>
        The initial X position of the webbrowser window
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    -Y <int>
        The initial Y position of the webbrowser window
        
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
    
INPUTS
    System.String[]
    
    
OUTPUTS
    System.Object
    
ALIASES
    q
    

REMARKS
    None 

<br/><hr/><hr/><br/>
 
NAME
    Open-SimularWebSiteInfo
    
SYNOPSIS
    Opens SimilarWeb website information for specified URLs in a web browser.
    
    
SYNTAX
    Open-SimularWebSiteInfo [-Queries] <String[]> [[-Language] <String>] [-Monitor <Int32>] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-FullScreen] [-Private] [-NoBorders] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
    Opens a "Similar web" query in a web browser in a configurable manner using
    command line switches. Allows checking website analytics and comparisons for
    website traffic analysis, competitor research, and digital marketing insights.
    

PARAMETERS
    -Queries <String[]>
        The website URLs to analyze on SimilarWeb. Can be provided as domain names
        (e.g., "google.com") or full URLs. Multiple queries can be processed through
        pipeline input or array parameters.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language for SimilarWeb interface localization. Automatically sets the
        browser's Accept-Language header when specified.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use for displaying the browser window:
        - 0 = Primary monitor (default)
        - -1 = Discard positioning (fastest launch)
        - -2 = Configured secondary monitor
        - 1+ = Specific monitor number
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the browser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the browser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X coordinate for window placement.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y coordinate for window placement.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Positions the browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Positions the browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Positions the browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Positions the browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Centers the browser window on the screen for optimal viewing.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens the browser in fullscreen mode for distraction-free analysis.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens the browser in private/incognito browsing mode for anonymous analysis.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        Removes the borders of the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens the analysis in Microsoft Edge browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens the analysis in Google Chrome browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on default browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens the analysis in Mozilla Firefox browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens the analysis in all registered modern browsers simultaneously.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hides browser controls for a clean analysis interface.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevents loading of browser extensions for faster performance.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disables the browser's popup blocking functionality.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Sets the browser's Accept-Language HTTP header for localization.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the browser window after opening. Uses the same
        format as the GenXdev.Windows\Send-Key cmdlet.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escapes control characters when sending keystrokes to the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevents returning keyboard focus to PowerShell after sending keystrokes.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Uses Shift+Enter instead of regular Enter for line breaks when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Gives focus to the browser window after opening the analysis.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Brings the browser window to the foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximizes the browser window after positioning for full-screen analysis.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Returns focus to the PowerShell window after opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Forces creation of a new browser window for each analysis.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a PowerShell process object representing the browser process.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Returns the formatted SimilarWeb URL without opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        Returns the formatted SimilarWeb URL after opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        Use alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        Clear alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        Store settings only in persistent preferences without affecting session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-SimularWebSiteInfo -Queries "google.com" -Monitor 0
    
    Opens a SimilarWeb analysis for Google.com on the primary monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > simularsite google.com -mon 0
    
    Opens a SimilarWeb analysis using the function alias with monitor positioning.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > "microsoft.com", "apple.com" | Open-SimularWebSiteInfo -Language "English" -Centered
    
    Analyzes multiple websites through pipeline input with centered window positioning.
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > Open-SimularWebSiteInfo -Queries "github.com" -ReturnURL
    
    Returns the SimilarWeb URL for GitHub without opening the browser.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-StackOverflowQuery
    
SYNOPSIS
    Opens Stack Overflow search queries in a web browser.
    
    
SYNTAX
    Open-StackOverflowQuery [-Queries] <String[]> [[-Language] <String>] [-Monitor <Int32>] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-AcceptLang <String>] [-KeysToSend <String[]>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
    Opens one or more Stack Overflow search queries in a web browser with
    comprehensive browser and display configuration options. This function provides
    an advanced wrapper around Stack Overflow search functionality with extensive
    options for window positioning, browser selection, and behavior customization.
    
    Key features:
    - Multiple search query support with pipeline input
    - Smart browser detection and selection (Edge, Chrome, Firefox, all browsers)
    - Advanced window positioning (left, right, top, bottom, centered, fullscreen)
    - Multi-monitor support with automatic or manual monitor selection
    - Private/incognito browsing mode support
    - Application mode for distraction-free browsing
    - Language localization support for international search results
    - Extension and popup blocking options
    - Focus management and window manipulation
    - Keystroke automation to browser windows
    - URL return options for automation workflows
    
    The function automatically detects system capabilities and adjusts behavior
    accordingly. For browsers not installed on the system, operations are silently
    skipped without errors.
    

PARAMETERS
    -Queries <String[]>
        The search queries to perform on Stack Overflow. Accepts pipeline input and
        supports multiple queries in a single operation. Each query is URL-encoded
        and submitted as a separate Stack Overflow search.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results. Accepts a comprehensive list of
        languages and automatically sets the appropriate Accept-Language header for
        localized search results.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to display results on:
        - 0 = Primary monitor
        - -1 = Discard positioning (no window positioning)
        - -2 = Configured secondary monitor (uses $Global:DefaultSecondaryMonitor)
        - 1+ = Specific monitor number
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the browser window in pixels. When not specified, uses
        the monitor's working area width or half-width for side positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the browser window in pixels. When not specified, uses
        the monitor's working area height or half-height for top/bottom positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the browser window. When not specified, uses the
        monitor's left edge. Can be specified relative to the selected monitor.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the browser window. When not specified, uses the
        monitor's top edge. Can be specified relative to the selected monitor.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header. Overrides the Language parameter
        when both are specified.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the browser window after opening. Uses the same format
        as the GenXdev.Windows\Send-Key cmdlet for automation scenarios.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode. Uses InPrivate for Edge and
        incognito for Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed. Useful
        when browser debugging features are required.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default
        browser is. Prefers Chromium-based browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers simultaneously.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode using F11 key simulation.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls for a distraction-free search experience.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions during the search session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker to allow search-related popups.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening the search.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning for full-screen search experience.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus after opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one for each
        search query.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browser process for
        further automation or monitoring.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the formatted Stack Overflow search URL
        for the query without launching any browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the formatted Stack Overflow search URL.
        Useful for logging or further processing.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keystrokes to the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keystrokes to
        the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks when sending
        keystrokes to the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds. Useful for
        slower systems or complex automation scenarios.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-StackOverflowQuery -Queries "powershell array" -Monitor 0
    
    Opens a Stack Overflow search for "powershell array" on the primary monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > qso "powershell array" -mon 0
    
    Opens a Stack Overflow search using the alias with monitor positioning.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > "powershell", "array manipulation" | Open-StackOverflowQuery -Language "English" -Chrome
    
    Opens multiple Stack Overflow searches in Chrome with English language preference.
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > Open-StackOverflowQuery -Queries "c# linq" -ReturnURL
    
    Returns the Stack Overflow search URL without opening a browser.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-WaybackMachineSiteInfo
    
SYNOPSIS
    Opens WaybackMachine site information in a web browser.
    
    
SYNTAX
    Open-WaybackMachineSiteInfo [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-ReturnURL] [-ReturnOnlyURL] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
    Opens a Waybackmachine query in a web browser, displaying historical versions
    of the specified URL or website. Supports multiple queries and monitor
    selection. Provides access to archived web content through the Internet
    Archive's Wayback Machine service.
    

PARAMETERS
    -Queries <String[]>
        The URL or website addresses to search in the Wayback Machine. Can be a single
        URL or multiple URLs to search for archived versions.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language preference for the browser interface. This affects the browser's
        accept-language header and helps display content in the preferred language.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens the browser in incognito or private browsing mode to prevent storing
        browsing history and cookies.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enables debugging port, stopping existing browsers if needed for
        automation purposes.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens the Wayback Machine query specifically in Microsoft Edge browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens the Wayback Machine query specifically in Google Chrome browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens the Wayback Machine query in Microsoft Edge or Google Chrome, depending
        on what the default browser is set to.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens the Wayback Machine query specifically in Mozilla Firefox browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens the Wayback Machine query in all registered modern browsers
        simultaneously.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to display the browser on. 0 = default monitor, -1 = discard
        window positioning, -2 = configured secondary monitor. Default is -1.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens the browser in fullscreen mode for an immersive viewing experience.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the browser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the browser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the browser window on the screen.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the browser window on the screen.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Places the browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Places the browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Places the browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Places the browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Places the browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hides the browser controls for a distraction-free viewing experience.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevents loading of browser extensions during the session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disables the browser's popup blocking functionality.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Sets the browser's accept-language HTTP header for internationalization.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the browser window after opening. Uses the same format
        as the GenXdev.Windows\Send-Key cmdlet.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escapes control characters when sending keystrokes to the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevents returning keyboard focus to PowerShell after sending keystrokes.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Uses Shift+Enter instead of regular Enter for line breaks when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focuses the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Sets the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximizes the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restores PowerShell window focus after opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Creates a new browser window instead of reusing existing windows.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a System.Diagnostics.Process object of the browser process.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        Removes the borders of the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        Use alternative settings stored in session for Wayback Machine preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        Clear alternative settings stored in session for Wayback Machine preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        Store settings only in persistent preferences without affecting session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Returns the URL without opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        Returns the URL after opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-WaybackMachineSiteInfo -Queries "www.example.com" -Monitor 0
    
    Opens the Wayback Machine archive for example.com on the default monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > wayback example.com -mon -1
    
    Opens the Wayback Machine archive for example.com using aliases with monitor
    positioning discarded.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > Open-WaybackMachineSiteInfo -Queries "microsoft.com" -Chrome -Private
    
    Opens the Wayback Machine archive for microsoft.com in Chrome's incognito mode.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-WebsiteAndPerformQuery
    
SYNOPSIS
    Opens a webpage in a webbrowser and performs one or more queries.
    
    
SYNTAX
    Open-WebsiteAndPerformQuery [-Url] <String> [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-Maximize] [-RestoreFocus] [-NewWindow] [-FocusWindow] [-SetForeground] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
    This function opens a website by URL in the default web browser, enters one or
    more queries and submits them. It supports extensive monitor selection and
    window positioning options through the underlying Open-Webbrowser function.
    
    The function automatically copies each query to the clipboard and sends it to
    the browser window using keyboard automation. It preserves the original
    clipboard content and restores it after all queries are processed.
    

PARAMETERS
    -Url <String>
        The URL of the website to open.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Queries <String[]>
        One or more queries to perform on the opened website.
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default
        browser is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to display the browser on. 0 = default, -1 = discard,
        -2 = configured secondary monitor.
        
        Required?                    false
        Position?                    named
        Default value                -2
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                500
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-WebsiteAndPerformQuery -Url "https://www.google.com" -Queries "PowerShell"
    
    Opens Google and searches for "PowerShell".
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > owaq google.com "PowerShell tutorials" -Monitor 0
    
    Opens Google and searches for "PowerShell tutorials" on the default monitor.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-WhoisHostSiteInfo
    
SYNOPSIS
    Opens a Whois host information query in a web browser.
    
    
SYNTAX
    Open-WhoisHostSiteInfo [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SessionOnly] [-ClearSession] [-SkipSession] [-SideBySide] [<CommonParameters>]
    
    
DESCRIPTION
    Opens Whois host information queries in a web browser for domain names or IP
    addresses. Supports configurable monitor selection and multiple queries with
    extensive browser configuration options including window positioning, browser
    selection, and automation features.
    

PARAMETERS
    -Queries <String[]>
        One or more domain names or IP addresses to look up Whois information for.
        Accepts pipeline input and supports multiple queries simultaneously.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language for the returned search results. Affects the browser's
        Accept-Language header and website localization.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens the browser in private/incognito browsing mode for enhanced privacy.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Forces enabling of the debugging port by stopping existing browser instances
        if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Specifically opens URLs in Microsoft Edge browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Specifically opens URLs in Google Chrome browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens URLs in either Microsoft Edge or Google Chrome, depending on which
        is set as the default browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Specifically opens URLs in Mozilla Firefox browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens the specified URLs in all installed modern browsers simultaneously.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        Specifies which monitor to display results on:
        0 = Default monitor
        -1 = Discard positioning
        -2 = Configured secondary monitor
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens the browser in fullscreen mode using F11 key simulation.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the browser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the browser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X coordinate for window placement.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y coordinate for window placement.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Positions the browser window on the left half of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Positions the browser window on the right half of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Positions the browser window on the top half of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Positions the browser window on the bottom half of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Centers the browser window on the screen using 80% of the screen dimensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hides browser controls for a distraction-free experience.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevents loading of browser extensions during the session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disables the browser's popup blocking functionality.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Sets the browser's Accept-Language HTTP header for internationalization.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the browser window after opening. Uses the same
        format as the GenXdev.Windows\Send-Key cmdlet.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Gives focus to the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Brings the browser window to the foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximizes the browser window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Returns focus to the PowerShell window after opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Forces creation of a new browser window instead of reusing existing windows.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a PowerShell process object representing the browser process.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Returns the formatted URL without opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        Returns the formatted URL after opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escapes control characters when sending keystrokes to the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevents returning keyboard focus to PowerShell after sending keystrokes.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Uses Shift+Enter instead of regular Enter for line breaks when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-WhoisHostSiteInfo -Queries "example.com", "example.org" -Monitor 0
    
    Opens Whois information for multiple domains on the default monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > whois example.com -m 1
    
    Opens Whois information for example.com using aliases and positional parameters.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > "microsoft.com", "google.com" | Open-WhoisHostSiteInfo -Private -Chrome
    
    Opens Whois information for domains from pipeline in Chrome private mode.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-WikipediaNLQuery
    
SYNOPSIS
    Opens Dutch Wikipedia searches in a web browser.
    
    
SYNTAX
    Open-WikipediaNLQuery [-Queries] <String[]> [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-NoBorders] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
    Opens a 'Wikipedia - The Netherlands' query in a webbrowser, with configurable
    display options. Supports searching multiple terms and specifying which monitor
    to display results on.
    

PARAMETERS
    -Queries <String[]>
        One or more search terms to look up on Dutch Wikipedia.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        Monitor to display browser on (0=default, -1=discard, -2=secondary).
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        [Alias('fw', 'focus')]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-WikipediaNLQuery -Queries "Amsterdam" -Monitor 0
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > wikinl "Amsterdam" -mon -2
    
    
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-WikipediaQuery
    
SYNOPSIS
    Opens a Wikipedia query in a webbrowser.
    
    
SYNTAX
    Open-WikipediaQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-NoBorders] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
    Opens one or more Wikipedia search queries in a web browser with extensive
    configuration options. Supports configurable browser behavior, monitor
    selection, and window positioning. Queries are URL encoded and opened using
    the specified language's Wikipedia domain with full localization support.
    
    The function provides comprehensive browser control including private browsing
    modes, window positioning, keyboard automation, and multi-monitor support.
    It automatically handles URL encoding and language code mapping for
    international Wikipedia domains.
    

PARAMETERS
    -Queries <String[]>
        One or more search terms to look up on Wikipedia. Multiple queries will open
        in separate browser instances. Supports pipeline input for batch processing.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The Wikipedia language to use for searches. Accepts full language names from
        the ValidateSet list. Automatically maps language names to Wikipedia language
        codes and sets appropriate Accept-Language headers.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode for anonymous searches.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on default browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Mozilla Firefox browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers simultaneously.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use for window placement. 0=default, -1=discard positioning,
        -2=configured secondary monitor, positive numbers=specific monitor.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode using F11 key simulation.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls for distraction-free reading.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header for language preferences.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the browser window after opening. Uses the same format
        as GenXdev.Windows\Send-Key cmdlet.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keystrokes to the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keystrokes.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus after opening browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a PowerShell process object representing the browser process.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the formatted Wikipedia URL.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the formatted Wikipedia URL.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-WikipediaQuery -Queries "PowerShell" -Monitor 0 -Language "English"
    
    Opens a Wikipedia search for "PowerShell" in English on the default monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > wiki "PowerShell" -mon 0
    
    Opens a Wikipedia search using the alias with positional parameters.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > "PowerShell", "Windows" | Open-WikipediaQuery -Language "German" -Private
    
    Searches for multiple terms in German Wikipedia using private browsing mode.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-WolframAlphaQuery
    
SYNOPSIS
    Opens a Wolfram Alpha query in a web browser.
    
    
SYNTAX
    Open-WolframAlphaQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-NoBorders] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
    Opens one or more Wolfram Alpha queries in a web browser. Supports configurable
    monitor selection and browser options through dynamic parameters. Provides
    comprehensive browser control including positioning, sizing, and automation
    capabilities for enhanced scientific computation workflows.
    

PARAMETERS
    -Queries <String[]>
        The search queries to perform on Wolfram Alpha. Accepts multiple queries that
        will be processed sequentially. Each query is URL-encoded automatically for
        safe transmission to the Wolfram Alpha service.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results. Affects the Accept-Language
        HTTP header sent to Wolfram Alpha for localized computational results.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode to prevent storage of search history
        and cookies from the Wolfram Alpha session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed for
        development and automation scenarios.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default
        browser is. Prefers Chromium-based browsers for consistent behavior.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers simultaneously for cross-browser
        testing or comparison of results.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use for display. 0 = default monitor, -1 = discard window
        positioning, -2 = configured secondary monitor. Defaults to -1 for no
        positioning constraints.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode for immersive computational exploration.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window on screen.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window on screen.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls for a distraction-free computational environment.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions for a clean computational session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker to allow Wolfram Alpha interactive elements.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header for localized computational results.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys to the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus after opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        Removes the borders of the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        Position browser window either fullscreen on different monitor than PowerShell, or side by side with PowerShell on the same monitor.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        Use alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        Clear alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        Store settings only in persistent preferences without affecting session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-WolframAlphaQuery -Queries "mass of sun" -Monitor 0
    
    Opens a Wolfram Alpha query for the mass of the sun on the default monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > qalpha "speed of light", "planck constant"
    
    Opens multiple Wolfram Alpha queries using the alias for quick scientific
    computations.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > "derivative of x^2" | Open-WolframAlphaQuery -Language "English" -FullScreen
    
    Opens a calculus query in fullscreen mode with English language preference
    via pipeline input.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-YoutubeQuery
    
SYNOPSIS
    Opens YouTube search queries in a web browser.
    
    
SYNTAX
    Open-YoutubeQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
    Opens one or more YouTube search queries in a web browser with extensive
    positioning and configuration options. Supports configurable monitor selection,
    browser settings, and keystroke automation through dynamic parameters inherited
    from Open-Webbrowser cmdlet. Each query opens in a separate browser instance
    with full control over window positioning, browser type, and search language.
    

PARAMETERS
    -Queries <String[]>
        One or more search terms to query on YouTube. Each query will open in a separate
        browser instance. Supports pipeline input for batch processing of multiple
        search terms.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        The language of the returned search results. Uses ValidateSet to ensure only
        supported languages are specified. Automatically configures browser accept-lang
        header when specified.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode. Uses InPrivate for Edge and incognito
        for Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed. Useful when
        browser debugging features are required.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser
        is. Prefers Chromium-based browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Mozilla Firefox browser specifically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers simultaneously.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use for window placement:
        - 0 = Primary monitor
        - -1 = Discard positioning
        - -2 = Configured secondary monitor
        - 1+ = Specific monitor number
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode using F11 key simulation.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window in pixels.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls for a distraction-free experience.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker in the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header for internationalization.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window after opening. Uses the same format
        as the GenXdev.Windows\Send-Key cmdlet.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus after opening the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys to the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-YoutubeQuery -Queries "PowerShell tutorial" -Monitor 0
    
    Opens a YouTube search for "PowerShell tutorial" on the default monitor.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > youtube "how to code" -m -2
    
    Opens a YouTube search for "how to code" on the configured secondary monitor
    using the function alias.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Queries.Websites<hr/> 
NAME
    Open-GameOfLife
    
SYNOPSIS
    Opens Conway's Game of Life simulation in a web browser.
    
    
SYNTAX
    Open-GameOfLife [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-NoFullScreen] [-NoApplicationMode] [-NoBorders] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
    Opens an interactive Conway's Game of Life simulation in a web browser window
    with extensive positioning and configuration options. Conway's Game of Life is
    a cellular automaton devised by mathematician John Conway in 1970, consisting
    of a grid of cells that can be in one of two states: alive or dead.
    
    This function provides comprehensive browser control including window
    positioning, browser selection, private browsing, and automated interaction
    capabilities. The simulation runs at https://conway.genxdev.net/ and supports
    various interaction modes.
    

PARAMETERS
    -Language <String>
        The language preference for the browser interface and content localization.
        Sets the Accept-Language HTTP header and determines the language code used
        for international support.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens the browser in private/incognito browsing mode for enhanced privacy.
        Uses InPrivate mode for Edge and incognito mode for Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Forces enabling of the debugging port by stopping existing browser instances
        if needed. Useful when browser debugging features are required.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Specifically opens the Game of Life in Microsoft Edge browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Specifically opens the Game of Life in Google Chrome browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens the Game of Life in either Microsoft Edge or Google Chrome, depending
        on which is set as the default browser. Prefers Chromium-based browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Specifically opens the Game of Life in Mozilla Firefox browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens the Game of Life in all installed modern browsers simultaneously.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use for window placement:
        - 0 = Primary monitor
        - -1 = Discard positioning
        - -2 = Configured secondary monitor (uses $Global:DefaultSecondaryMonitor)
        - 1+ = Specific monitor number
        
        Required?                    false
        Position?                    named
        Default value                -2
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens the browser in fullscreen mode using F11 key simulation for an
        immersive Game of Life experience.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the browser window in pixels. When not specified, uses
        the monitor's working area width or half-width for side positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the browser window in pixels. When not specified, uses
        the monitor's working area height or half-height for top/bottom positioning.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X coordinate for window placement. When not specified, uses the
        monitor's left edge. Can be specified relative to the selected monitor.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y coordinate for window placement. When not specified, uses the
        monitor's top edge. Can be specified relative to the selected monitor.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Positions the browser window on the left half of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Positions the browser window on the right half of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Positions the browser window on the top half of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Positions the browser window on the bottom half of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Centers the browser window on the screen using 80% of the screen dimensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hides browser controls for a distraction-free Game of Life experience.
        Creates an app-like interface for focused simulation viewing.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevents loading of browser extensions. Uses safe mode for Firefox and
        --disable-extensions for Chromium browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disables the browser's popup blocking functionality to allow any simulation
        popups or help windows.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Sets the browser's Accept-Language HTTP header for internationalization.
        Overrides the Language parameter when both are specified.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the browser window after opening the simulation. Uses
        the same format as the GenXdev.Windows\Send-Key cmdlet for automation.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escapes control characters when sending keystrokes to the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevents returning keyboard focus to PowerShell after sending keystrokes
        to the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Uses Shift+Enter instead of regular Enter for line breaks when sending
        keystrokes to the browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds. Useful for
        slower systems or complex automation scenarios.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Gives focus to the browser window after opening the simulation.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Brings the browser window to the foreground after opening the simulation.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximizes the browser window after positioning for full-screen Game of Life
        experience.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Returns focus to the PowerShell window after opening the browser. Useful
        for automated workflows where you want to continue working in PowerShell.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Forces creation of a new browser window instead of reusing existing windows
        for each simulation instance.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a PowerShell process object representing the browser process for
        further automation or monitoring.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open the web browser, just return the Game of Life simulation URL
        without launching any browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening the web browser with the simulation, return the URL. Useful
        for logging or further processing.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoFullScreen [<SwitchParameter>]
        Prevents the browser from opening in fullscreen mode. Overrides the default
        fullscreen behavior.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoApplicationMode [<SwitchParameter>]
        Shows the browser controls instead of hiding them. Overrides the default
        application mode behavior.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        Requires Windows 10+ Operating System.
        
        This cmdlet is designed for interactive use and performs window manipulation
        operations. Avoid touching keyboard/mouse during positioning operations.
        
        Conway's Game of Life is a zero-player game, meaning its evolution is
        determined by its initial state, requiring no further input from the user.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-GameOfLife -Monitor 1 -FullScreen
    
    Opens Conway's Game of Life in fullscreen mode on monitor 1.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > Open-GameOfLife -Language "French" -Chrome -Private
    
    Opens the Game of Life in French language using Chrome in private mode.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > gameoflife -m 0 -app
    
    Opens the Game of Life on the primary monitor in application mode using the
    alias.
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > conway -Edge -Left -Width 800 -Height 600
    
    Opens Conway's Game of Life in Microsoft Edge, positioned on the left side
    with specific dimensions.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-GenXdevAppCatalog
    
SYNOPSIS
    Opens the GenXdev progressive webapps catalog in a web browser.
    
    
SYNTAX
    Open-GenXdevAppCatalog [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-ShowWindow] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-NoFullScreen] [-NoApplicationMode] [-NoBorders] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
    Opens the catalog with published GenXdev progressive webapps in a web browser.
    Opens in application mode with fullscreen enabled by default to provide an
    optimal viewing experience for the catalog. Supports all standard web browser
    configuration options including monitor placement, window sizing, and language
    preferences.
    
    The function automatically configures the browser for the best catalog viewing
    experience and can open multiple browser instances simultaneously. It provides
    comprehensive language support and respects user preferences for browser
    selection and positioning.
    

PARAMETERS
    -Language <String>
        The language of the returned search results. Supports a comprehensive list of
        international languages including regional variants and special language options.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor,
        defaults to -1, no positioning.
        
        Required?                    false
        Position?                    named
        Default value                -2
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ShowWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoFullScreen [<SwitchParameter>]
        Don't open in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoApplicationMode [<SwitchParameter>]
        Do show the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        Removes the borders of the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        Position browser window either fullscreen on different monitor than PowerShell, or side by side with PowerShell on the same monitor.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        Use alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        Clear alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        Store settings only in persistent preferences without affecting session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-GenXdevAppCatalog -Monitor 1 -ApplicationMode -FullScreen
    
    Opens the GenXdev app catalog on monitor 1 in application mode with fullscreen
    enabled.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > appcatalog -mon 1
    
    Opens the GenXdev app catalog on monitor 1 using the alias command.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-Timeline
    
SYNOPSIS
    Opens an interactive timeline showing current time, date, century, and millennium.
    
    
SYNTAX
    Open-Timeline [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-NoFullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoApplicationMode] [-BrowserExtensions] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-SpectateOnly] [-ReturnURL] [-ReturnOnlyURL] [[-Theme] <String>] [[-Language] <String>] [-DragedNodeBackground <String>] [-FocusedNodeBackground <String>] [-FocusedNodeForeground <String>] [-UnFocusedNodeBackground <String>] [-UnFocusedNodeForeground <String>] [-BorderLightColor <String>] [-BorderDarkColor <String>] [-BorderWidth <Int32>] [-RotationDelaySeconds <Int32>] [-FullScreen] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
    Opens a web-based interactive timeline that displays temporal information in an
    artistic theme. Supports multiple languages and visual customization options.
    The timeline provides an immersive experience with artistic backgrounds inspired
    by famous artists and painters, with configurable themes and multilingual support.
    

PARAMETERS
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default browser is
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, defaults to `Global:DefaultSecondaryMonitor or 2 if not found
        
        Required?                    false
        Position?                    named
        Default value                -2
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoFullScreen [<SwitchParameter>]
        Don't open in fullscreen mode
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoApplicationMode [<SwitchParameter>]
        Do show the browser controls
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -BrowserExtensions [<SwitchParameter>]
        Don't prevent loading of browser extensions
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet GenXdev.Windows\Send-Key
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SpectateOnly [<SwitchParameter>]
        Don't start a new game, just watch the AI play
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Theme <String>
        Selects All or limit the theme to a specific one, default = PicassoPulse
        
        Required?                    false
        Position?                    1
        Default value                [All]
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Language <String>
        Override default browser language, or select [All] for rotation of all languages every minute
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DragedNodeBackground <String>
        Overwrite the css-color-style for painting the currently dragged node's background
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusedNodeBackground <String>
        Overwrite the css-color-style for painting the focused node's (In center) background
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusedNodeForeground <String>
        Overwrite the css-color-style for painting the focused node's (in center) foreground text
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -UnFocusedNodeBackground <String>
        Overwrite the css-color-style for painting the focused node's (In center) background
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -UnFocusedNodeForeground <String>
        Overwrite the css-color-style for painting the unfocused node's (in center) foreground text
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -BorderLightColor <String>
        Overwrite the default css border-light-color colorstyle
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -BorderDarkColor <String>
        Overwrite the default css border-dark-color colorstyle
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -BorderWidth <Int32>
        Overwrite the default width for painting the node borders
        
        Required?                    false
        Position?                    named
        Default value                1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RotationDelaySeconds <Int32>
        Overwrite the default width for the background rotation delay
        
        Required?                    false
        Position?                    named
        Default value                15
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-Timeline -Theme "VanGoghSkies" -Language "English"
    
    Opens an interactive timeline with Van Gogh-inspired visuals in English.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > timeline -Theme "MonetMoods" -mon 2
    
    Opens timeline with Monet theme on monitor 2 using aliases.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > Open-Timeline -Private -Chrome -FullScreen
    
    Opens timeline in Chrome incognito mode in fullscreen.
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > timeline -Theme "[All]" -Language "[All]" -Monitor 1 -Centered
    
    Opens timeline with rotating themes and languages, centered on monitor 1.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-ViralSimulation
    
SYNOPSIS
    Opens a viral simulation game in a web browser with extensive configuration
    options.
    
    
SYNTAX
    Open-ViralSimulation [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-NoFullScreen] [-NoApplicationMode] [-NoBorders] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
    Opens the viral simulation game at https://viral.genxdev.net/ in a specified
    web browser with configurable window settings, positioning, and behavior
    options. Supports multiple browsers, private browsing, application mode, and
    comprehensive window management features.
    
    The function provides an interactive viral simulation experience with features
    like:
    - Multiple browser support (Edge, Chrome, Firefox)
    - Window positioning and sizing controls
    - Full-screen and application mode options
    - Private browsing capabilities
    - Keyboard automation support
    - Multi-monitor support
    

PARAMETERS
    -Language <String>
        The language for the web content display and browser language settings.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on default browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
        monitor.
        
        Required?                    false
        Position?                    named
        Default value                -2
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the browser window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoFullScreen [<SwitchParameter>]
        Don't open in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoApplicationMode [<SwitchParameter>]
        Do show the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        Removes the borders of the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        Position browser window either fullscreen on different monitor than PowerShell, or side by side with PowerShell on the same monitor.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        Use alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        Clear alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        Store settings only in persistent preferences without affecting session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-ViralSimulation -Chrome -Private -NoFullScreen
    
    Opens viral simulation in Google Chrome with private browsing mode and no
    fullscreen.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > viral -ch -incognito -nfs
    
    Opens viral simulation using aliases with Chrome, incognito mode, and no
    fullscreen.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-Yab
    
SYNOPSIS
    Opens the YAB game in a web browser with configurable settings.
    
    
SYNTAX
    Open-Yab [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-ShowWindow] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-SpectateOnly] [-NoFullScreen] [-NoApplicationMode] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-NoBorders] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
    Opens the YAB game website in a specified browser with various display and
    behavior options. Supports different game modes including spectator mode.
    The YAB game is an online puzzle game that can be played interactively or
    watched in spectator mode where AI plays automatically.
    

PARAMETERS
    -Language <String>
        The language of the game interface. Supports multiple languages including
        English, Spanish, French, German, and many others.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on default browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
        monitor.
        
        Required?                    false
        Position?                    named
        Default value                -2
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FullScreen [<SwitchParameter>]
        Opens in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ShowWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the browser window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browser process.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SpectateOnly [<SwitchParameter>]
        Don't start a new game, just watch the AI play automatically.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoFullScreen [<SwitchParameter>]
        Don't open in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoApplicationMode [<SwitchParameter>]
        Do show the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-Yab -SpectateOnly -Chrome -NoFullScreen -Language "English"
    
    Opens YAB game in spectator mode using Chrome browser without fullscreen,
    with English language interface.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > yab -e -Private -Monitor 2
    
    Opens YAB game in Edge browser with private browsing on monitor 2 using
    aliases for quick access.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
 
NAME
    Open-YabAIBattle
    
SYNOPSIS
    Opens the YabAI Battle game in a web browser.
    
    
SYNTAX
    Open-YabAIBattle [[-Language] <String>] [-SpectateOnly] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-ShowWindow] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-DisablePopupBlocker] [-AcceptLang <String>] [-KeysToSend <String[]>] [-SendKeyEscape] [-SendKeyHoldKeyboardFocus] [-SendKeyUseShiftEnter] [-SendKeyDelayMilliSeconds <Int32>] [-FocusWindow] [-SetForeground] [-Maximize] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [-NoFullScreen] [-NoApplicationMode] [-NoBorders] [-SideBySide] [-SessionOnly] [-ClearSession] [-SkipSession] [<CommonParameters>]
    
    
DESCRIPTION
    This function launches the YabAI Battle game in a web browser with extensive
    customization options for window placement, browser selection, and display
    mode. It provides a wrapper around the GenXdev.Webbrowser\Open-Webbrowser
    function with game-specific URL construction and parameter handling.
    
    The function supports two game modes:
    - Battle mode: Start a new AI vs AI battle
    - Spectate mode: Watch existing AI battles
    
    Browser positioning options include left, right, top, bottom, centered, and
    fullscreen modes with multi-monitor support. The function automatically
    handles application mode settings and browser extension management for
    optimal gaming experience.
    

PARAMETERS
    -Language <String>
        The language of the game interface. Supports multiple languages including
        English, Spanish, French, German, and many others. This parameter affects
        the browser's Accept-Language header.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SpectateOnly [<SwitchParameter>]
        Don't start a new game, just watch the AI play. This mode allows you to
        observe ongoing AI battles without starting a new game session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Private [<SwitchParameter>]
        Opens in incognito/private browsing mode. Uses InPrivate for Edge and
        incognito for Chrome.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Force [<SwitchParameter>]
        Force enable debugging port, stopping existing browsers if needed. Useful
        when browser debugging features are required.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Edge [<SwitchParameter>]
        Opens in Microsoft Edge browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chrome [<SwitchParameter>]
        Opens in Google Chrome browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Chromium [<SwitchParameter>]
        Opens in Microsoft Edge or Google Chrome, depending on what the default
        browser is.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Firefox [<SwitchParameter>]
        Opens in Firefox browser.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -All [<SwitchParameter>]
        Opens in all registered modern browsers.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Monitor <Int32>
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary
        monitor, defaults to -1, no positioning.
        
        Required?                    false
        Position?                    named
        Default value                -2
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ShowWindow [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Width <Int32>
        The initial width of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Height <Int32>
        The initial height of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -X <Int32>
        The initial X position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Y <Int32>
        The initial Y position of the webbrowser window.
        
        Required?                    false
        Position?                    named
        Default value                -999999
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Left [<SwitchParameter>]
        Place browser window on the left side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Right [<SwitchParameter>]
        Place browser window on the right side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Top [<SwitchParameter>]
        Place browser window on the top side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Bottom [<SwitchParameter>]
        Place browser window on the bottom side of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Centered [<SwitchParameter>]
        Place browser window in the center of the screen.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ApplicationMode [<SwitchParameter>]
        Hide the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBrowserExtensions [<SwitchParameter>]
        Prevent loading of browser extensions.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -DisablePopupBlocker [<SwitchParameter>]
        Disable the popup blocker.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -AcceptLang <String>
        Set the browser accept-lang http header.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -KeysToSend <String[]>
        Keystrokes to send to the Browser window, see documentation for cmdlet
        GenXdev.Windows\Send-Key.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyEscape [<SwitchParameter>]
        Escape control characters when sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyHoldKeyboardFocus [<SwitchParameter>]
        Prevent returning keyboard focus to PowerShell after sending keys.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyUseShiftEnter [<SwitchParameter>]
        Send Shift+Enter instead of regular Enter for line breaks.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SendKeyDelayMilliSeconds <Int32>
        Delay between sending different key sequences in milliseconds.
        
        Required?                    false
        Position?                    named
        Default value                0
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -FocusWindow [<SwitchParameter>]
        Focus the browser window after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SetForeground [<SwitchParameter>]
        Set the browser window to foreground after opening.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -Maximize [<SwitchParameter>]
        Maximize the window after positioning.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -RestoreFocus [<SwitchParameter>]
        Restore PowerShell window focus.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NewWindow [<SwitchParameter>]
        Don't re-use existing browser window, instead, create a new one.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -PassThru [<SwitchParameter>]
        Returns a [System.Diagnostics.Process] object of the browserprocess.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnURL [<SwitchParameter>]
        Don't open webbrowser, just return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ReturnOnlyURL [<SwitchParameter>]
        After opening webbrowser, return the url.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoFullScreen [<SwitchParameter>]
        Don't open in fullscreen mode.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoApplicationMode [<SwitchParameter>]
        Do show the browser controls.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -NoBorders [<SwitchParameter>]
        Removes the borders of the browser window.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SideBySide [<SwitchParameter>]
        Position browser window either fullscreen on different monitor than PowerShell, or side by side with PowerShell on the same monitor.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SessionOnly [<SwitchParameter>]
        Use alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -ClearSession [<SwitchParameter>]
        Clear alternative settings stored in session for AI preferences.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    -SkipSession [<SwitchParameter>]
        Store settings only in persistent preferences without affecting session.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Open-YabAIBattle -Edge -Private -NoFullScreen
    
    Opens the YabAI Battle game in Microsoft Edge using private browsing mode
    without fullscreen.
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > yabbattle -e -incognito -nfs
    
    Opens the game using aliases for Edge, incognito mode, and no fullscreen.
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    PS > Open-YabAIBattle -SpectateOnly -Chrome
    
    Opens the game in spectate mode using Google Chrome to watch AI battles.
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    PS > Open-YabAIBattle -Language "Spanish" -Monitor 1 -Left
    
    Opens the game with Spanish language interface positioned on the left side
    of monitor 1.
    
    
    
    
    
RELATED LINKS 

<br/><hr/><hr/><br/>
