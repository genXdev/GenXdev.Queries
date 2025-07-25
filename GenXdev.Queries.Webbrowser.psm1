if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}


. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Clear-YoutubeWatched.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Copy-PDFsFromGoogleQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Get-GoogleSearchResultUrls.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-AllGoogleLinks.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-AllYoutubeVideos.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-BingQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-BuiltWithSiteInfo.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-GithubQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-GoogleQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-GoogleSiteInfo.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-IMDBQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-InstantStreetViewQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-MovieQuote.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-SearchEngine.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-SimularWebSiteInfo.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-StackOverflowQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-WaybackMachineSiteInfo.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-WebsiteAndPerformQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-WhoisHostSiteInfo.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-WikipediaNLQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-WikipediaQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-WolframAlphaQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Webbrowser\Open-YoutubeQuery.ps1"
