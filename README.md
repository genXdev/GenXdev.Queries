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
| [ConvertTo-Uris](#ConvertTo-Uris) |  | Extracts all valid URIs from input text, supporting standard and custom URIschemes like http:, https:, ftp:, magnet:, about:, etc. Returns Uri objects foreach valid URI found. |
| [Invoke-WebbrowserTabPollingScript](#Invoke-WebbrowserTabPollingScript) |  | Continuously executes JavaScript in a browser tab and processes results throughan optional callback. The script runs in a separate thread to prevent blocking. |
| [Open-AllPossibleQueries](#Open-AllPossibleQueries) | qq | Executes all cmdlets that handle webpage queries, processing both URLs and searchterms. For URLs, it performs site-specific queries, and for search terms itexecutes general web queries. |
| [Open-AllPossibleTextQueries](#Open-AllPossibleTextQueries) | qqq | Executes all Text query Cmdlets in parallel and shows the results for eachquery. This function processes URLs and text queries differently, providingappropriate information for each type. |

<hr/>
&nbsp;

### GenXdev.Queries.AI</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Ask](#Ask) |  |  |
| [Open-BingCopilotQuery](#Open-BingCopilotQuery) | aibc | Opens a Bing CoPilot query in the webbrowser. The functionautomatically types the query and submits it. |
| [Open-ChatGPTQuery](#Open-ChatGPTQuery) | aicgpt, askchatgpt | Opens ChatGPT in a web browser, automatically enters the specified query andsubmits it. Supports multiple queries that will be executed usingthe underlying Open-WebsiteAndPerformQuery function. |
| [Open-DeepSearchQuery](#Open-DeepSearchQuery) | aids, askdeepsearch | Opens a X Grok query in the webbrowser, types in the query and presses enter toexecute the search. |
| [Open-GithubCopilotQuery](#Open-GithubCopilotQuery) | aigc, askghcopilot | Opens a Github CoPilot query in the webbrowser and automatically enters thespecified query. The function waits for the page to load before typing the query. |
| [Open-GoogleGeminiQuery](#Open-GoogleGeminiQuery) | aigg, askgemini | Opens a Google Gemini query in the webbrowser, automatically enters the query andsubmits it. This provides a quick way to interact with Google's Gemini AI. |
| [Open-XGrokQuery](#Open-XGrokQuery) | aixg, askxgrok | Opens a X Grok query in the webbrowser, types in the query and presses enter toexecute the search. |

<hr/>
&nbsp;

### GenXdev.Queries.Text</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Get-NextAffirmations](#Get-NextAffirmations) | Get-NextAffirmation, WhatAboutIt | Retrieves an affirmation from the affirmations.dev API and optionally speaks itusing text-to-speech. |
| [Get-WikipediaSummary](#Get-WikipediaSummary) | wikitxt | Queries the Wikipedia API to get a concise summary of the specified topic,removing parenthetical content for improved readability. |

<hr/>
&nbsp;

### GenXdev.Queries.Webbrowser</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Clear-YoutubeWatched](#Clear-YoutubeWatched) |  | This function selects a YouTube tab in the browser and clears the watch historyby resetting the local storage value for watched videos of theOpen-AllYoutubeVideos -> qvideos cmdlet. It requires an openYouTube tab in the browser. |
| [Copy-PDFsFromGoogleQuery](#Copy-PDFsFromGoogleQuery) |  | Performs a Google query in the previously selected webbrowser tab and downloadsall found PDF files into the current directory. Supports multiple queries andlanguage filtering. |
| [Get-GoogleSearchResultUrls](#Get-GoogleSearchResultUrls) | qlinksget | Performs a google search and returns the links |
| [Get-WebLanguageDictionary](#Get-WebLanguageDictionary) |  | Returns a reversed dictionary for all languages supported by Google Search |
| [Open-AllGoogleLinks](#Open-AllGoogleLinks) | qlinks | Performs a google search .Opens 10 tabs each times, pauses until initial tab is revisitedClose initial tab to stop |
| [Open-AllYoutubeVideos](#Open-AllYoutubeVideos) | qvideos, qyt | Opens YouTube videos matching search terms or from various YouTube sections in abrowser window. Provides keyboard controls for video playback and navigation. |
| [Open-BingQuery](#Open-BingQuery) | bq | Opens one or more Bing search queries in a web browser, using configurablebrowser settings and command line switches. |
| [Open-BuiltWithSiteInfo](#Open-BuiltWithSiteInfo) |  | Opens a BuildWith query in a web browser, with configurable monitor settings andbrowser behavior options. |
| [Open-GithubQuery](#Open-GithubQuery) | qgit | Opens a Github query in a webbrowser, allowing configuration through variousparameters. Supports searching by language and monitor selection. |
| [Open-GoogleQuery](#Open-GoogleQuery) |  | Opens one or more Google queries in a web browser, supporting multiple languagesand monitor selection. |
| [Open-GoogleSiteInfo](#Open-GoogleSiteInfo) |  | Opens multiple Google search queries related to site information (site:, link:,related:) in a web browser for the specified domain(s). |
| [Open-IMDBQuery](#Open-IMDBQuery) | imdb | Opens a "Internet Movie Database" query in a web browser, in a configurablemanner, using commandline switches. |
| [Open-InstantStreetViewQuery](#Open-InstantStreetViewQuery) | isv | Opens InstantStreetView queries in a configurable manner using web browsercommand line switches. Supports multiple queries and monitor selection. |
| [Open-MovieQuote](#Open-MovieQuote) | moviequote | Searches for and opens movie quotes using playphrase.me, allowing specificationof monitor and browser settings. |
| [Open-SimularWebSiteInfo](#Open-SimularWebSiteInfo) | simularsite | Opens a "Similar web" query in a web browser in a configurable manner usingcommand line switches. Allows checking website analytics and comparisons. |
| [Open-StackOverflowQuery](#Open-StackOverflowQuery) | qso | Opens one or more Stack Overflow search queries in a web browser, withconfigurable browser and display settings. |
| [Open-WaybackMachineSiteInfo](#Open-WaybackMachineSiteInfo) | wayback | Opens a Waybackmachine query in a web browser, displaying historical versions ofthe specified URL or website. Supports multiple queries and monitor selection. |
| [Open-WebsiteAndPerformQuery](#Open-WebsiteAndPerformQuery) | owaq | Opens a website by URL in the default web browser, enters one or more queriesand submits them. Supports monitor selection and window positioning. |
| [Open-WhoisHostSiteInfo](#Open-WhoisHostSiteInfo) | whois | Opens Whois host information queries in a web browser for domain names or IPaddresses. Supports configurable monitor selection and multiple queries. |
| [Open-WikipediaNLQuery](#Open-WikipediaNLQuery) | wikinl | Opens a 'Wikipedia - The Netherlands' query in a webbrowser, with configurabledisplay options. Supports searching multiple terms and specifying which monitorto display results on. |
| [Open-WikipediaQuery](#Open-WikipediaQuery) | wiki | Opens one or more Wikipedia search queries in a web browser. Supports configurablebrowser behavior and monitor selection. Queries are URL encoded and opened usingthe specified language's Wikipedia domain. |
| [Open-WolframAlphaQuery](#Open-WolframAlphaQuery) | qalpha | Opens one or more Wolfram Alpha queries in a web browser. Supports configurablemonitor selection and browser options through dynamic parameters. |
| [Open-YoutubeQuery](#Open-YoutubeQuery) | youtube | Opens one or more YouTube search queries in a web browser. Supports configurablemonitor selection and browser settings through dynamic parameters inherited fromOpen-Webbrowser cmdlet. |
| [q](#q) |  |  |

<hr/>
&nbsp;

### GenXdev.Queries.Websites</hr>
| Command&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | aliases&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Description |
| --- | --- | --- |
| [Open-GameOfLife](#Open-GameOfLife) | conway, gameoflife | Opens an interactive Conway's Game of Life simulation in a web browser window.Supports monitor selection and provides options for URL handling. |
| [Open-GenXdevAppCatalog](#Open-GenXdevAppCatalog) | appcatalog | Opens the catalog with published GenXdev progressive webapps in a web browser.Opens in application mode with fullscreen enabled by default. |
| [Open-Timeline](#Open-Timeline) | timeline | Opens a web-based interactive timeline that displays temporal information in anartistic theme. Supports multiple languages and visual customization options. |
| [Open-ViralSimulation](#Open-ViralSimulation) | viral | Opens the viral simulation game in a specified web browser with configurablewindow settings. Supports multiple browsers and various display options. |
| [Open-Yab](#Open-Yab) | yab | Opens the YAB game website in a specified browser with various display andbehavior options. Supports different game modes including spectator mode. |
| [Open-YabAIBattle](#Open-YabAIBattle) | yabbattle | This function launches the YabAI Battle game in a web browser with variouscustomization options for window placement, browser selection, and display mode. |

<br/><hr/><hr/><br/>


# Cmdlets

&nbsp;<hr/>
###	GenXdev.Queries<hr/>

##	ConvertTo-Uris
````PowerShell

   ConvertTo-Uris 
````

### SYNOPSIS
    Parses strings for any valid URI. 

### SYNTAX
````PowerShell

   ConvertTo-Uris [[-Text] <String[]>] [<CommonParameters>] 
````

### DESCRIPTION
    Extracts all valid URIs from input text, supporting standard and custom URI 
    schemes like http:, https:, ftp:, magnet:, about:, etc. Returns Uri objects for 
    each valid URI found. 

### PARAMETERS
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

   Invoke-WebbrowserTabPollingScript [[-Scripts] <Object[]>] [[-InitialUrl] <String>] [[-Callback] <ScriptBlock>] [<CommonParameters>] 
````

### DESCRIPTION
    Continuously executes JavaScript in a browser tab and processes results through 
    an optional callback. The script runs in a separate thread to prevent blocking. 

### PARAMETERS
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

### NOTES
````PowerShell

       Requires Windows 10 or later.  
   -------------------------- EXAMPLE 1 --------------------------  
   PS C:\> Invoke-WebbrowserTabPollingScript -Scripts "console.log('polling')" `  
       -InitialUrl "https://example.com" `  
       -Callback { Write-Host "Polled" } 
````

<br/><hr/><hr/><br/>

##	Open-AllPossibleQueries
````PowerShell

   Open-AllPossibleQueries              --> qq 
````

### SYNOPSIS
    Opens all possible query types for given search terms or URLs. 

### SYNTAX
````PowerShell

   Open-AllPossibleQueries [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Executes all cmdlets that handle webpage queries, processing both URLs and search 
    terms. For URLs, it performs site-specific queries, and for search terms it 
    executes general web queries. 

### PARAMETERS
    -Queries <String[]> 
        The search terms or URLs to query. 
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
        Monitor selection: 0=default, -1=discard, -2=secondary monitor. 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-AllPossibleTextQueries
````PowerShell

   Open-AllPossibleTextQueries          --> qqq 
````

### SYNOPSIS
    Executes all Text query Cmdlets in parallel and displays results. 

### SYNTAX
````PowerShell

   Open-AllPossibleTextQueries [-Queries] <String[]> [<CommonParameters>] 
````

### DESCRIPTION
    Executes all Text query Cmdlets in parallel and shows the results for each 
    query. This function processes URLs and text queries differently, providing 
    appropriate information for each type. 

### PARAMETERS
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.AI<hr/>

##	Ask
````PowerShell

   Ask 
````

### SYNTAX
````PowerShell

   Ask [-Queries] <string[]> [[-EndPoint] {BingCopilot | ChatGPT | DeepSearch | GithubCopilot | GoogleGemini | XGrok}] [[-Language]   
   {Afrikaans | Akan | Albanian | Amharic | Arabic | Armenian | Azerbaijani | Basque | Belarusian | Bemba | Bengali | Bihari | Bork, bork,   
   bork! | Bosnian | Breton | Bulgarian | Cambodian | Catalan | Cherokee | Chichewa | Chinese (Simplified) | Chinese (Traditional) |   
   Corsican | Croatian | Czech | Danish | Dutch | Elmer Fudd | English | Esperanto | Estonian | Ewe | Faroese | Filipino | Finnish | French   
   | Frisian | Ga | Galician | Georgian | German | Greek | Guarani | Gujarati | Hacker | Haitian Creole | Hausa | Hawaiian | Hebrew | Hindi   
   | Hungarian | Icelandic | Igbo | Indonesian | Interlingua | Irish | Italian | Japanese | Javanese | Kannada | Kazakh | Kinyarwanda |   
   Kirundi | Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish | Kurdish (Soranî) | Kyrgyz | Laothian | Latin | Latvian | Lingala |   
   Lithuanian | Lozi | Luganda | Luo | Macedonian | Malagasy | Malay | Malayalam | Maltese | Maori | Marathi | Mauritian Creole | Moldavian   
   | Mongolian | Montenegrin | Nepali | Nigerian Pidgin | Northern Sotho | Norwegian | Norwegian (Nynorsk) | Occitan | Oriya | Oromo |   
   Pashto | Persian | Pirate | Polish | Portuguese (Brazil) | Portuguese (Portugal) | Punjabi | Quechua | Romanian | Romansh | Runyakitara   
   | Russian | Scots Gaelic | Serbian | Serbo-Croatian | Sesotho | Setswana | Seychellois Creole | Shona | Sindhi | Sinhalese | Slovak |   
   Slovenian | Somali | Spanish | Spanish (Latin American) | Sundanese | Swahili | Swedish | Tajik | Tamil | Tatar | Telugu | Thai |   
   Tigrinya | Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi | Uighur | Ukrainian | Urdu | Uzbek | Vietnamese | Welsh | Wolof | Xhosa   
   | Yiddish | Yoruba | Zulu}] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <int>] [-FullScreen] [-Width   
   <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions]   
   [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL] [<CommonParameters>] 
````

### PARAMETERS
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
        Do not re-use existing browser window, instead, create a new one 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-BingCopilotQuery
````PowerShell

   Open-BingCopilotQuery                --> aibc 
````

### SYNOPSIS
    Opens a Bing CoPilot query in a webbrowser 

### SYNTAX
````PowerShell

   Open-BingCopilotQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru]   
   [<CommonParameters>] 
````

### DESCRIPTION
    Opens a Bing CoPilot query in the webbrowser. The function 
    automatically types the query and submits it. 

### PARAMETERS
    -Queries <String[]> 
        The query text to submit to Bing Copilot. 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
    Opens a ChatGPT query in a web browser. 

### SYNTAX
````PowerShell

   Open-ChatGPTQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru]   
   [<CommonParameters>] 
````

### DESCRIPTION
    Opens ChatGPT in a web browser, automatically enters the specified query and 
    submits it. Supports multiple queries that will be executed using 
    the underlying Open-WebsiteAndPerformQuery function. 

### PARAMETERS
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-DeepSearchQuery
````PowerShell

   Open-DeepSearchQuery                 --> aids, askdeepsearch 
````

### SYNOPSIS
    Opens a X Grok query in a webbrowser 

### SYNTAX
````PowerShell

   Open-DeepSearchQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru]   
   [<CommonParameters>] 
````

### DESCRIPTION
    Opens a X Grok query in the webbrowser, types in the query and presses enter to 
    execute the search. 

### PARAMETERS
    -Queries <String[]> 
        One or more queries to perform on DeepSearch. 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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

   Open-GithubCopilotQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru]   
   [<CommonParameters>] 
````

### DESCRIPTION
    Opens a Github CoPilot query in the webbrowser and automatically enters the 
    specified query. The function waits for the page to load before typing the query. 

### PARAMETERS
    -Queries <String[]> 
        One or more queries to perform in Github CoPilot 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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

   Open-GoogleGeminiQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru]   
   [<CommonParameters>] 
````

### DESCRIPTION
    Opens a Google Gemini query in the webbrowser, automatically enters the query and 
    submits it. This provides a quick way to interact with Google's Gemini AI. 

### PARAMETERS
    -Queries <String[]> 
        One or more queries to submit to Google Gemini. 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-XGrokQuery
````PowerShell

   Open-XGrokQuery                      --> aixg, askxgrok 
````

### SYNOPSIS
    Opens a X Grok query in a webbrowser 

### SYNTAX
````PowerShell

   Open-XGrokQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru]   
   [<CommonParameters>] 
````

### DESCRIPTION
    Opens a X Grok query in the webbrowser, types in the query and presses enter to 
    execute the search. 

### PARAMETERS
    -Queries <String[]> 
        One or more queries to perform on X Grok. 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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

   Get-NextAffirmations                 --> Get-NextAffirmation, WhatAboutIt 
````

### SYNOPSIS
    Returns a random affirmation text from affirmations.dev API. 

### SYNTAX
````PowerShell

   Get-NextAffirmations [[-Speak]] [<CommonParameters>] 
````

### DESCRIPTION
    Retrieves an affirmation from the affirmations.dev API and optionally speaks it 
    using text-to-speech. 

### PARAMETERS
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Get-WikipediaSummary
````PowerShell

   Get-WikipediaSummary                 --> wikitxt 
````

### SYNOPSIS
    Retrieves a summary of a topic from Wikipedia. 

### SYNTAX
````PowerShell

   Get-WikipediaSummary [-Queries] <String[]> [<CommonParameters>] 
````

### DESCRIPTION
    Queries the Wikipedia API to get a concise summary of the specified topic, 
    removing parenthetical content for improved readability. 

### PARAMETERS
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.Webbrowser<hr/>

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
    by resetting the local storage value for watched videos of the 
    Open-AllYoutubeVideos -> qvideos cmdlet. It requires an open 
    YouTube tab in the browser. 

### PARAMETERS
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
    Downloads PDF files found through Google search results. 

### SYNTAX
````PowerShell

   Copy-PDFsFromGoogleQuery [-Queries] <String[]> [[-Max] <Int32>] [[-Language] <String>] [<CommonParameters>] 
````

### DESCRIPTION
    Performs a Google query in the previously selected webbrowser tab and downloads 
    all found PDF files into the current directory. Supports multiple queries and 
    language filtering. 

### PARAMETERS
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

##	Open-AllYoutubeVideos
````PowerShell

   Open-AllYoutubeVideos                --> qvideos, qyt 
````

### SYNOPSIS
    Opens and controls YouTube videos in a browser window with keyboard shortcuts. 

### SYNTAX
````PowerShell

   Open-AllYoutubeVideos [[-Queries] <String[]>] [-Subscriptions] [-WatchLater] [-Recommended] [-Trending] [-Private] [-Edge] [-Chrome]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-AcceptLang <String>] [<CommonParameters>] 
````

### DESCRIPTION
    Opens YouTube videos matching search terms or from various YouTube sections in a 
    browser window. Provides keyboard controls for video playback and navigation. 

### PARAMETERS
    -Queries <String[]> 
        YouTube search terms to find videos for. Opens all videos matching each term. 
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
    -AcceptLang <String> 
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

<br/><hr/><hr/><br/>

##	Open-BingQuery
````PowerShell

   Open-BingQuery                       --> bq 
````

### SYNOPSIS
    Opens a Bing search query in a web browser. 

### SYNTAX
````PowerShell

   Open-BingQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens one or more Bing search queries in a web browser, using configurable 
    browser settings and command line switches. 

### PARAMETERS
    -Queries <String[]> 
        The search queries to perform on Bing. 
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
        The monitor to display the browser on: 
        0 = default monitor 
        -1 = discard window 
        -2 = configured secondary monitor 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-BuiltWithSiteInfo
````PowerShell

   Open-BuiltWithSiteInfo 
````

### SYNOPSIS
    Opens BuiltWith website queries in a web browser. 

### SYNTAX
````PowerShell

   Open-BuiltWithSiteInfo [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens a BuildWith query in a web browser, with configurable monitor settings and 
    browser behavior options. 

### PARAMETERS
    -Queries <String[]> 
        The website URLs or domains to query on BuiltWith.com. 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-GithubQuery
````PowerShell

   Open-GithubQuery                     --> qgit 
````

### SYNOPSIS
    Opens a Github repository search query in a web browser. 

### SYNTAX
````PowerShell

   Open-GithubQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens a Github query in a webbrowser, allowing configuration through various 
    parameters. Supports searching by language and monitor selection. 

### PARAMETERS
    -Queries <String[]> 
        The search queries to perform on Github repositories. 
        Required?                    true 
        Position?                    1 
        Default value                 
        Accept pipeline input?       true (ByValue, ByPropertyName) 
        Aliases                       
        Accept wildcard characters?  false 
    -Language <String> 
        Optional programming language filter for the search. 
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
        The monitor to display results on. 0 = default, -1 = discard, -2 = secondary. 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-GoogleQuery
````PowerShell

   Open-GoogleQuery 
````

### SYNOPSIS
    Opens a Google query in a web browser with configurable settings. 

### SYNTAX
````PowerShell

   Open-GoogleQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens one or more Google queries in a web browser, supporting multiple languages 
    and monitor selection. 

### PARAMETERS
    -Queries <String[]> 
        The search terms to query on Google. 
        Required?                    true 
        Position?                    1 
        Default value                 
        Accept pipeline input?       true (ByValue, ByPropertyName) 
        Aliases                       
        Accept wildcard characters?  false 
    -Language <String> 
        The language for Google search results. 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-GoogleSiteInfo
````PowerShell

   Open-GoogleSiteInfo 
````

### SYNOPSIS
    Opens Google site information queries in a web browser. 

### SYNTAX
````PowerShell

   Open-GoogleSiteInfo [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens multiple Google search queries related to site information (site:, link:, 
    related:) in a web browser for the specified domain(s). 

### PARAMETERS
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-IMDBQuery
````PowerShell

   Open-IMDBQuery                       --> imdb 
````

### SYNOPSIS
    Opens an IMDB search query in a web browser. 

### SYNTAX
````PowerShell

   Open-IMDBQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens a "Internet Movie Database" query in a web browser, in a configurable 
    manner, using commandline switches. 

### PARAMETERS
    -Queries <String[]> 
        The search terms to query on IMDB. 
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
        The monitor to display the browser on. 0 = default, -1 is discard, 
        -2 = Configured secondary monitor. 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-InstantStreetViewQuery
````PowerShell

   Open-InstantStreetViewQuery          --> isv 
````

### SYNOPSIS
    Opens InstantStreetView queries in a web browser. 

### SYNTAX
````PowerShell

   Open-InstantStreetViewQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox]   
   [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens InstantStreetView queries in a configurable manner using web browser 
    command line switches. Supports multiple queries and monitor selection. 

### PARAMETERS
    -Queries <String[]> 
        The location queries to view in InstantStreetView. 
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
        The monitor to display results on. 0 = default, -1 = discard, -2 = secondary. 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-MovieQuote
````PowerShell

   Open-MovieQuote                      --> moviequote 
````

### SYNOPSIS
    Opens a video of a movie quote in a web browser. 

### SYNTAX
````PowerShell

   Open-MovieQuote [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Searches for and opens movie quotes using playphrase.me, allowing specification 
    of monitor and browser settings. 

### PARAMETERS
    -Queries <String[]> 
        The movie quote or phrase to search for. 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-SimularWebSiteInfo
````PowerShell

   Open-SimularWebSiteInfo              --> simularsite 
````

### SYNOPSIS
    Opens SimilarWeb website information for specified URLs in a web browser. 

### SYNTAX
````PowerShell

   Open-SimularWebSiteInfo [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens a "Similar web" query in a web browser in a configurable manner using 
    command line switches. Allows checking website analytics and comparisons. 

### PARAMETERS
    -Queries <String[]> 
        The website URLs to analyze on SimilarWeb. 
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
        The monitor to use for displaying the browser window. 
        0 = default, -1 = discard, -2 = configured secondary monitor. 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-StackOverflowQuery
````PowerShell

   Open-StackOverflowQuery              --> qso 
````

### SYNOPSIS
    Opens Stack Overflow search queries in a web browser. 

### SYNTAX
````PowerShell

   Open-StackOverflowQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens one or more Stack Overflow search queries in a web browser, with 
    configurable browser and display settings. 

### PARAMETERS
    -Queries <String[]> 
        The search queries to perform on Stack Overflow. 
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
        The monitor to display results on: 
        0 = default 
        -1 = discard 
        -2 = configured secondary monitor 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-WaybackMachineSiteInfo
````PowerShell

   Open-WaybackMachineSiteInfo          --> wayback 
````

### SYNOPSIS
    Opens WaybackMachine site information in a web browser. 

### SYNTAX
````PowerShell

   Open-WaybackMachineSiteInfo [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox]   
   [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens a Waybackmachine query in a web browser, displaying historical versions of 
    the specified URL or website. Supports multiple queries and monitor selection. 

### PARAMETERS
    -Queries <String[]> 
        The URL or website addresses to search in the Wayback Machine. 
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
        The monitor to display the browser on. Default is -1. 
        0 = default monitor 
        -1 = discard window 
        -2 = configured secondary monitor 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-WebsiteAndPerformQuery
````PowerShell

   Open-WebsiteAndPerformQuery          --> owaq 
````

### SYNOPSIS
    Opens a webpage in a webbrowser and performs one or more queries. 

### SYNTAX
````PowerShell

   Open-WebsiteAndPerformQuery [-Url] <String> [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome]   
   [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left]   
   [-Right] [-Top] [-Bottom] [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow]   
   [<CommonParameters>] 
````

### DESCRIPTION
    Opens a website by URL in the default web browser, enters one or more queries 
    and submits them. Supports monitor selection and window positioning. 

### PARAMETERS
    -Url <String> 
        The URL of the website to open. 
        Required?                    true 
        Position?                    1 
        Default value                 
        Accept pipeline input?       true (ByPropertyName) 
        Aliases                       
        Accept wildcard characters?  false 
    -Queries <String[]> 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-WhoisHostSiteInfo
````PowerShell

   Open-WhoisHostSiteInfo               --> whois 
````

### SYNOPSIS
    Opens a Whois host information query in a web browser. 

### SYNTAX
````PowerShell

   Open-WhoisHostSiteInfo [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens Whois host information queries in a web browser for domain names or IP 
    addresses. Supports configurable monitor selection and multiple queries. 

### PARAMETERS
    -Queries <String[]> 
        One or more domain names or IP addresses to look up Whois information for. 
        Accepts pipeline input. 
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
        Specifies which monitor to display results on: 
        0 = Default monitor 
        -1 = Discard 
        -2 = Configured secondary monitor 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-WikipediaNLQuery
````PowerShell

   Open-WikipediaNLQuery                --> wikinl 
````

### SYNOPSIS
    Opens Dutch Wikipedia searches in a web browser. 

### SYNTAX
````PowerShell

   Open-WikipediaNLQuery [-Queries] <String[]> [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>]   
   [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]   
   [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL]   
   [<CommonParameters>] 
````

### DESCRIPTION
    Opens a 'Wikipedia - The Netherlands' query in a webbrowser, with configurable 
    display options. Supports searching multiple terms and specifying which monitor 
    to display results on. 

### PARAMETERS
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-WikipediaQuery
````PowerShell

   Open-WikipediaQuery                  --> wiki 
````

### SYNOPSIS
    Opens a Wikipedia query in a webbrowser. 

### SYNTAX
````PowerShell

   Open-WikipediaQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens one or more Wikipedia search queries in a web browser. Supports configurable 
    browser behavior and monitor selection. Queries are URL encoded and opened using 
    the specified language's Wikipedia domain. 

### PARAMETERS
    -Queries <String[]> 
        One or more search terms to look up on Wikipedia. Multiple queries will open in 
        separate browser instances. 
        Required?                    true 
        Position?                    1 
        Default value                 
        Accept pipeline input?       true (ByValue, ByPropertyName) 
        Aliases                       
        Accept wildcard characters?  false 
    -Language <String> 
        The Wikipedia language to use for searches. Defaults to English. 
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
        Specifies which monitor to use (0=default, -1=discard, -2=secondary) 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-WolframAlphaQuery
````PowerShell

   Open-WolframAlphaQuery               --> qalpha 
````

### SYNOPSIS
    Opens a Wolfram Alpha query in a web browser. 

### SYNTAX
````PowerShell

   Open-WolframAlphaQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens one or more Wolfram Alpha queries in a web browser. Supports configurable 
    monitor selection and browser options through dynamic parameters. 

### PARAMETERS
    -Queries <String[]> 
        The search queries to perform on Wolfram Alpha. Accepts multiple queries. 
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
        Specifies which monitor to display results on: 
        0 = Default monitor 
        -1 = Discard window 
        -2 = Configured secondary monitor 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	Open-YoutubeQuery
````PowerShell

   Open-YoutubeQuery                    --> youtube 
````

### SYNOPSIS
    Opens YouTube search queries in a web browser. 

### SYNTAX
````PowerShell

   Open-YoutubeQuery [-Queries] <String[]> [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All]   
   [-Monitor <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### DESCRIPTION
    Opens one or more YouTube search queries in a web browser. Supports configurable 
    monitor selection and browser settings through dynamic parameters inherited from 
    Open-Webbrowser cmdlet. 

### PARAMETERS
    -Queries <String[]> 
        One or more search terms to query on YouTube. Each query will open in a separate 
        browser instance. 
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
        Specifies which monitor to display the browser on: 
        0 = default monitor 
        -1 = discard window 
        -2 = configured secondary monitor 
        1-99 = specific monitor number 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

##	q
````PowerShell

   q 
````

### SYNTAX
````PowerShell

   q [-Queries] <string[]> [[-EndPoint] {Bing | Github | Google | IMDB | InstantStreetView | StackOverflow | Wikipedia | WikipediaNL |   
   WolframAlpha | Youtube}] [[-Language] {Afrikaans | Akan | Albanian | Amharic | Arabic | Armenian | Azerbaijani | Basque | Belarusian |   
   Bemba | Bengali | Bihari | Bork, bork, bork! | Bosnian | Breton | Bulgarian | Cambodian | Catalan | Cherokee | Chichewa | Chinese   
   (Simplified) | Chinese (Traditional) | Corsican | Croatian | Czech | Danish | Dutch | Elmer Fudd | English | Esperanto | Estonian | Ewe   
   | Faroese | Filipino | Finnish | French | Frisian | Ga | Galician | Georgian | German | Greek | Guarani | Gujarati | Hacker | Haitian   
   Creole | Hausa | Hawaiian | Hebrew | Hindi | Hungarian | Icelandic | Igbo | Indonesian | Interlingua | Irish | Italian | Japanese |   
   Javanese | Kannada | Kazakh | Kinyarwanda | Kirundi | Klingon | Kongo | Korean | Krio (Sierra Leone) | Kurdish | Kurdish (Soranî) |   
   Kyrgyz | Laothian | Latin | Latvian | Lingala | Lithuanian | Lozi | Luganda | Luo | Macedonian | Malagasy | Malay | Malayalam | Maltese   
   | Maori | Marathi | Mauritian Creole | Moldavian | Mongolian | Montenegrin | Nepali | Nigerian Pidgin | Northern Sotho | Norwegian |   
   Norwegian (Nynorsk) | Occitan | Oriya | Oromo | Pashto | Persian | Pirate | Polish | Portuguese (Brazil) | Portuguese (Portugal) |   
   Punjabi | Quechua | Romanian | Romansh | Runyakitara | Russian | Scots Gaelic | Serbian | Serbo-Croatian | Sesotho | Setswana |   
   Seychellois Creole | Shona | Sindhi | Sinhalese | Slovak | Slovenian | Somali | Spanish | Spanish (Latin American) | Sundanese | Swahili   
   | Swedish | Tajik | Tamil | Tatar | Telugu | Thai | Tigrinya | Tonga | Tshiluba | Tumbuka | Turkish | Turkmen | Twi | Uighur | Ukrainian   
   | Urdu | Uzbek | Vietnamese | Welsh | Wolof | Xhosa | Yiddish | Yoruba | Zulu}] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium]   
   [-Firefox] [-All] [-Monitor <int>] [-FullScreen] [-Width <int>] [-Height <int>] [-X <int>] [-Y <int>] [-Left] [-Right] [-Top] [-Bottom]   
   [-Centered] [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <string>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL]   
   [-ReturnOnlyURL] [<CommonParameters>] 
````

### PARAMETERS
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
        Do not re-use existing browser window, instead, create a new one 
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
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>

&nbsp;<hr/>
###	GenXdev.Queries.Websites<hr/>

##	Open-GameOfLife
````PowerShell

   Open-GameOfLife                      --> conway, gameoflife 
````

### SYNOPSIS
    Opens Conway's Game of Life simulation in a web browser. 

### SYNTAX
````PowerShell

   Open-GameOfLife [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>]   
   [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]   
   [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL]   
   [-NoFullScreen] [-NoApplicationMode] [<CommonParameters>] 
````

### DESCRIPTION
    Opens an interactive Conway's Game of Life simulation in a web browser window. 
    Supports monitor selection and provides options for URL handling. 

### PARAMETERS
    -Language <String> 
        Required?                    false 
        Position?                    1 
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
        The monitor to display the game on. 
        0 = default monitor 
        -1 = discard display 
        -2 = configured secondary monitor 
        Required?                    false 
        Position?                    named 
        Default value                -2 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        When specified, returns the URL without opening the browser. 
        Required?                    false 
        Position?                    named 
        Default value                False 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -ReturnOnlyURL [<SwitchParameter>] 
        When specified, opens the browser and also returns the URL. 
        Required?                    false 
        Position?                    named 
        Default value                False 
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
    -NoApplicationMode [<SwitchParameter>] 
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

##	Open-GenXdevAppCatalog
````PowerShell

   Open-GenXdevAppCatalog               --> appcatalog 
````

### SYNOPSIS
    Opens the GenXdev progressive webapps catalog in a web browser. 

### SYNTAX
````PowerShell

   Open-GenXdevAppCatalog [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>]   
   [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]   
   [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL]   
   [-NoFullScreen] [-NoApplicationMode] [<CommonParameters>] 
````

### DESCRIPTION
    Opens the catalog with published GenXdev progressive webapps in a web browser. 
    Opens in application mode with fullscreen enabled by default. 

### PARAMETERS
    -Language <String> 
        Required?                    false 
        Position?                    1 
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
        -2 = Configured secondary monitor. 
        Required?                    false 
        Position?                    named 
        Default value                -2 
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
    -AcceptLang <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        Switch to return the URL without opening the browser. 
        Required?                    false 
        Position?                    named 
        Default value                False 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -ReturnOnlyURL [<SwitchParameter>] 
        Switch to open the browser and also return the URL. 
        Required?                    false 
        Position?                    named 
        Default value                False 
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
    -NoApplicationMode [<SwitchParameter>] 
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

##	Open-Timeline
````PowerShell

   Open-Timeline                        --> timeline 
````

### SYNOPSIS
    Opens an interactive timeline showing current time, date, century, and millennium. 

### SYNTAX
````PowerShell

   Open-Timeline [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>] [-NoFullScreen] [-Width <Int32>]   
   [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered] [-NoApplicationMode] [-BrowserExtensions]   
   [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-SpectateOnly] [-ReturnURL] [-ReturnOnlyURL] [[-Theme] <String>]   
   [[-Language] <String>] [-DragedNodeBackground <String>] [-FocusedNodeBackground <String>] [-FocusedNodeForeground <String>]   
   [-UnFocusedNodeBackground <String>] [-UnFocusedNodeForeground <String>] [-BorderLightColor <String>] [-BorderDarkColor <String>]   
   [-BorderWidth <Int32>] [-RotationDelaySeconds <Int32>] [<CommonParameters>] 
````

### DESCRIPTION
    Opens a web-based interactive timeline that displays temporal information in an 
    artistic theme. Supports multiple languages and visual customization options. 

### PARAMETERS
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor 
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
    -NoApplicationMode [<SwitchParameter>] 
        Required?                    false 
        Position?                    named 
        Default value                False 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -BrowserExtensions [<SwitchParameter>] 
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
    -SpectateOnly [<SwitchParameter>] 
        Required?                    false 
        Position?                    named 
        Default value                False 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -ReturnURL [<SwitchParameter>] 
        Do not open webbrowser, just return the url 
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
        Select theme for visualization (default = PicassoPulse) 
        Required?                    false 
        Position?                    1 
        Default value                [All] 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -Language <String> 
        Override default browser language or select [All] for rotation 
        Required?                    false 
        Position?                    2 
        Default value                 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -DragedNodeBackground <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -FocusedNodeBackground <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -FocusedNodeForeground <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -UnFocusedNodeBackground <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -UnFocusedNodeForeground <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -BorderLightColor <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -BorderDarkColor <String> 
        Required?                    false 
        Position?                    named 
        Default value                 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -BorderWidth <Int32> 
        Required?                    false 
        Position?                    named 
        Default value                1 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -RotationDelaySeconds <Int32> 
        Required?                    false 
        Position?                    named 
        Default value                15 
        Accept pipeline input?       false 
        Aliases                       
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

### SYNOPSIS
    Opens a viral simulation game in a web browser. 

### SYNTAX
````PowerShell

   Open-ViralSimulation [[-Language] <String>] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>]   
   [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]   
   [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL]   
   [-NoFullScreen] [-NoApplicationMode] [<CommonParameters>] 
````

### DESCRIPTION
    Opens the viral simulation game in a specified web browser with configurable 
    window settings. Supports multiple browsers and various display options. 

### PARAMETERS
    -Language <String> 
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
        The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor. 
        Required?                    false 
        Position?                    named 
        Default value                -2 
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
    -AcceptLang <String> 
        Set the browser accept-lang http header. 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        Do not re-use existing browser window, create a new one. 
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
        Do not open webbrowser, just return the url. 
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
        Do not open in fullscreen mode. 
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

### SYNOPSIS
    Opens the YAB game in a web browser with configurable settings. 

### SYNTAX
````PowerShell

   Open-Yab [[-Language] <String>] [-SpectateOnly] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor <Int32>]   
   [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]   
   [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL]   
   [-NoFullScreen] [-NoApplicationMode] [<CommonParameters>] 
````

### DESCRIPTION
    Opens the YAB game website in a specified browser with various display and 
    behavior options. Supports different game modes including spectator mode. 

### PARAMETERS
    -Language <String> 
        Required?                    false 
        Position?                    1 
        Default value                 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -SpectateOnly [<SwitchParameter>] 
        Do not start a new game, just watch the AI play. 
        Required?                    false 
        Position?                    named 
        Default value                False 
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
    -AcceptLang <String> 
        Set the browser accept-lang http header. 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        Do not re-use existing browser window, create a new one. 
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
        Do not open webbrowser, just return the url. 
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
        Do not open in fullscreen mode. 
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

### SYNOPSIS
    Opens the YabAI Battle game in a web browser. 

### SYNTAX
````PowerShell

   Open-YabAIBattle [[-Language] <String>] [-SpectateOnly] [-Private] [-Force] [-Edge] [-Chrome] [-Chromium] [-Firefox] [-All] [-Monitor   
   <Int32>] [-FullScreen] [-Width <Int32>] [-Height <Int32>] [-X <Int32>] [-Y <Int32>] [-Left] [-Right] [-Top] [-Bottom] [-Centered]   
   [-ApplicationMode] [-NoBrowserExtensions] [-AcceptLang <String>] [-RestoreFocus] [-NewWindow] [-PassThru] [-ReturnURL] [-ReturnOnlyURL]   
   [-NoFullScreen] [-NoApplicationMode] [<CommonParameters>] 
````

### DESCRIPTION
    This function launches the YabAI Battle game in a web browser with various 
    customization options for window placement, browser selection, and display mode. 

### PARAMETERS
    -Language <String> 
        Required?                    false 
        Position?                    1 
        Default value                 
        Accept pipeline input?       false 
        Aliases                       
        Accept wildcard characters?  false 
    -SpectateOnly [<SwitchParameter>] 
        Do not start a new game, just watch the AI play. 
        Required?                    false 
        Position?                    named 
        Default value                False 
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
    -AcceptLang <String> 
        Set the browser accept-lang http header. 
        Required?                    false 
        Position?                    named 
        Default value                 
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
        Do not re-use existing browser window, instead, create a new one. 
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
        Do not open webbrowser, just return the url. 
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
        Do not open in fullscreen mode. 
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
    <CommonParameters> 
        This cmdlet supports the common parameters: Verbose, Debug, 
        ErrorAction, ErrorVariable, WarningAction, WarningVariable, 
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters     (https://go.microsoft.com/fwlink/?LinkID=113216).  

<br/><hr/><hr/><br/>
