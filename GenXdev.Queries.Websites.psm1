if (-not $IsWindows) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}

$osVersion = [System.Environment]::OSVersion.Version
$major = $osVersion.Major
$build = $osVersion.Build

if ($major -ne 10) {
    throw "This module only supports Windows 10+ x64 with PowerShell 7.5+ x64"
}


. "$PSScriptRoot\Functions\GenXdev.Queries.Websites\Open-GameOfLife.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Websites\Open-GenXdevAppCatalog.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Websites\Open-Timeline.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Websites\Open-ViralSimulation.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Websites\Open-Yab.ps1"
. "$PSScriptRoot\Functions\GenXdev.Queries.Websites\Open-YabAIBattle.ps1"
