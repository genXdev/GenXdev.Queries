if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}



. "$PSScriptRoot\Functions\GenXdev.Queries.AI\Open-BingCopilotQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.AI\Open-ChatGPTQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.AI\Open-CloudLLMChat.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.AI\Open-DeepSearchQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.AI\Open-GithubCopilotQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.AI\Open-GoogleGeminiQuery.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.AI\Open-XGrokQuery.ps1"
