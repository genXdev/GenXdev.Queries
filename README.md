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
[![GenXdev.Helpers](https://img.shields.io/powershellgallery/v/GenXdev.Helpers.svg?style=flat-square&label=GenXdev.Helpers)](https://www.powershellgallery.com/packages/GenXdev.Helpers/) [![GenXdev.Data](https://img.shields.io/powershellgallery/v/GenXdev.Data.svg?style=flat-square&label=GenXdev.Data)](https://www.powershellgallery.com/packages/GenXdev.Data/)  [![GenXdev.Webbrowser](https://img.shields.io/powershellgallery/v/GenXdev.Webbrowser.svg?style=flat-square&label=GenXdev.Webbrowser)](https://www.powershellgallery.com/packages/GenXdev.Webbrowser/) [![GenXdev.FileSystem](https://img.shields.io/powershellgallery/v/GenXdev.Filesystem.svg?style=flat-square&label=GenXdev.FileSystem)](https://www.powershellgallery.com/packages/GenXdev.FileSystem/)

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
| [Open-BingCopilotQuery](#Open-BingCopilotQuery) | aibc, ask | Opens a Bing CoPilot (ChatGPT-4) query in the webbrowser, it types in the query and presses enter. |

<hr/>
&nbsp;

### GenXdev.Queries.Webbrowser</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-BingQuery](#Open-BingQuery) | bq | Opens a Bing query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-AllYoutubeVideos](#Open-AllYoutubeVideos) | qvideos, qyt | Performs an infinite auto opening YouTube search in a new fullscreen browserwindow on second monitor. The console window shows video info and keyboardshortcuts for controlling currently playing video. |
| [Open-AllGoogleLinks](#Open-AllGoogleLinks) | qlinks | Performs a google search .Opens 10 tabs each times, pauses until initial tab is revisitedClose initial tab to stop |
| [Get-WebLanguageDictionary](#Get-WebLanguageDictionary) |  | Returns a reversed dictionary for all languages supported by Google Search |
| [Get-GoogleSearchResultUrls](#Get-GoogleSearchResultUrls) | qlinksget | Performs a google search and returns the links |
| [Copy-PDFsFromGoogleQuery](#Copy-PDFsFromGoogleQuery) |  | Performs a Google query in the previously selected webbrowser tab, and download all found pdf's into current directory |
| [Clear-YoutubeWatched](#Clear-YoutubeWatched) |  | This function selects a YouTube tab in the browser and clears the watch historyby resetting the local storage value for watched videos. |

<hr/>
&nbsp;

### GenXdev.Queries.Text</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-WikipediaSummary](#Get-WikipediaSummary) | wikitxt | Performs a "Wikipedia summary" text query |
| [Get-NextAffirmations](#Get-NextAffirmations) | WhatAboutIt | Returns a random affirmation text |

<hr/>
&nbsp;

### GenXdev.Queries.AI</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-XGrokQuery](#Open-XGrokQuery) | aixg, askxgrok | Opens a X Grok query in the webbrowser, it types in the query and presses enter. |
| [Open-GoogleGeminiQuery](#Open-GoogleGeminiQuery) | aigg, askgemini | Opens a Google Gemini query in the webbrowser, it types in the query and presses enter. |
| [Open-GithubCopilotQuery](#Open-GithubCopilotQuery) | aigc, askghcopilot | Opens a Github CoPilot query in the webbrowser, it types in the query and presses enter. |
| [Open-ChatGPTQuery](#Open-ChatGPTQuery) | aicgpt, askchatgpt | Opens a ChatGPT query in the webbrowser, it types in the query and presses enter. |
| [Open-BingCopilotQuery](#Open-BingCopilotQuery) | aibc, ask | Opens a Bing CoPilot (ChatGPT-4) query in the webbrowser, it types in the query and presses enter. |

<hr/>
&nbsp;

### GenXdev.Queries.Websites</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-YabAIBattle](#Open-YabAIBattle) | yabbattle | Opens an interactive block-falling-game in battle AI mode |

<hr/>
&nbsp;

### GenXdev.Queries.Webbrowser</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-BuiltWithSiteInfo](#Open-BuiltWithSiteInfo) |  | Opens a BuildWith query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-GithubQuery](#Open-GithubQuery) | qgit | Opens a Github query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-GoogleQuery](#Open-GoogleQuery) |  | Opens a google query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-GoogleSiteInfo](#Open-GoogleSiteInfo) |  | Opens a "Google siteinfo" query in a webbrowser, in a configurable manner, using commandline switches |

<hr/>
&nbsp;

### GenXdev.Queries.Websites</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-ViralSimulation](#Open-ViralSimulation) | viral | Opens a very simple, interactive infection simulation |
| [Open-Timeline](#Open-Timeline) | timeline | Opens an interactive timeline, showing the current time, date, centery, millenium |
| [Open-GenXdevAppCatalog](#Open-GenXdevAppCatalog) | appcatalog | Opens the catalog with published GenXdev progressive webapps |
| [Open-GameOfLife](#Open-GameOfLife) | conway, gameoflife | Opens an interactive game-of-life simulation |

<hr/>
&nbsp;

### GenXdev.Queries.Webbrowser</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-YoutubeQuery](#Open-YoutubeQuery) | youtube | Opens a Youtube query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WolframAlphaQuery](#Open-WolframAlphaQuery) | qalpha | Opens a "Wolfram Alpha" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WikipediaQuery](#Open-WikipediaQuery) | wiki | Opens a Wikipedia query in a webbrowser, in a configurable manner, using commandline switches |

<hr/>
&nbsp;

### GenXdev.Queries.Websites</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-Yab](#Open-Yab) | yab | Opens an interactive block-falling-game in single playermode |

<hr/>
&nbsp;

### GenXdev.Queries.Webbrowser</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-WikipediaNLQuery](#Open-WikipediaNLQuery) | wikinl | Opens a 'Wikipedia - The Netherlands' query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WebsiteAndPerformQuery](#Open-WebsiteAndPerformQuery) |  | Opens a website by Url in the webbrowser, it types in a query and presses enter. |
| [Open-WaybackMachineSiteInfo](#Open-WaybackMachineSiteInfo) | wayback | Opens a Waybackmachine query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-StackOverflowQuery](#Open-StackOverflowQuery) | qso | Opens a "Stack Overflow" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-SimularWebSiteInfo](#Open-SimularWebSiteInfo) | simularsite | Opens a "Simular web" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-MovieQuote](#Open-MovieQuote) | moviequote | Opens a video of a movie quote |
| [Open-InstantStreetViewQuery](#Open-InstantStreetViewQuery) | isv | Opens a "InstantStreetView" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-IMDBQuery](#Open-IMDBQuery) | imdb | Opens a "Internet Movie Database" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WhoisHostSiteInfo](#Open-WhoisHostSiteInfo) |  | Opens a "Whois HostInfo" query in a webbrowser, in a configurable manner, using commandline switches |

<hr/>
&nbsp;

### GenXdev.Queries.Websites</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-ViralSimulation](#Open-ViralSimulation) | viral | Opens a very simple, interactive infection simulation |
| [Open-Timeline](#Open-Timeline) | timeline | Opens an interactive timeline, showing the current time, date, centery, millenium |
| [Open-GenXdevAppCatalog](#Open-GenXdevAppCatalog) | appcatalog | Opens the catalog with published GenXdev progressive webapps |

<hr/>
&nbsp;

### GenXdev.Queries.Webbrowser</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-IMDBQuery](#Open-IMDBQuery) | imdb | Opens a "Internet Movie Database" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-GoogleSiteInfo](#Open-GoogleSiteInfo) |  | Opens a "Google siteinfo" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-GoogleQuery](#Open-GoogleQuery) |  | Opens a google query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-GithubQuery](#Open-GithubQuery) | qgit | Opens a Github query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-BuiltWithSiteInfo](#Open-BuiltWithSiteInfo) |  | Opens a BuildWith query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-BingQuery](#Open-BingQuery) | bq | Opens a Bing query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-AllYoutubeVideos](#Open-AllYoutubeVideos) | qvideos, qyt | Performs an infinite auto opening YouTube search in a new fullscreen browserwindow on second monitor. The console window shows video info and keyboardshortcuts for controlling currently playing video. |
| [Open-InstantStreetViewQuery](#Open-InstantStreetViewQuery) | isv | Opens a "InstantStreetView" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-AllGoogleLinks](#Open-AllGoogleLinks) | qlinks | Performs a google search .Opens 10 tabs each times, pauses until initial tab is revisitedClose initial tab to stop |
| [Get-GoogleSearchResultUrls](#Get-GoogleSearchResultUrls) | qlinksget | Performs a google search and returns the links |
| [Copy-PDFsFromGoogleQuery](#Copy-PDFsFromGoogleQuery) |  | Performs a Google query in the previously selected webbrowser tab, and download all found pdf's into current directory |
| [Clear-YoutubeWatched](#Clear-YoutubeWatched) |  | This function selects a YouTube tab in the browser and clears the watch historyby resetting the local storage value for watched videos. |

<hr/>
&nbsp;

### GenXdev.Queries.AI</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-XGrokQuery](#Open-XGrokQuery) | aixg, askxgrok | Opens a X Grok query in the webbrowser, it types in the query and presses enter. |
| [Open-GoogleGeminiQuery](#Open-GoogleGeminiQuery) | aigg, askgemini | Opens a Google Gemini query in the webbrowser, it types in the query and presses enter. |
| [Open-GithubCopilotQuery](#Open-GithubCopilotQuery) | aigc, askghcopilot | Opens a Github CoPilot query in the webbrowser, it types in the query and presses enter. |
| [Open-ChatGPTQuery](#Open-ChatGPTQuery) | aicgpt, askchatgpt | Opens a ChatGPT query in the webbrowser, it types in the query and presses enter. |

<hr/>
&nbsp;

### GenXdev.Queries.Webbrowser</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-WebLanguageDictionary](#Get-WebLanguageDictionary) |  | Returns a reversed dictionary for all languages supported by Google Search |

<hr/>
&nbsp;

### GenXdev.Queries.Websites</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-Yab](#Open-Yab) | yab | Opens an interactive block-falling-game in single playermode |

<hr/>
&nbsp;

### GenXdev.Queries.Webbrowser</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-MovieQuote](#Open-MovieQuote) | moviequote | Opens a video of a movie quote |
| [Open-StackOverflowQuery](#Open-StackOverflowQuery) | qso | Opens a "Stack Overflow" query in a webbrowser, in a configurable manner, using commandline switches |

<hr/>
&nbsp;

### GenXdev.Queries.Websites</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-GameOfLife](#Open-GameOfLife) | conway, gameoflife | Opens an interactive game-of-life simulation |
| [Open-YabAIBattle](#Open-YabAIBattle) | yabbattle | Opens an interactive block-falling-game in battle AI mode |
| [Open-Yab](#Open-Yab) | yab | Opens an interactive block-falling-game in single playermode |
| [Open-ViralSimulation](#Open-ViralSimulation) | viral | Opens a very simple, interactive infection simulation |
| [Open-Timeline](#Open-Timeline) | timeline | Opens an interactive timeline, showing the current time, date, centery, millenium |
| [Open-GenXdevAppCatalog](#Open-GenXdevAppCatalog) | appcatalog | Opens the catalog with published GenXdev progressive webapps |
| [Open-GameOfLife](#Open-GameOfLife) | conway, gameoflife | Opens an interactive game-of-life simulation |

<hr/>
&nbsp;

### GenXdev.Queries.Webbrowser</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-SimularWebSiteInfo](#Open-SimularWebSiteInfo) | simularsite | Opens a "Simular web" query in a webbrowser, in a configurable manner, using commandline switches |

<hr/>
&nbsp;

### GenXdev.Queries.Text</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-WikipediaSummary](#Get-WikipediaSummary) | wikitxt | Performs a "Wikipedia summary" text query |

<hr/>
&nbsp;

### GenXdev.Queries.Webbrowser</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-YoutubeQuery](#Open-YoutubeQuery) | youtube | Opens a Youtube query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WolframAlphaQuery](#Open-WolframAlphaQuery) | qalpha | Opens a "Wolfram Alpha" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WikipediaQuery](#Open-WikipediaQuery) | wiki | Opens a Wikipedia query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WikipediaNLQuery](#Open-WikipediaNLQuery) | wikinl | Opens a 'Wikipedia - The Netherlands' query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WhoisHostSiteInfo](#Open-WhoisHostSiteInfo) |  | Opens a "Whois HostInfo" query in a webbrowser, in a configurable manner, using commandline switches |
| [Open-WebsiteAndPerformQuery](#Open-WebsiteAndPerformQuery) |  | Opens a website by Url in the webbrowser, it types in a query and presses enter. |
| [Open-WaybackMachineSiteInfo](#Open-WaybackMachineSiteInfo) | wayback | Opens a Waybackmachine query in a webbrowser, in a configurable manner, using commandline switches |

<hr/>
&nbsp;

### GenXdev.Queries.Text</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-NextAffirmations](#Get-NextAffirmations) | WhatAboutIt | Returns a random affirmation text |

<hr/>
&nbsp;

### GenXdev.Queries.Websites</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-YabAIBattle](#Open-YabAIBattle) | yabbattle | Opens an interactive block-falling-game in battle AI mode |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Queries.AI<hr/>

##	Open-BingCopilotQuery
````PowerShell
Open-BingCopilotQuery                --> aibc, ask
````

### SYNOPSIS
    Opens a Bing CoPilot query in a webbrowser

### SYNTAX
````PowerShell
Open-BingCopilotQuery [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Opens a Bing CoPilot (ChatGPT-4) query in the webbrowser, it types in the query and presses 
    enter.

### PARAMETERS
    -Queries <String[]>
        The query to perform
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.Webbrowser<hr/>

##	Open-BingQuery
````PowerShell
Open-BingQuery                       --> bq
````

### SYNOPSIS
    Opens a Bing query in a webbrowser

### SYNTAX
````PowerShell
Open-BingQuery [-Queries] <String[]> [-Monitor <Int32>] [<CommonParameters>]
````

### DESCRIPTION
    Opens a Bing query in a webbrowser, in a configurable manner, using commandline switches

### PARAMETERS
    -Queries <String[]>
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Monitor <Int32>
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Open-AllYoutubeVideos
````PowerShell
Open-AllYoutubeVideos                --> qvideos, qyt
````

### SYNOPSIS
    Opens and controls YouTube videos in a browser window with keyboard shortcuts.

### SYNTAX
````PowerShell
Open-AllYoutubeVideos [[-Queries] <String[]>] [-Subscriptions] [-WatchLater] [-Recommended] 
[-Trending] [-Edge] [-Chrome] [<CommonParameters>]
````

### DESCRIPTION
    Performs an infinite auto opening YouTube search in a new fullscreen browser
    window on second monitor. The console window shows video info and keyboard
    shortcuts for controlling currently playing video.

### PARAMETERS
    -Queries <String[]>
        The search terms to find videos for. Opens all videos matching each term.
        Required?                    false
        Position?                    1
        Default value                @("")
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
        Opens all videos that YouTube recommends.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Trending [<SwitchParameter>]
        Opens all videos currently trending on YouTube.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Edge [<SwitchParameter>]
        Use Microsoft Edge browser.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Chrome [<SwitchParameter>]
        Use Google Chrome browser.
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

### NOTES
````PowerShell
    Requires the Windows 10+ Operating System
-------------------------- EXAMPLE 1 --------------------------
PS C:\> 
Open-AllGoogleLinks "site:github.com PowerShell module"
````

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

##	Get-GoogleSearchResultUrls
````PowerShell
Get-GoogleSearchResultUrls           --> qlinksget
````

### SYNOPSIS
    Performs a google search and returns the links

### SYNTAX
````PowerShell
Get-GoogleSearchResultUrls [-Queries] <String[]> [-Max <Int32>] [-Language <String>] 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

### NOTES
````PowerShell
    Requires the Windows 10+ Operating System
-------------------------- EXAMPLE 1 --------------------------
PS C:\> $Urls = Get-GoogleSearchResultUrls "site:github.com PowerShell module"; $Urls
````

<br/><hr/><hr/><br/>

##	Copy-PDFsFromGoogleQuery
````PowerShell
Copy-PDFsFromGoogleQuery
````

### SYNOPSIS
    Performs a Google query in the previously selected webbrowser tab, and download all found 
    pdf's into current directory

### SYNTAX
````PowerShell
Copy-PDFsFromGoogleQuery [-Queries] <String[]> [-Max <Int32>] [-Language <String>] 
[<CommonParameters>]
````

### DESCRIPTION
    Performs a Google query in the previously selected webbrowser tab, and download all found 
    pdf's into current directory

### PARAMETERS
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
    Copy-PDFsFromGoogleQuery scientific, paper, co2
-------------------------- EXAMPLE 2 --------------------------
PS D:\Downloads> 
Open-Webbrowser
    Select-WebbrowserTab
    mkdir pdfs;
    cd pdfs;
    Copy-PDFsFromGoogleQuery -Query "scientific paper co2" | Select-Object -First 10 | 
Open-Webbrowser
````

<br/><hr/><hr/><br/>

##	Clear-YoutubeWatched
````PowerShell
Clear-YoutubeWatched
````

### SYNOPSIS
    Clears the YouTube watch history from the browser's local storage.

### SYNTAX
````PowerShell
Clear-YoutubeWatched [<CommonParameters>]
````

### DESCRIPTION
    This function selects a YouTube tab in the browser and clears the watch history
    by resetting the local storage value for watched videos.

### PARAMETERS
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
        Aliases                      
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
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.AI<hr/>

##	Open-XGrokQuery
````PowerShell
Open-XGrokQuery                      --> aixg, askxgrok
````

### SYNOPSIS
    Opens a X Grok query in a webbrowser

### SYNTAX
````PowerShell
Open-XGrokQuery [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Opens a X Grok query in the webbrowser, it types in the query and presses enter.

### PARAMETERS
    -Queries <String[]>
        The query to perform
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Open-GoogleGeminiQuery
````PowerShell
Open-GoogleGeminiQuery               --> aigg, askgemini
````

### SYNOPSIS
    Opens a Google Gemini query in a webbrowser

### SYNTAX
````PowerShell
Open-GoogleGeminiQuery [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Opens a Google Gemini query in the webbrowser, it types in the query and presses enter.

### PARAMETERS
    -Queries <String[]>
        The query to perform
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Open-GithubCopilotQuery
````PowerShell
Open-GithubCopilotQuery              --> aigc, askghcopilot
````

### SYNOPSIS
    Opens a Github CoPilot query in a webbrowser

### SYNTAX
````PowerShell
Open-GithubCopilotQuery [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Opens a Github CoPilot query in the webbrowser, it types in the query and presses enter.

### PARAMETERS
    -Queries <String[]>
        The query to perform
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Open-ChatGPTQuery
````PowerShell
Open-ChatGPTQuery                    --> aicgpt, askchatgpt
````

### SYNOPSIS
    Opens a ChatGPT query in a webbrowser

### SYNTAX
````PowerShell
Open-ChatGPTQuery [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Opens a ChatGPT query in the webbrowser, it types in the query and presses enter.

### PARAMETERS
    -Queries <String[]>
        The query to perform
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Open-BingCopilotQuery
````PowerShell
Open-BingCopilotQuery                --> aibc, ask
````

### SYNOPSIS
    Opens a Bing CoPilot query in a webbrowser

### SYNTAX
````PowerShell
Open-BingCopilotQuery [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Opens a Bing CoPilot (ChatGPT-4) query in the webbrowser, it types in the query and presses 
    enter.

### PARAMETERS
    -Queries <String[]>
        The query to perform
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.Websites<hr/>

##	Open-YabAIBattle
````PowerShell
Open-YabAIBattle                     --> yabbattle
````

### SYNTAX
````PowerShell
Open-YabAIBattle [[-Monitor] <int>] [-SpectateOnly] [-ReturnURL] [-ReturnOnlyURL] 
[-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height 
<int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
        Dynamic?                     true
        Accept wildcard characters?  false
    -SpectateOnly
        Do not start a new game, just watch the AI play
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
###	GenXdev.Queries.Webbrowser<hr/>

##	Open-BuiltWithSiteInfo
````PowerShell
Open-BuiltWithSiteInfo
````

### SYNTAX
````PowerShell
Open-BuiltWithSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-GithubQuery [-Queries] <string[]> [-Language <string>] [-Monitor <int>] [-Private] 
[-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] 
[-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] 
[-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] 
[-NewWindow] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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

##	Open-GoogleQuery
````PowerShell
Open-GoogleQuery
````

### SYNTAX
````PowerShell
Open-GoogleQuery [-Queries] <string[]> [-Monitor <int>] [-Language {Afrikaans | Akan | 
Albanian | Amharic | Arabic | Armenian | Azerbaijani | Basque | Belarusian | Bemba | 
Bengali | Bihari | Bork, bork, bork! | Bosnian | Breton | Bulgarian | Cambodian | Catalan | 
Cherokee | Chichewa | Chinese (Simplified) | Chinese (Traditional) | Corsican | Croatian | 
Czech | Danish | Dutch | Elmer Fudd | English | Esperanto | Estonian | Ewe | Faroese | 
Filipino | Finnish | French | Frisian | Ga | Galician | Georgian | German | Greek | Guarani 
| Gujarati | Hacker | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi | Hungarian | 
Icelandic | Igbo | Indonesian | Interlingua | Irish | Italian | Japanese | Javanese | 
Kannada | Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo | Korean | Krio (Sierra Leone) | 
Kurdish | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala | Lithuanian | 
Lozi | Luganda | Luo | Macedonian | Malagasy | Malay | Malayalam | Maltese | Maori | 
Marathi | Mauritian Creole | Moldavian | Mongolian | Montenegrin | Nepali | Nigerian Pidgin 
| Northern Sotho | Norwegian | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto | 
Persian | Pirate | Polish | Portuguese (Brazil) | Portuguese (Portugal) | Punjabi | Quechua 
| Romanian | Romansh | Runyakitara | Russian | Scots Gaelic | Serbian | Serbo-Croatian | 
Sesotho | Setswana | Seychellois Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian | 
Somali | Spanish | Spanish (Latin American) | Sundanese | Swahili | Swedish | Tajik | Tamil 
| Tatar | Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi | 
Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish | Yoruba | 
Zulu}] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] 
[-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] 
[-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <string>] 
[-RestoreFocus] [-NewWindow] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-GoogleSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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

&nbsp;<hr/>
###	GenXdev.Queries.Websites<hr/>

##	Open-ViralSimulation
````PowerShell
Open-ViralSimulation                 --> viral
````

### SYNTAX
````PowerShell
Open-ViralSimulation [[-Monitor] <int>] [-ReturnURL] [-ReturnOnlyURL] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X <int>] 
[-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] 
[-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
Open-Timeline [[-Theme] {[All] | VanGoghSkies | MonetMoods | PicassoPulse | DaliDreams | 
KandinskyKaleidoscope | PollockPoints | HokusaiWaves | EscherEchoes | WarholWaves | 
KlimtKaleidoscope | MiroMirage | RothkoRhythms | SeuratStipples | RembrandtRadiance | 
VermeerVisions | BoschBizarre | TurnerTwilight | FridaFeelings | CezanneContours | 
GauguinGlow | RenoirReflections}] [[-Language] {English | Kotava | Arabic | German | 
Spanish | French | Italian | Japanese | Korean | Dutch | Polish | Portuguese | Russian | 
Thai | Turkish | Ukrainian | Vietnamese | Yiddish | Chinese | [All]}] [-Monitor <int>] 
[-ReturnURL] [-ReturnOnlyURL] [-DragedNodeBackground <string>] [-FocusedNodeBackground 
<string>] [-FocusedNodeForeground <string>] [-UnFocusedNodeBackground <string>] 
[-UnFocusedNodeForeground <string>] [-BorderLightColor <string>] [-BorderDarkColor 
<string>] [-BorderWidth <int>] [-RotationDelaySeconds <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X <int>] [-Y 
<int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] [-AcceptLang 
<string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -BorderDarkColor <string>
        Overwrite the default css border-dark-color colorstyle
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -BorderLightColor <string>
        Overwrite the default css border-light-color colorstyle
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -BorderWidth <int>
        Overwrite the default width for painting the node borders
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -DragedNodeBackground <string>
        Overwrite the css-color-style for painting the currently dragged node's background
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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
    -FocusedNodeBackground <string>
        Overwrite the css-color-style for painting the focused node's (In center) background
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -FocusedNodeForeground <string>
        Overwrite the css-color-style for painting the focused node's (in center) foreground 
        text
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
        Override default browser language, or select [All] for rotation of all languages every 
        minute
        Required?                    false
        Position?                    1
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
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
        Dynamic?                     true
        Accept wildcard characters?  false
    -RotationDelaySeconds <int>
        Overwrite the default width for the background rotation delay
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Theme <string>
        Selects All or limit the theme to a specific one, default = PicassoPulse
        Required?                    false
        Position?                    0
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
        Dynamic?                     true
        Accept wildcard characters?  false
    -UnFocusedNodeBackground <string>
        Overwrite the css-color-style for painting the focused node's (In center) background
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UnFocusedNodeForeground <string>
        Overwrite the css-color-style for painting the unfocused node's (in center) foreground 
        text
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

##	Open-GenXdevAppCatalog
````PowerShell
Open-GenXdevAppCatalog               --> appcatalog
````

### SYNTAX
````PowerShell
Open-GenXdevAppCatalog [[-Monitor] <int>] [-ReturnURL] [-ReturnOnlyURL] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X <int>] 
[-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] 
[-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
Open-GameOfLife [[-Monitor] <int>] [-ReturnURL] [-ReturnOnlyURL] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X <int>] 
[-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] 
[-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
###	GenXdev.Queries.Webbrowser<hr/>

##	Open-YoutubeQuery
````PowerShell
Open-YoutubeQuery                    --> youtube
````

### SYNTAX
````PowerShell
Open-YoutubeQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-WolframAlphaQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
    Opens a Wikipedia query in a webbrowser, in a configurable manner, using commandline 
    switches

### PARAMETERS
    -Queries <String[]>
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Monitor <Int32>
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.Websites<hr/>

##	Open-Yab
````PowerShell
Open-Yab                             --> yab
````

### SYNTAX
````PowerShell
Open-Yab [[-Monitor] <int>] [-SpectateOnly] [-ReturnURL] [-ReturnOnlyURL] [-Private] 
[-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] 
[-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
        Dynamic?                     true
        Accept wildcard characters?  false
    -SpectateOnly
        Do not start a new game, just watch the AI play
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
###	GenXdev.Queries.Webbrowser<hr/>

##	Open-WikipediaNLQuery
````PowerShell
Open-WikipediaNLQuery                --> wikinl
````

### SYNTAX
````PowerShell
Open-WikipediaNLQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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

##	Open-WebsiteAndPerformQuery
````PowerShell
Open-WebsiteAndPerformQuery
````

### SYNOPSIS
    Opens a webpage in a webbrowser and performs a query

### SYNTAX
````PowerShell
Open-WebsiteAndPerformQuery [-Url] <String> [-Queries] <String[]> [-Monitor <Int32>] 
[<CommonParameters>]
````

### DESCRIPTION
    Opens a website by Url in the webbrowser, it types in a query and presses enter.

### PARAMETERS
    -Url <String>
        The url of the website to open
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Queries <String[]>
        The query to perform
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Monitor <Int32>
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
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
Open-WaybackMachineSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height 
<int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] 
[-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] 
[-NewWindow] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-StackOverflowQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-SimularWebSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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

##	Open-MovieQuote
````PowerShell
Open-MovieQuote                      --> moviequote
````

### SYNTAX
````PowerShell
Open-MovieQuote [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-InstantStreetViewQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height 
<int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] 
[-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] 
[-NewWindow] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-IMDBQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] [-Chrome] 
[-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y 
<int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-WhoisHostSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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

&nbsp;<hr/>
###	GenXdev.Queries.Websites<hr/>

##	Open-ViralSimulation
````PowerShell
Open-ViralSimulation                 --> viral
````

### SYNTAX
````PowerShell
Open-ViralSimulation [[-Monitor] <int>] [-ReturnURL] [-ReturnOnlyURL] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X <int>] 
[-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] 
[-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
Open-Timeline [[-Theme] {[All] | VanGoghSkies | MonetMoods | PicassoPulse | DaliDreams | 
KandinskyKaleidoscope | PollockPoints | HokusaiWaves | EscherEchoes | WarholWaves | 
KlimtKaleidoscope | MiroMirage | RothkoRhythms | SeuratStipples | RembrandtRadiance | 
VermeerVisions | BoschBizarre | TurnerTwilight | FridaFeelings | CezanneContours | 
GauguinGlow | RenoirReflections}] [[-Language] {English | Kotava | Arabic | German | 
Spanish | French | Italian | Japanese | Korean | Dutch | Polish | Portuguese | Russian | 
Thai | Turkish | Ukrainian | Vietnamese | Yiddish | Chinese | [All]}] [-Monitor <int>] 
[-ReturnURL] [-ReturnOnlyURL] [-DragedNodeBackground <string>] [-FocusedNodeBackground 
<string>] [-FocusedNodeForeground <string>] [-UnFocusedNodeBackground <string>] 
[-UnFocusedNodeForeground <string>] [-BorderLightColor <string>] [-BorderDarkColor 
<string>] [-BorderWidth <int>] [-RotationDelaySeconds <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X <int>] [-Y 
<int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] [-AcceptLang 
<string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -BorderDarkColor <string>
        Overwrite the default css border-dark-color colorstyle
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -BorderLightColor <string>
        Overwrite the default css border-light-color colorstyle
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -BorderWidth <int>
        Overwrite the default width for painting the node borders
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -DragedNodeBackground <string>
        Overwrite the css-color-style for painting the currently dragged node's background
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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
    -FocusedNodeBackground <string>
        Overwrite the css-color-style for painting the focused node's (In center) background
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -FocusedNodeForeground <string>
        Overwrite the css-color-style for painting the focused node's (in center) foreground 
        text
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
        Override default browser language, or select [All] for rotation of all languages every 
        minute
        Required?                    false
        Position?                    1
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
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
        Dynamic?                     true
        Accept wildcard characters?  false
    -RotationDelaySeconds <int>
        Overwrite the default width for the background rotation delay
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Theme <string>
        Selects All or limit the theme to a specific one, default = PicassoPulse
        Required?                    false
        Position?                    0
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
        Dynamic?                     true
        Accept wildcard characters?  false
    -UnFocusedNodeBackground <string>
        Overwrite the css-color-style for painting the focused node's (In center) background
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UnFocusedNodeForeground <string>
        Overwrite the css-color-style for painting the unfocused node's (in center) foreground 
        text
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

##	Open-GenXdevAppCatalog
````PowerShell
Open-GenXdevAppCatalog               --> appcatalog
````

### SYNTAX
````PowerShell
Open-GenXdevAppCatalog [[-Monitor] <int>] [-ReturnURL] [-ReturnOnlyURL] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X <int>] 
[-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] 
[-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
###	GenXdev.Queries.Webbrowser<hr/>

##	Open-IMDBQuery
````PowerShell
Open-IMDBQuery                       --> imdb
````

### SYNTAX
````PowerShell
Open-IMDBQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] [-Chrome] 
[-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y 
<int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-GoogleSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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

##	Open-GoogleQuery
````PowerShell
Open-GoogleQuery
````

### SYNTAX
````PowerShell
Open-GoogleQuery [-Queries] <string[]> [-Monitor <int>] [-Language {Afrikaans | Akan | 
Albanian | Amharic | Arabic | Armenian | Azerbaijani | Basque | Belarusian | Bemba | 
Bengali | Bihari | Bork, bork, bork! | Bosnian | Breton | Bulgarian | Cambodian | Catalan | 
Cherokee | Chichewa | Chinese (Simplified) | Chinese (Traditional) | Corsican | Croatian | 
Czech | Danish | Dutch | Elmer Fudd | English | Esperanto | Estonian | Ewe | Faroese | 
Filipino | Finnish | French | Frisian | Ga | Galician | Georgian | German | Greek | Guarani 
| Gujarati | Hacker | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi | Hungarian | 
Icelandic | Igbo | Indonesian | Interlingua | Irish | Italian | Japanese | Javanese | 
Kannada | Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo | Korean | Krio (Sierra Leone) | 
Kurdish | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala | Lithuanian | 
Lozi | Luganda | Luo | Macedonian | Malagasy | Malay | Malayalam | Maltese | Maori | 
Marathi | Mauritian Creole | Moldavian | Mongolian | Montenegrin | Nepali | Nigerian Pidgin 
| Northern Sotho | Norwegian | Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto | 
Persian | Pirate | Polish | Portuguese (Brazil) | Portuguese (Portugal) | Punjabi | Quechua 
| Romanian | Romansh | Runyakitara | Russian | Scots Gaelic | Serbian | Serbo-Croatian | 
Sesotho | Setswana | Seychellois Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian | 
Somali | Spanish | Spanish (Latin American) | Sundanese | Swahili | Swedish | Tajik | Tamil 
| Tatar | Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi | 
Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish | Yoruba | 
Zulu}] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] 
[-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] 
[-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <string>] 
[-RestoreFocus] [-NewWindow] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-GithubQuery [-Queries] <string[]> [-Language <string>] [-Monitor <int>] [-Private] 
[-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] 
[-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] 
[-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] 
[-NewWindow] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-BuiltWithSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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

##	Open-BingQuery
````PowerShell
Open-BingQuery                       --> bq
````

### SYNOPSIS
    Opens a Bing query in a webbrowser

### SYNTAX
````PowerShell
Open-BingQuery [-Queries] <String[]> [-Monitor <Int32>] [<CommonParameters>]
````

### DESCRIPTION
    Opens a Bing query in a webbrowser, in a configurable manner, using commandline switches

### PARAMETERS
    -Queries <String[]>
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Monitor <Int32>
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Open-AllYoutubeVideos
````PowerShell
Open-AllYoutubeVideos                --> qvideos, qyt
````

### SYNOPSIS
    Opens and controls YouTube videos in a browser window with keyboard shortcuts.

### SYNTAX
````PowerShell
Open-AllYoutubeVideos [[-Queries] <String[]>] [-Subscriptions] [-WatchLater] [-Recommended] 
[-Trending] [-Edge] [-Chrome] [<CommonParameters>]
````

### DESCRIPTION
    Performs an infinite auto opening YouTube search in a new fullscreen browser
    window on second monitor. The console window shows video info and keyboard
    shortcuts for controlling currently playing video.

### PARAMETERS
    -Queries <String[]>
        The search terms to find videos for. Opens all videos matching each term.
        Required?                    false
        Position?                    1
        Default value                @("")
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
        Opens all videos that YouTube recommends.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Trending [<SwitchParameter>]
        Opens all videos currently trending on YouTube.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Edge [<SwitchParameter>]
        Use Microsoft Edge browser.
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Aliases                      
        Accept wildcard characters?  false
    -Chrome [<SwitchParameter>]
        Use Google Chrome browser.
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Open-InstantStreetViewQuery
````PowerShell
Open-InstantStreetViewQuery          --> isv
````

### SYNTAX
````PowerShell
Open-InstantStreetViewQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height 
<int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] 
[-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] 
[-NewWindow] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

### NOTES
````PowerShell
    Requires the Windows 10+ Operating System
-------------------------- EXAMPLE 1 --------------------------
PS C:\> 
Open-AllGoogleLinks "site:github.com PowerShell module"
````

<br/><hr/><hr/><br/>

##	Get-GoogleSearchResultUrls
````PowerShell
Get-GoogleSearchResultUrls           --> qlinksget
````

### SYNOPSIS
    Performs a google search and returns the links

### SYNTAX
````PowerShell
Get-GoogleSearchResultUrls [-Queries] <String[]> [-Max <Int32>] [-Language <String>] 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

### NOTES
````PowerShell
    Requires the Windows 10+ Operating System
-------------------------- EXAMPLE 1 --------------------------
PS C:\> $Urls = Get-GoogleSearchResultUrls "site:github.com PowerShell module"; $Urls
````

<br/><hr/><hr/><br/>

##	Copy-PDFsFromGoogleQuery
````PowerShell
Copy-PDFsFromGoogleQuery
````

### SYNOPSIS
    Performs a Google query in the previously selected webbrowser tab, and download all found 
    pdf's into current directory

### SYNTAX
````PowerShell
Copy-PDFsFromGoogleQuery [-Queries] <String[]> [-Max <Int32>] [-Language <String>] 
[<CommonParameters>]
````

### DESCRIPTION
    Performs a Google query in the previously selected webbrowser tab, and download all found 
    pdf's into current directory

### PARAMETERS
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
    Copy-PDFsFromGoogleQuery scientific, paper, co2
-------------------------- EXAMPLE 2 --------------------------
PS D:\Downloads> 
Open-Webbrowser
    Select-WebbrowserTab
    mkdir pdfs;
    cd pdfs;
    Copy-PDFsFromGoogleQuery -Query "scientific paper co2" | Select-Object -First 10 | 
Open-Webbrowser
````

<br/><hr/><hr/><br/>

##	Clear-YoutubeWatched
````PowerShell
Clear-YoutubeWatched
````

### SYNOPSIS
    Clears the YouTube watch history from the browser's local storage.

### SYNTAX
````PowerShell
Clear-YoutubeWatched [<CommonParameters>]
````

### DESCRIPTION
    This function selects a YouTube tab in the browser and clears the watch history
    by resetting the local storage value for watched videos.

### PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.AI<hr/>

##	Open-XGrokQuery
````PowerShell
Open-XGrokQuery                      --> aixg, askxgrok
````

### SYNOPSIS
    Opens a X Grok query in a webbrowser

### SYNTAX
````PowerShell
Open-XGrokQuery [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Opens a X Grok query in the webbrowser, it types in the query and presses enter.

### PARAMETERS
    -Queries <String[]>
        The query to perform
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Open-GoogleGeminiQuery
````PowerShell
Open-GoogleGeminiQuery               --> aigg, askgemini
````

### SYNOPSIS
    Opens a Google Gemini query in a webbrowser

### SYNTAX
````PowerShell
Open-GoogleGeminiQuery [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Opens a Google Gemini query in the webbrowser, it types in the query and presses enter.

### PARAMETERS
    -Queries <String[]>
        The query to perform
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Open-GithubCopilotQuery
````PowerShell
Open-GithubCopilotQuery              --> aigc, askghcopilot
````

### SYNOPSIS
    Opens a Github CoPilot query in a webbrowser

### SYNTAX
````PowerShell
Open-GithubCopilotQuery [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Opens a Github CoPilot query in the webbrowser, it types in the query and presses enter.

### PARAMETERS
    -Queries <String[]>
        The query to perform
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

##	Open-ChatGPTQuery
````PowerShell
Open-ChatGPTQuery                    --> aicgpt, askchatgpt
````

### SYNOPSIS
    Opens a ChatGPT query in a webbrowser

### SYNTAX
````PowerShell
Open-ChatGPTQuery [-Queries] <String[]> [<CommonParameters>]
````

### DESCRIPTION
    Opens a ChatGPT query in the webbrowser, it types in the query and presses enter.

### PARAMETERS
    -Queries <String[]>
        The query to perform
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.Webbrowser<hr/>

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

&nbsp;<hr/>
###	GenXdev.Queries.Websites<hr/>

##	Open-Yab
````PowerShell
Open-Yab                             --> yab
````

### SYNTAX
````PowerShell
Open-Yab [[-Monitor] <int>] [-SpectateOnly] [-ReturnURL] [-ReturnOnlyURL] [-Private] 
[-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] 
[-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
        Dynamic?                     true
        Accept wildcard characters?  false
    -SpectateOnly
        Do not start a new game, just watch the AI play
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
###	GenXdev.Queries.Webbrowser<hr/>

##	Open-MovieQuote
````PowerShell
Open-MovieQuote                      --> moviequote
````

### SYNTAX
````PowerShell
Open-MovieQuote [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-StackOverflowQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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

&nbsp;<hr/>
###	GenXdev.Queries.Websites<hr/>

##	Open-GameOfLife
````PowerShell
Open-GameOfLife                      --> conway, gameoflife
````

### SYNTAX
````PowerShell
Open-GameOfLife [[-Monitor] <int>] [-ReturnURL] [-ReturnOnlyURL] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X <int>] 
[-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] 
[-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
Open-YabAIBattle [[-Monitor] <int>] [-SpectateOnly] [-ReturnURL] [-ReturnOnlyURL] 
[-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height 
<int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
        Dynamic?                     true
        Accept wildcard characters?  false
    -SpectateOnly
        Do not start a new game, just watch the AI play
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
Open-Yab [[-Monitor] <int>] [-SpectateOnly] [-ReturnURL] [-ReturnOnlyURL] [-Private] 
[-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] 
[-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
        Dynamic?                     true
        Accept wildcard characters?  false
    -SpectateOnly
        Do not start a new game, just watch the AI play
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
Open-ViralSimulation [[-Monitor] <int>] [-ReturnURL] [-ReturnOnlyURL] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X <int>] 
[-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] 
[-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
Open-Timeline [[-Theme] {[All] | VanGoghSkies | MonetMoods | PicassoPulse | DaliDreams | 
KandinskyKaleidoscope | PollockPoints | HokusaiWaves | EscherEchoes | WarholWaves | 
KlimtKaleidoscope | MiroMirage | RothkoRhythms | SeuratStipples | RembrandtRadiance | 
VermeerVisions | BoschBizarre | TurnerTwilight | FridaFeelings | CezanneContours | 
GauguinGlow | RenoirReflections}] [[-Language] {English | Kotava | Arabic | German | 
Spanish | French | Italian | Japanese | Korean | Dutch | Polish | Portuguese | Russian | 
Thai | Turkish | Ukrainian | Vietnamese | Yiddish | Chinese | [All]}] [-Monitor <int>] 
[-ReturnURL] [-ReturnOnlyURL] [-DragedNodeBackground <string>] [-FocusedNodeBackground 
<string>] [-FocusedNodeForeground <string>] [-UnFocusedNodeBackground <string>] 
[-UnFocusedNodeForeground <string>] [-BorderLightColor <string>] [-BorderDarkColor 
<string>] [-BorderWidth <int>] [-RotationDelaySeconds <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X <int>] [-Y 
<int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] [-AcceptLang 
<string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -BorderDarkColor <string>
        Overwrite the default css border-dark-color colorstyle
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -BorderLightColor <string>
        Overwrite the default css border-light-color colorstyle
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -BorderWidth <int>
        Overwrite the default width for painting the node borders
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -DragedNodeBackground <string>
        Overwrite the css-color-style for painting the currently dragged node's background
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
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
    -FocusedNodeBackground <string>
        Overwrite the css-color-style for painting the focused node's (In center) background
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -FocusedNodeForeground <string>
        Overwrite the css-color-style for painting the focused node's (in center) foreground 
        text
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
        Override default browser language, or select [All] for rotation of all languages every 
        minute
        Required?                    false
        Position?                    1
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
    -NoBrowserExtensions
        Prevent loading of browser extensions
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      de, ne, NoExtensions
        Dynamic?                     true
        Accept wildcard characters?  false
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
        Dynamic?                     true
        Accept wildcard characters?  false
    -RotationDelaySeconds <int>
        Overwrite the default width for the background rotation delay
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -Theme <string>
        Selects All or limit the theme to a specific one, default = PicassoPulse
        Required?                    false
        Position?                    0
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
        Dynamic?                     true
        Accept wildcard characters?  false
    -UnFocusedNodeBackground <string>
        Overwrite the css-color-style for painting the focused node's (In center) background
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        Accept wildcard characters?  false
    -UnFocusedNodeForeground <string>
        Overwrite the css-color-style for painting the unfocused node's (in center) foreground 
        text
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

##	Open-GenXdevAppCatalog
````PowerShell
Open-GenXdevAppCatalog               --> appcatalog
````

### SYNTAX
````PowerShell
Open-GenXdevAppCatalog [[-Monitor] <int>] [-ReturnURL] [-ReturnOnlyURL] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X <int>] 
[-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] 
[-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
Open-GameOfLife [[-Monitor] <int>] [-ReturnURL] [-ReturnOnlyURL] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height <int>] [-X <int>] 
[-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoBrowserExtensions] 
[-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
###	GenXdev.Queries.Webbrowser<hr/>

##	Open-SimularWebSiteInfo
````PowerShell
Open-SimularWebSiteInfo              --> simularsite
````

### SYNTAX
````PowerShell
Open-SimularWebSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.Webbrowser<hr/>

##	Open-YoutubeQuery
````PowerShell
Open-YoutubeQuery                    --> youtube
````

### SYNTAX
````PowerShell
Open-YoutubeQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-WolframAlphaQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
    Opens a Wikipedia query in a webbrowser, in a configurable manner, using commandline 
    switches

### PARAMETERS
    -Queries <String[]>
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Monitor <Int32>
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
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
Open-WikipediaNLQuery [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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
Open-WhoisHostSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] [-Edge] 
[-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height <int>] [-X 
<int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] 
[<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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

##	Open-WebsiteAndPerformQuery
````PowerShell
Open-WebsiteAndPerformQuery
````

### SYNOPSIS
    Opens a webpage in a webbrowser and performs a query

### SYNTAX
````PowerShell
Open-WebsiteAndPerformQuery [-Url] <String> [-Queries] <String[]> [-Monitor <Int32>] 
[<CommonParameters>]
````

### DESCRIPTION
    Opens a website by Url in the webbrowser, it types in a query and presses enter.

### PARAMETERS
    -Url <String>
        The url of the website to open
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Queries <String[]>
        The query to perform
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Aliases                      
        Accept wildcard characters?  false
    -Monitor <Int32>
        Required?                    false
        Position?                    named
        Default value                -1
        Accept pipeline input?       false
        Aliases                      
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
Open-WaybackMachineSiteInfo [-Queries] <string[]> [-Monitor <int>] [-Private] [-Force] 
[-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-FullScreen] [-Width <int>] [-Height 
<int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] 
[-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] 
[-NewWindow] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
        Accept wildcard characters?  false
    -Queries <string[]>
        The query to perform
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName, FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      None
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

&nbsp;<hr/>
###	GenXdev.Queries.Text<hr/>

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
        Aliases                      
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216). 

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.Websites<hr/>

##	Open-YabAIBattle
````PowerShell
Open-YabAIBattle                     --> yabbattle
````

### SYNTAX
````PowerShell
Open-YabAIBattle [[-Monitor] <int>] [-SpectateOnly] [-ReturnURL] [-ReturnOnlyURL] 
[-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Width <int>] [-Height 
<int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] 
[-NoBrowserExtensions] [-AcceptLang <string>] [-PassThru] [<CommonParameters>]
````

### PARAMETERS
    -AcceptLang <string>
        Set the browser accept-lang http header
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      lang, locale
        Dynamic?                     true
        Accept wildcard characters?  false
    -All
        Opens in all registered modern browsers
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
    -Force
        Force enable debugging port, stopping existing browsers if needed
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = 
        Configured secondary monitor
        Required?                    false
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      m, mon
        Dynamic?                     false
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
    -PassThru
        Returns a [System.Diagnostics.Process] object of the browserprocess
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     true
        Accept wildcard characters?  false
    -Private
        Opens in incognito/private browsing mode
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      incognito, inprivate
        Dynamic?                     true
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
        Do not open webbrowser, just return the url
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
        Dynamic?                     true
        Accept wildcard characters?  false
    -SpectateOnly
        Do not start a new game, just watch the AI play
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
