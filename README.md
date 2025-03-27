<hr/>

<img src="powershell.jpg" alt="GenXdev" width="50%"/>

<hr/>

### NAME
    GenXdev.Queries
### SYNOPSIS
    A Windows PowerShell module for finding resources and information on the internet
[![GenXdev.Queries](https://img.shields.io/powershellgallery/v/GenXdev.Queries.svg?style=flat-square&label=GenXdev.Queries)](https://www.powershellgallery.com/packages/GenXdev.Queries/) [![License](https://img.shields.io/github/license/genXdev/GenXdev.Queries?style=flat-square)](./LICENSE)

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
| [Open-CloudLLMChat](#Open-CloudLLMChat) | ask |  |
| [Open-DeepSearchQuery](#Open-DeepSearchQuery) | aideepseek, askdeepsearch | Opens a X Grok query in a webbrowser |
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
| [Open-GithubQuery](#Open-GithubQuery) | qgit | Opens a Github repository search query in a web browser. |
| [Open-GoogleQuery](#Open-GoogleQuery) |  | Opens a Google query in a web browser with configurable settings. |
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
| [Open-ViralSimulation](#Open-ViralSimulation) | viral | Opens a viral simulation game in a web browser. |
| [Open-Yab](#Open-Yab) | yab | Opens the YAB game in a web browser with configurable settings. |
| [Open-YabAIBattle](#Open-YabAIBattle) | yabbattle | Opens the YabAI Battle game in a web browser. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Queries<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Queries.AI<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Queries.Text<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Queries.Webbrowser<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

&nbsp;<hr/>
###	GenXdev.Queries.Websites<hr/> 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
 

<br/><hr/><hr/><br/>
