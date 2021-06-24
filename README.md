<hr/>

![](https://genxdev.net/Powershell.jpg)

<hr/>

## NAME

    GenXdev.Queries

## SYNOPSIS

    A collection of cmdLets that help finding resources and information on the internet

## CmdLets and aliases
````Powershell
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

    Get-NextAffirmations                                    -> WhatAboutIt
    Get-NextJoke                                            -> TellAJoke

````
## TYPE
    PowerShell Module

## DEPENDENCIES
    GenXdev.Helpers, GenXdev.Webbrowser

## INSTALLATION
````Powershell

    Install-Module "GenXdev.Queries" -Force
    Import-Module "GenXdev.Queries"

````

<br/><hr/><hr/><hr/><hr/><br/>

# Cmdlets
### NAME
    Get-Gpt3DutchSummary
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
### NOTES
````PowerShell
    To use this Cmdlet, you need to set $Global:GPT3ApiKey variable

    e.g.
        Set-Variable -Name "GPT3ApiKey" -Value "your-api-key" -Scope "Global"
````
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
### NOTES
````PowerShell
    To use this Cmdlet, you need to set $Global:GPT3ApiKey variable

    e.g.
        Set-Variable -Name "GPT3ApiKey" -Value "your-api-key" -Scope "Global"
````
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
### NOTES
````PowerShell
    To use this Cmdlet, you need to set $Global:GPT3ApiKey variable

    e.g.
        Set-Variable -Name "GPT3ApiKey" -Value "your-api-key" -Scope "Global"
````
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Get-NextAffirmations
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
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Get-NextJoke
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
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Get-WikipediaSummary
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-AllPossibleQueries
### SYNTAX
````PowerShell
Open-AllPossibleQueries [-Queries] <string[]> [<CommonParameters>]
````
### PARAMETERS
    -Queries <string[]>
        Required?                    true
        Position?                    0
        Accept pipeline input?       true (ByValue, ByPropertyName,
        FromRemainingArguments)
        Parameter set name           (All)
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-AllPossibleTextQueries
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-BuiltWithSiteInfo
### SYNTAX
````PowerShell
Open-BuiltWithSiteInfo [-Queries] <string[]> [-Monitor <int>]
                       [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
                       [-FullScreen] [-Left] [-Right] [-Top] [-Bottom]
                       ( [-ApplicationMode] | [-Private] | [-NewWindow] )
                       [-NoBrowserExtensions] [-RestoreFocus] [<CommonParameters>]
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
        Aliases                      b
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
        Aliases                      fs
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      l
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-GithubQuery
### SYNTAX
````PowerShell
Open-GithubQuery [-Queries] <string[]> [-Language <string>] [-Monitor <int>]
                 [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
                 [-FullScreen] [-Left] [-Right] [-Top] [-Bottom]
                 ( [-ApplicationMode] | [-Private] | [-NewWindow] )
                 [-NoBrowserExtensions] [-RestoreFocus] [<CommonParameters>]
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
        Aliases                      b
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
        Aliases                      fs
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
        Aliases                      l
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-GoogleQuery
### SYNTAX
````PowerShell
Open-GoogleQuery [-Queries] <string[]> [-Monitor <int>]
                 [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
                 [-FullScreen] [-Left] [-Right] [-Top] [-Bottom]
                 ( [-ApplicationMode] | [-Private] | [-NewWindow] )
                 [-NoBrowserExtensions] [-RestoreFocus] [<CommonParameters>]
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
        Aliases                      b
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
        Aliases                      fs
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      l
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-GoogleSiteInfo
### SYNTAX
````PowerShell
Open-GoogleSiteInfo [-Queries] <string[]> [-Private]
                    [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
                    [-FullScreen] [-Left] [-Right] [-Top]
                    [-Bottom] ( [-ApplicationMode] | [-Private] | [-NewWindow] ) [-RestoreFocus]
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
        Aliases                      b
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
        Aliases                      fs
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      l
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-IMDBQuery
### SYNTAX
````PowerShell
Open-IMDBQuery [-Queries] <string[]> [-Monitor <int>]
               [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
               [-FullScreen] [-Left] [-Right] [-Top] [-Bottom]
               ( [-ApplicationMode] | [-Private] | [-NewWindow] )
               [-NoBrowserExtensions] [-RestoreFocus] [<CommonParameters>]
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
        Aliases                      b
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
        Aliases                      fs
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      l
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-SimularWebSiteInfo
### SYNTAX
````PowerShell
Open-SimularWebSiteInfo [-Queries] <string[]> [-Monitor <int>]
                        [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
                        [-FullScreen] [-Left] [-Right] [-Top] [-Bottom]
                        ( [-ApplicationMode] | [-Private] | [-NewWindow] )
                        [-NoBrowserExtensions] [-RestoreFocus] [<CommonParameters>]
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
        Aliases                      b
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
        Aliases                      fs
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      l
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-StackOverflowQuery
### SYNTAX
````PowerShell
Open-StackOverflowQuery [-Queries] <string[]> [-Monitor <int>]
                        [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
                        [-FullScreen] [-Left] [-Right] [-Top] [-Bottom]
                        ( [-ApplicationMode] | [-Private] | [-NewWindow] )
                        [-NoBrowserExtensions] [-RestoreFocus] [<CommonParameters>]
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
        Aliases                      b
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
        Aliases                      fs
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      l
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-WaybackMachineSiteInfo
### SYNTAX
````PowerShell
Open-WaybackMachineSiteInfo [-Queries] <string[]> [-Monitor <int>]
                            [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
                            [-FullScreen] [-Left] [-Right] [-Top] [-Bottom]
                            ( [-ApplicationMode] | [-Private] | [-NewWindow] )
                            [-NoBrowserExtensions] [-RestoreFocus] [<CommonParameters>]
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
        Aliases                      b
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
        Aliases                      fs
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      l
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-WhoisHostSiteInfo
### SYNTAX
````PowerShell
Open-WhoisHostSiteInfo [-Queries] <string[]> [-Monitor <int>]
                       [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
                       [-FullScreen] [-Left] [-Right] [-Top] [-Bottom]
                       ( [-ApplicationMode] | [-Private] | [-NewWindow] )
                       [-NoBrowserExtensions] [-RestoreFocus] [<CommonParameters>]
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
        Aliases                      b
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
        Aliases                      fs
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      l
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-WikipediaNLQuery
### SYNTAX
````PowerShell
Open-WikipediaNLQuery [-Queries] <string[]> [-Monitor <int>]
                      [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
                      [-FullScreen] [-Left] [-Right] [-Top] [-Bottom]
                      ( [-ApplicationMode] | [-Private] | [-NewWindow] )
                      [-NoBrowserExtensions] [-RestoreFocus] [<CommonParameters>]
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
        Aliases                      b
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
        Aliases                      fs
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      l
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-WikipediaQuery
### SYNTAX
````PowerShell
Open-WikipediaQuery [-Queries] <string[]> [-Monitor <int>]
                    [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
                    [-FullScreen] [-Left] [-Right] [-Top] [-Bottom]
                    ( [-ApplicationMode] | [-Private] | [-NewWindow] )
                    [-NoBrowserExtensions] [-RestoreFocus] [<CommonParameters>]
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
        Aliases                      b
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
        Aliases                      fs
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      l
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-WolframAlphaQuery
### SYNTAX
````PowerShell
Open-WolframAlphaQuery [-Queries] <string[]> [-Monitor <int>]
                       [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
                       [-FullScreen] [-Left] [-Right] [-Top] [-Bottom]
                       ( [-ApplicationMode] | [-Private] | [-NewWindow] )
                       [-NoBrowserExtensions] [-RestoreFocus] [<CommonParameters>]
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
        Aliases                      b
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
        Aliases                      fs
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      l
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).
<br/><hr/><hr/><hr/><hr/><br/>
### NAME
    Open-YoutubeQuery
### SYNTAX
````PowerShell
Open-YoutubeQuery [-Queries] <string[]> [-Monitor <int>]
                  [ ([-Edge] [-Chrome] [-Chromium] [-Firefox]) | [-All]]
                  [-FullScreen] [-Left] [-Right] [-Top] [-Bottom]
                  ( [-ApplicationMode] | [-Private] | [-NewWindow] )
                  [-NoBrowserExtensions] [-RestoreFocus] [<CommonParameters>]
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
        Aliases                      b
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
        Aliases                      fs
        Dynamic?                     true
        Accept wildcard characters?  false
    -Left
        Place browser window on the left side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      l
        Dynamic?                     true
        Accept wildcard characters?  false
    -Monitor <int>
        The monitor to use, 0 = default, -1 is discard
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
        Aliases                      Value, Name, Text
        Dynamic?                     false
        Accept wildcard characters?  false
    -RestoreFocus
        Restore Powershell window focus
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
        Aliases                      r
        Dynamic?                     true
        Accept wildcard characters?  false
    -Top
        Place browser window on the top side of the screen
        Required?                    false
        Position?                    Named
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      t
        Dynamic?                     true
        Accept wildcard characters?  false
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and Variable. For more information, see
        about_CommonParameters
        (https://go.microsoft.com/fwlink/?LinkID=113216).