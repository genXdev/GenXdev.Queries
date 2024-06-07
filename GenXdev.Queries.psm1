
###############################################################################

function Open-AllPossibleQueries {

    # DESCRIPTION Open-AllPossibleQueries: Open-AllPossibleQueries: Executes all Cmdlets that handle webpage queries

    [Alias("qq")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ###############################################################################

        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard, -2 = Configured secondary monitor, -2 = Configured secondary monitor"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        Write-Verbose "Open-AllPossibleQueries Monitor = $Monitor"

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ($PSBoundParameters.ContainsKey("Queries")) {

            $PSBoundParameters.Remove("Queries") | Out-Null;
        }

        if ($PSBoundParameters.ContainsKey("Monitor") -eq $false) {

            $PSBoundParameters.Add("Monitor", $Monitor);
        }

        foreach ($Query in $Queries) {

            try {

                [Uri] $uri = $null;

                $q = $Query.Trim("`"").Trim("'");
                $isUri = (

                    [Uri]::TryCreate($q, "absolute", [ref] $uri) -or (
                        $Query.ToLowerInvariant().StartsWith("www.") -and
                        [Uri]::TryCreate("http://$q", "absolute", [ref] $uri)
                    )
                ) -and $uri.IsWellFormedOriginalString() -and $uri.Scheme -like "http*";

                if ($isUri) {

                    Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
                    ForEach-Object Name |
                    ForEach-Object -Process {

                        if ($isUri -and $PSItem.EndsWith("SiteInfo") -and $PSItem.StartsWith("Open-")) {

                            Invoke-Expression "$PSItem $($uri.DnsSafeHost)"

                            if ($PSItem.EndsWith("HostSiteInfo") -eq $false) {

                                $safeUrl = $Query.Split("#")[0];

                                if ($Uri.Query.Length -gt 0) {

                                    $safeUrl = $safeUrl.Replace($Uri.Query, "");
                                }

                                try {
                                    if ($PSBoundParameters.ContainsKey("Url") -eq $false) {

                                        $PSBoundParameters.Add("Url", $safeUrl) | Out-Null;
                                    }

                                    & $PSItem @PSBoundParameters
                                    $PSBoundParameters.Remove("Url") | Out-Null;

                                }
                                Catch {
                                    Write-Warning "
                                      $($_.Exception) $($_.InvocationInfo.PositionMessage)
                                      $($_.InvocationInfo.Line)
                                  "
                                }

                            }
                        }
                    }
                    return;
                }
            }
            catch {
                throw $PSItem
            }

            if ($PSBoundParameters.ContainsKey("Url")) {

                $PSBoundParameters.Remove("Url") | Out-Null;
            }

            Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
            ForEach-Object Name |
            ForEach-Object -Process {

                if ($PSItem.EndsWith("Query") -and $PSItem.StartsWith("Open-")) {

                    $Query = $Query.Replace("`"", "```"");
                    try {
                        if ($PSBoundParameters.ContainsKey("Queries")) {

                            $PSBoundParameters.Remove("Queries") | Out-Null;
                        }

                        $PSBoundParameters.Add("Queries", @($Query)) | Out-Null;
                        & $PSItem @PSBoundParameters
                        $PSBoundParameters.Remove("Queries") | Out-Null;
                    }
                    Catch {
                        Write-Warning "
                          $($_.Exception) $($_.InvocationInfo.PositionMessage)
                          $($_.InvocationInfo.Line)
                      "
                    }
                }
            }
        }
    }
}

###############################################################################

<#
.SYNOPSIS
Executes all Text query Cmdlets in parallel

.DESCRIPTION
Executes all Text query Cmdlets in parallel and shows the results

.PARAMETER Queries
The query to perform
#>
function Open-AllPossibleTextQueries {

    [CmdletBinding()]
    [Alias("qqq")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        foreach ($Query in $Queries) {

            try {

                Clear-Host

                [Uri] $uri = $null;

                $q = $Query.Trim("`"").Trim("'");
                $isUri = (

                    [Uri]::TryCreate($q, "absolute", [ref] $uri) -or (
                        $Query.ToLowerInvariant().StartsWith("www.") -and
                        [Uri]::TryCreate("http://$q", "absolute", [ref] $uri)
                    )
                ) -and $uri.IsWellFormedOriginalString() -and $uri.Scheme -like "http*";

                if ($isUri) {

                    "`r`nSearched for URL : $Query" | Write-Host -ForegroundColor "DarkGreen"

                    Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
                    ForEach-Object Name |
                    ForEach-Object -ThrottleLimit 64 -Parallel {

                        if ($using:isUri -and $PSItem.EndsWith("SiteSummary") -and $PSItem.StartsWith("Get-")) {

                            try {

                                "`r`n" + $PSItem.SubString("Get-".Length, $PSItem.Length - "Get-SiteSummary".Length) + ":" | Write-Host -ForegroundColor "Blue"

                                $exp = Invoke-Expression "$PSItem $($using:uri.DnsSafeHost)"
                                Write-Output $exp

                                if ($PSItem.EndsWith("HostSiteSummary") -eq $false) {

                                    $safeUrl = ($using:Query).Split("#")[0];

                                    if ($using:Uri.Query.Length -gt 0) {

                                        $safeUrl = $safeUrl.Replace($using:Uri.Query, "");
                                    }

                                    $line = "`r`n" + $PSItem.SubString("Get-".Length, $PSItem.Length - "Get-HostSiteSummary".Length).Replace("Gpt3", "Generative Pre-trained Transformer 3 (GPT-3) - ") + ":`r`n";
                                    $line = $line + (Invoke-Expression "$PSItemsafeUrl") + "`r`n"

                                    Write-Output $line;
                                }
                            }
                            Catch {

                            }
                        }
                    }
                    return;
                }
            }
            catch {
                throw $PSItem
            }

            "`r`nSearched for: $Query" | Write-Host -ForegroundColor "DarkGreen"

            Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
            ForEach-Object Name |
            ForEach-Object -ThrottleLimit 64 -Parallel {

                if ($PSItem.EndsWith("Summary") -and $PSItem.StartsWith("Get-")) {

                    try {

                        $line = "`r`n" + $PSItem.SubString("Get-".Length, $PSItem.Length - "Get-Summary".Length).Replace("Gpt3", "Generative Pre-trained Transformer 3 (GPT-3) - ") + ":`r`n";
                        $line = $line + (Invoke-Expression "$PSItem $using:Query") + "`r`n"

                        Write-Output $line;
                    }
                    catch {

                    }
                }
            } |
            ForEach-Object {

                $lines = $PSItem.Split("`r`n", [System.StringSplitOptions]::RemoveEmptyEntries);
                "`r`n$($lines[0])" | Write-Host -ForegroundColor Yellow;
                $lines | Select-Object -Skip 1 | Write-Output
            }

            "`r`n-------------" | Write-Host -ForegroundColor "DarkGreen"
        }
    }
}

###############################################################################

<#
.SYNOPSIS
Executes a background polling script in a previously selected webbrowser tab.

.DESCRIPTION
Executes a background polling script in a previously selected webbrowser tab.

.PARAMETER Scripts
The scripts to load

.PARAMETER Callback
A scriptblock that gets executed each time the tab has been polled

.NOTES
Requires the Windows 10+ Operating System
#>
function Invoke-WebbrowserTabPollingScript {

    [CmdletBinding()]

    param(
        [Parameter(
            Position = 0,
            Mandatory = $false,
            HelpMessage = "A string containing javascript, a url or a file reference to a javascript file",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true)
        ]
        [Alias('FullName')]
        [object[]] $Scripts,

        [parameter(
            HelpMessage = "An optional url to navigate to, before polling starts"
        )]
        [string] $InitialUrl = $null,

        [parameter(
            Mandatory = $false
        )] [ScriptBlock] $Callback = $null
    )

    Start-ThreadJob -InitializationScript { Import-Module GenXdev.Queries; } -ScriptBlock {

        param ($Scripts, $Reference, $InitialUrl)

        $Global:data = @{

            urls  = @();
            query = $Query
        }

        Select-WebbrowserTab -ByReference $Reference

        if (![string]::IsNullOrWhiteSpace($InitialUrl)) {

            Invoke-WebbrowserEvaluation "document.location.href='$InitialUrl'" -NoAutoSelectTab | Out-Null
        }

        do {
            Start-Sleep 1 | Out-Null

            Invoke-WebbrowserEvaluation -Scripts $Scripts -NoAutoSelectTab | Out-Null

            if ($null -ne $Callback) {

                try {
                    Invoke-Command -ScriptBlock $Callback -ErrorAction SilentlyContinue
                }
                catch {

                    Write-Warning $PSItem.Exception
                }

                Select-WebbrowserTab -ByReference $Reference
            }
        }
        while ($Global:data.more)

    } -ArgumentList($Scripts, (Get-ChromiumSessionReference), $InitialUrl)
}

###############################################################################

<#
.SYNOPSIS
Helper function for allowing different commandline parsing for query parameters

.DESCRIPTION
Helper function for allowing different commandline parsing for query parameters
#>
function Build-InvocationArguments {

    [CmdletBinding()]

    param(
        [parameter(Mandatory, Position = 0)]
        $InvocationInfo,

        [parameter(Mandatory = $false, Position = 1)]
        [string[]] $Arguments = @(),

        [parameter(Mandatory = $false, Position = 2)]
        [switch] $SingleString
    )

    begin {

        $ParameterInfo = $InvocationInfo.MyCommand.Parameters.GetEnumerator() | Select-Object -First 1
        $ParameterNameAndAliases = @($ParameterInfo.Key) + $ParameterInfo.Value.Aliases;
        $SingleString = ($SingleString -eq $true) -or ($ParameterInfo.Value.ParameterType -eq [string]);
    }

    process {

        function getArgumentCount($InvocationInfo, $Container) {

            $argumentCount = 1;
            $argumentToSkip = 0;

            foreach ($argument in $Container) {

                if ($argument.StartsWith("-")) {

                    $argumentName = $argument.Substring(1).Trim();
                    foreach ($keyValue in $InvocationInfo.MyCommand.Parameters.GetEnumerator()) {

                        $match = $keyValue.Key -like $argumentName;

                        if (!$match) {

                            foreach ($alias in $keyValue.Value.Aliases) {

                                if ($alias -like $argumentName) {
                                    $match = $true;
                                    break;
                                }
                            }
                        }

                        if ($match) {

                            $argumentToSkip = 2;
                            if ($keyValue.Value.SwitchParameter) {

                                $argumentToSkip = 1;
                            }

                            break;
                        }
                    }
                }

                if ($argumentToSkip -gt 0) {

                    $argumentToSkip = $argumentToSkip - 1;
                    continue;
                }

                if ($argument.Contains(",")) {

                    $parts = $argument.Split(",");

                    $argumentCount += $parts.Length - 1;
                }
            }

            return $argumentCount;
        }

        function hasParamOrQuotes($InvocationInfo, $Container) {

            $argumentToSkip = 0;

            foreach ($argument in $Container) {

                if ($argument.StartsWith("-")) {

                    $argumentName = $argument.Substring(1).Trim();
                    foreach ($keyValue in $InvocationInfo.MyCommand.Parameters.GetEnumerator()) {

                        $match = $keyValue.Key -like $argumentName;

                        if (!$match) {

                            foreach ($alias in $keyValue.Value.Aliases) {

                                if ($alias -like $argumentName) {
                                    $match = $true;
                                    break;
                                }
                            }
                        }

                        if ($match) {

                            $argumentToSkip = 2;
                            if ($keyValue.Value.SwitchParameter) {

                                $argumentToSkip = 1;
                            }

                            break;
                        }
                    }
                }

                if ($argumentToSkip -gt 0) {

                    $argumentToSkip = $argumentToSkip - 1;
                    continue;
                }

                if ($argument -like "@*") { return $true; }
                if ($argument -like "*`"*") { return $true; }
                if ($argument -like "*`$*") { return $true; }
                if ($argument -like "(*") { return $true; }

                continue;
            }

            return $false
        }

        function getSingleLineText($InvocationInfo, $Container) {

            $argumentText = [System.Text.StringBuilder]::new();
            $argumentToSkip = 0;

            foreach ($argument in $Container) {

                if ($argument.StartsWith("-")) {

                    $argumentName = $argument.Substring(1).Trim();
                    foreach ($keyValue in $InvocationInfo.MyCommand.Parameters.GetEnumerator()) {

                        $match = $keyValue.Key -like $argumentName;

                        if (!$match) {

                            foreach ($alias in $keyValue.Value.Aliases) {

                                if ($alias -like $argumentName) {
                                    $match = $true;
                                    break;
                                }
                            }
                        }

                        if ($match) {

                            $argumentToSkip = 2;
                            if ($keyValue.Value.SwitchParameter) {

                                $argumentToSkip = 1;
                            }

                            break;
                        }
                    }
                }

                if ($argumentToSkip -gt 0) {

                    $argumentToSkip = $argumentToSkip - 1;
                    continue;
                }

                if ($argument.Contains(",")) {

                    $parts = $argument.Split(",");

                    for ($i = 0; $i -lt $parts.Length; $i++) {

                        if ($i -gt 0) {

                            $currentIndex++;
                        }

                        $argumentText.Append("$($parts[$i]) ") | Out-Null
                    }
                }
                else {

                    $argumentText.Append("$argument ") | Out-Null
                }
            }

            return $argumentText.ToString().Trim();
        }

        function getArgument($InvocationInfo, $Container, [int] $argumentIndex) {

            [int] $currentIndex = 0;

            $argumentText = [System.Text.StringBuilder]::new();
            $argumentToSkip = 0;

            foreach ($argument in $Container) {

                if ($argument.StartsWith("-")) {

                    $argumentName = $argument.Substring(1).Trim();
                    foreach ($keyValue in $InvocationInfo.MyCommand.Parameters.GetEnumerator()) {

                        $match = $keyValue.Key -like $argumentName;

                        if (!$match) {

                            foreach ($alias in $keyValue.Value.Aliases) {

                                if ($alias -like $argumentName) {
                                    $match = $true;
                                    break;
                                }
                            }
                        }

                        if ($match) {

                            $argumentToSkip = 2;
                            if ($keyValue.Value.SwitchParameter) {

                                $argumentToSkip = 1;
                            }

                            break;
                        }
                    }
                }

                if ($argumentToSkip -gt 0) {

                    $argumentToSkip = $argumentToSkip - 1;
                    continue;
                }

                if ($argument.Contains(",")) {

                    $parts = $argument.Split(",");

                    for ($i = 0; $i -lt $parts.Length; $i++) {

                        if ($i -gt 0) {

                            $currentIndex++;
                        }

                        if ($currentIndex -eq $argumentIndex) {

                            $argumentText.Append("$($parts[$i]) ") | Out-Null
                        }

                        if ($currentIndex -gt $argumentIndex) {

                            break;
                        }
                    }
                }
                else {

                    if ($currentIndex -eq $argumentIndex) {

                        $argumentText.Append("$argument ") | Out-Null
                    }
                }

                if ($currentIndex -gt $argumentIndex) {

                    break;
                }
            }

            return $argumentText.ToString().Trim();
        }

        $InInvocation = $false
        [bool] $HasNamedParameterSupplied = $false;
        $Container = $InvocationInfo.Line.Split("|;".ToCharArray()) | ForEach-Object -ErrorAction SilentlyContinue {

            $LinePart = $PSItem;
            $LinePart.Split(" ", [System.StringSplitOptions]::RemoveEmptyEntries) | ForEach-Object -ErrorAction SilentlyContinue {

                if ($InInvocation) {

                    $PSItem
                }

                if (!$InInvocation -and $PSItem -eq $InvocationInfo.InvocationName) {

                    $InInvocation = $true;
                }
            }

            if ($InInvocation) {

                foreach ($paramName in $ParameterNameAndAliases ) {
                    if ($PSItem -like "-$paramName") {

                        $HasNamedParameterSupplied = $true;
                    }
                }

                return;
            }
        }

        if ($HasNamedParameterSupplied) {

            return $Arguments;
        }

        [int] $argumentCount = getArgumentCount $InvocationInfo $Container
        [string] $singlelineStringValue = getSingleLineText $InvocationInfo $Container

        if ((hasParamOrQuotes $InvocationInfo $Container) -or ($argumentCount -lt 2 -and [string]::IsNullOrWhiteSpace($singlelineStringValue))) {

            return $Arguments
        }

        if ($SingleString -eq $true) {

            return $singlelineStringValue
        }

        $results = [System.Collections.Generic.List[string]]::new();

        for ([int] $argumentIndex = 0; $argumentIndex -lt $argumentCount; $argumentIndex++) {

            $results.Add((getArgument $InvocationInfo $Container $argumentIndex))
        }

        return $results.ToArray();
    }
}

################################################################################
################################################################################
################################################################################

# SIG # Begin signature block
# MIIbzgYJKoZIhvcNAQcCoIIbvzCCG7sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCA+W8yCczIM4YMi
# wdeGXxk64+hhcbU8cnkstBCj4VyR6aCCFhswggMOMIIB9qADAgECAhBwxOfTiuon
# hU3SZf3YwpWAMA0GCSqGSIb3DQEBCwUAMB8xHTAbBgNVBAMMFEdlblhkZXYgQXV0
# aGVudGljb2RlMB4XDTI0MDUwNTIwMzEzOFoXDTM0MDUwNTE4NDEzOFowHzEdMBsG
# A1UEAwwUR2VuWGRldiBBdXRoZW50aWNvZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IB
# DwAwggEKAoIBAQDAD4JXwna5uBAYw54JXXscQPSos9pMeeyV99hvQPs6IcQ/wIXs
# zQ0xdkMGlzo1Nvldyqwa6+OXMyHsZM2D6QA1WjRoTzjT432hlGJT3VrP3R9cvOfg
# sAnVLpZy+4uty2fh5o8NEk4tmULOXDPZBT6NOoRjRCyt+KwCL8yioCFWa/7pqpG0
# niyJka8rhOVQLg8sZ+n5DrSihs1o3PyN28mZLendSbL9Y06cbqadL0J6sn31sw6e
# tpLOToIj1DXQbID0ejeafONHYJ3cKBrQ0TG7aoK8dte4X+iQQuDgA/l7ATxCjC7V
# 18vKRQXzSjvBQvNuWSw6DX2b7sc7dzC9v2T1AgMBAAGjRjBEMA4GA1UdDwEB/wQE
# AwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUf8ZHrsKtJB9RD6z2
# x2Txu7wQ1/4wDQYJKoZIhvcNAQELBQADggEBAK/GgNjLVhQkhbFMrJUt3nFfYa2a
# iP/+U2vapwtqeyNBreMiTYwtqkULEPotRlRCMZ+k8kwRhv1bsR82MXK1H74DKcTM
# 0gu62RxOMXz8ij0BjXW9axEWqYGAbbP0EoNyoBzqiLYqXkwCXqIFsywuDZO4QY3D
# 1c+NEKVnPnhf/gufOUrlugklExh9i4QagCSlUObYAa9yBhcoxOHzN0v6mN+I7EjM
# sVsydPsk3NshubldpNSavFUcF477l21eM5F1bFXGTJGgGq9k1/drpILe5e4oLy9w
# sxmdnqpyvbwtPe2+LZx0XSlR5vCfYFih6eV8fNcgvMmAKAcuIuKxKwJkAscwggWN
# MIIEdaADAgECAhAOmxiO+dAt5+/bUOIIQBhaMA0GCSqGSIb3DQEBDAUAMGUxCzAJ
# BgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5k
# aWdpY2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBD
# QTAeFw0yMjA4MDEwMDAwMDBaFw0zMTExMDkyMzU5NTlaMGIxCzAJBgNVBAYTAlVT
# MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j
# b20xITAfBgNVBAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAL/mkHNo3rvkXUo8MCIwaTPswqclLskhPfKK
# 2FnC4SmnPVirdprNrnsbhA3EMB/zG6Q4FutWxpdtHauyefLKEdLkX9YFPFIPUh/G
# nhWlfr6fqVcWWVVyr2iTcMKyunWZanMylNEQRBAu34LzB4TmdDttceItDBvuINXJ
# IB1jKS3O7F5OyJP4IWGbNOsFxl7sWxq868nPzaw0QF+xembud8hIqGZXV59UWI4M
# K7dPpzDZVu7Ke13jrclPXuU15zHL2pNe3I6PgNq2kZhAkHnDeMe2scS1ahg4AxCN
# 2NQ3pC4FfYj1gj4QkXCrVYJBMtfbBHMqbpEBfCFM1LyuGwN1XXhm2ToxRJozQL8I
# 11pJpMLmqaBn3aQnvKFPObURWBf3JFxGj2T3wWmIdph2PVldQnaHiZdpekjw4KIS
# G2aadMreSx7nDmOu5tTvkpI6nj3cAORFJYm2mkQZK37AlLTSYW3rM9nF30sEAMx9
# HJXDj/chsrIRt7t/8tWMcCxBYKqxYxhElRp2Yn72gLD76GSmM9GJB+G9t+ZDpBi4
# pncB4Q+UDCEdslQpJYls5Q5SUUd0viastkF13nqsX40/ybzTQRESW+UQUOsxxcpy
# FiIJ33xMdT9j7CFfxCBRa2+xq4aLT8LWRV+dIPyhHsXAj6KxfgommfXkaS+YHS31
# 2amyHeUbAgMBAAGjggE6MIIBNjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTs
# 1+OC0nFdZEzfLmc/57qYrhwPTzAfBgNVHSMEGDAWgBRF66Kv9JLLgjEtUYunpyGd
# 823IDzAOBgNVHQ8BAf8EBAMCAYYweQYIKwYBBQUHAQEEbTBrMCQGCCsGAQUFBzAB
# hhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYBBQUHMAKGN2h0dHA6Ly9j
# YWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RDQS5jcnQw
# RQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lD
# ZXJ0QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZI
# hvcNAQEMBQADggEBAHCgv0NcVec4X6CjdBs9thbX979XB72arKGHLOyFXqkauyL4
# hxppVCLtpIh3bb0aFPQTSnovLbc47/T/gLn4offyct4kvFIDyE7QKt76LVbP+fT3
# rDB6mouyXtTP0UNEm0Mh65ZyoUi0mcudT6cGAxN3J0TU53/oWajwvy8LpunyNDzs
# 9wPHh6jSTEAZNUZqaVSwuKFWjuyk1T3osdz9HNj0d1pcVIxv76FQPfx2CWiEn2/K
# 2yCNNWAcAgPLILCsWKAOQGPFmCLBsln1VWvPJ6tsds5vIy30fnFqI2si/xK4VC0n
# ftg62fC2h5b9W9FcrBjDTZ9ztwGpn1eqXijiuZQwggauMIIElqADAgECAhAHNje3
# JFR82Ees/ShmKl5bMA0GCSqGSIb3DQEBCwUAMGIxCzAJBgNVBAYTAlVTMRUwEwYD
# VQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAf
# BgNVBAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDAeFw0yMjAzMjMwMDAwMDBa
# Fw0zNzAzMjIyMzU5NTlaMGMxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2Vy
# dCwgSW5jLjE7MDkGA1UEAxMyRGlnaUNlcnQgVHJ1c3RlZCBHNCBSU0E0MDk2IFNI
# QTI1NiBUaW1lU3RhbXBpbmcgQ0EwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDGhjUGSbPBPXJJUVXHJQPE8pE3qZdRodbSg9GeTKJtoLDMg/la9hGhRBVC
# X6SI82j6ffOciQt/nR+eDzMfUBMLJnOWbfhXqAJ9/UO0hNoR8XOxs+4rgISKIhjf
# 69o9xBd/qxkrPkLcZ47qUT3w1lbU5ygt69OxtXXnHwZljZQp09nsad/ZkIdGAHvb
# REGJ3HxqV3rwN3mfXazL6IRktFLydkf3YYMZ3V+0VAshaG43IbtArF+y3kp9zvU5
# EmfvDqVjbOSmxR3NNg1c1eYbqMFkdECnwHLFuk4fsbVYTXn+149zk6wsOeKlSNbw
# sDETqVcplicu9Yemj052FVUmcJgmf6AaRyBD40NjgHt1biclkJg6OBGz9vae5jtb
# 7IHeIhTZgirHkr+g3uM+onP65x9abJTyUpURK1h0QCirc0PO30qhHGs4xSnzyqqW
# c0Jon7ZGs506o9UD4L/wojzKQtwYSH8UNM/STKvvmz3+DrhkKvp1KCRB7UK/BZxm
# SVJQ9FHzNklNiyDSLFc1eSuo80VgvCONWPfcYd6T/jnA+bIwpUzX6ZhKWD7TA4j+
# s4/TXkt2ElGTyYwMO1uKIqjBJgj5FBASA31fI7tk42PgpuE+9sJ0sj8eCXbsq11G
# deJgo1gJASgADoRU7s7pXcheMBK9Rp6103a50g5rmQzSM7TNsQIDAQABo4IBXTCC
# AVkwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUuhbZbU2FL3MpdpovdYxq
# II+eyG8wHwYDVR0jBBgwFoAU7NfjgtJxXWRM3y5nP+e6mK4cD08wDgYDVR0PAQH/
# BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMIMHcGCCsGAQUFBwEBBGswaTAkBggr
# BgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEEGCCsGAQUFBzAChjVo
# dHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0
# LmNydDBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5jb20v
# RGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNybDAgBgNVHSAEGTAXMAgGBmeBDAEEAjAL
# BglghkgBhv1sBwEwDQYJKoZIhvcNAQELBQADggIBAH1ZjsCTtm+YqUQiAX5m1tgh
# QuGwGC4QTRPPMFPOvxj7x1Bd4ksp+3CKDaopafxpwc8dB+k+YMjYC+VcW9dth/qE
# ICU0MWfNthKWb8RQTGIdDAiCqBa9qVbPFXONASIlzpVpP0d3+3J0FNf/q0+KLHqr
# hc1DX+1gtqpPkWaeLJ7giqzl/Yy8ZCaHbJK9nXzQcAp876i8dU+6WvepELJd6f8o
# VInw1YpxdmXazPByoyP6wCeCRK6ZJxurJB4mwbfeKuv2nrF5mYGjVoarCkXJ38SN
# oOeY+/umnXKvxMfBwWpx2cYTgAnEtp/Nh4cku0+jSbl3ZpHxcpzpSwJSpzd+k1Os
# Ox0ISQ+UzTl63f8lY5knLD0/a6fxZsNBzU+2QJshIUDQtxMkzdwdeDrknq3lNHGS
# 1yZr5Dhzq6YBT70/O3itTK37xJV77QpfMzmHQXh6OOmc4d0j/R0o08f56PGYX/sr
# 2H7yRp11LB4nLCbbbxV7HhmLNriT1ObyF5lZynDwN7+YAN8gFk8n+2BnFqFmut1V
# wDophrCYoCvtlUG3OtUVmDG0YgkPCr2B2RP+v6TR81fZvAT6gt4y3wSJ8ADNXcL5
# 0CN/AAvkdgIm2fBldkKmKYcJRyvmfxqkhQ/8mJb2VVQrH4D6wPIOK+XW+6kvRBVK
# 5xMOHds3OBqhK/bt1nz8MIIGwjCCBKqgAwIBAgIQBUSv85SdCDmmv9s/X+VhFjAN
# BgkqhkiG9w0BAQsFADBjMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQs
# IEluYy4xOzA5BgNVBAMTMkRpZ2lDZXJ0IFRydXN0ZWQgRzQgUlNBNDA5NiBTSEEy
# NTYgVGltZVN0YW1waW5nIENBMB4XDTIzMDcxNDAwMDAwMFoXDTM0MTAxMzIzNTk1
# OVowSDELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMSAwHgYD
# VQQDExdEaWdpQ2VydCBUaW1lc3RhbXAgMjAyMzCCAiIwDQYJKoZIhvcNAQEBBQAD
# ggIPADCCAgoCggIBAKNTRYcdg45brD5UsyPgz5/X5dLnXaEOCdwvSKOXejsqnGfc
# YhVYwamTEafNqrJq3RApih5iY2nTWJw1cb86l+uUUI8cIOrHmjsvlmbjaedp/lvD
# 1isgHMGXlLSlUIHyz8sHpjBoyoNC2vx/CSSUpIIa2mq62DvKXd4ZGIX7ReoNYWyd
# /nFexAaaPPDFLnkPG2ZS48jWPl/aQ9OE9dDH9kgtXkV1lnX+3RChG4PBuOZSlbVH
# 13gpOWvgeFmX40QrStWVzu8IF+qCZE3/I+PKhu60pCFkcOvV5aDaY7Mu6QXuqvYk
# 9R28mxyyt1/f8O52fTGZZUdVnUokL6wrl76f5P17cz4y7lI0+9S769SgLDSb495u
# ZBkHNwGRDxy1Uc2qTGaDiGhiu7xBG3gZbeTZD+BYQfvYsSzhUa+0rRUGFOpiCBPT
# aR58ZE2dD9/O0V6MqqtQFcmzyrzXxDtoRKOlO0L9c33u3Qr/eTQQfqZcClhMAD6F
# aXXHg2TWdc2PEnZWpST618RrIbroHzSYLzrqawGw9/sqhux7UjipmAmhcbJsca8+
# uG+W1eEQE/5hRwqM/vC2x9XH3mwk8L9CgsqgcT2ckpMEtGlwJw1Pt7U20clfCKRw
# o+wK8REuZODLIivK8SgTIUlRfgZm0zu++uuRONhRB8qUt+JQofM604qDy0B7AgMB
# AAGjggGLMIIBhzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADAWBgNVHSUB
# Af8EDDAKBggrBgEFBQcDCDAgBgNVHSAEGTAXMAgGBmeBDAEEAjALBglghkgBhv1s
# BwEwHwYDVR0jBBgwFoAUuhbZbU2FL3MpdpovdYxqII+eyG8wHQYDVR0OBBYEFKW2
# 7xPn783QZKHVVqllMaPe1eNJMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwz
# LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNFJTQTQwOTZTSEEyNTZUaW1l
# U3RhbXBpbmdDQS5jcmwwgZAGCCsGAQUFBwEBBIGDMIGAMCQGCCsGAQUFBzABhhho
# dHRwOi8vb2NzcC5kaWdpY2VydC5jb20wWAYIKwYBBQUHMAKGTGh0dHA6Ly9jYWNl
# cnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNFJTQTQwOTZTSEEyNTZU
# aW1lU3RhbXBpbmdDQS5jcnQwDQYJKoZIhvcNAQELBQADggIBAIEa1t6gqbWYF7xw
# jU+KPGic2CX/yyzkzepdIpLsjCICqbjPgKjZ5+PF7SaCinEvGN1Ott5s1+FgnCvt
# 7T1IjrhrunxdvcJhN2hJd6PrkKoS1yeF844ektrCQDifXcigLiV4JZ0qBXqEKZi2
# V3mP2yZWK7Dzp703DNiYdk9WuVLCtp04qYHnbUFcjGnRuSvExnvPnPp44pMadqJp
# ddNQ5EQSviANnqlE0PjlSXcIWiHFtM+YlRpUurm8wWkZus8W8oM3NG6wQSbd3lqX
# TzON1I13fXVFoaVYJmoDRd7ZULVQjK9WvUzF4UbFKNOt50MAcN7MmJ4ZiQPq1JE3
# 701S88lgIcRWR+3aEUuMMsOI5ljitts++V+wQtaP4xeR0arAVeOGv6wnLEHQmjNK
# qDbUuXKWfpd5OEhfysLcPTLfddY2Z1qJ+Panx+VPNTwAvb6cKmx5AdzaROY63jg7
# B145WPR8czFVoIARyxQMfq68/qTreWWqaNYiyjvrmoI1VygWy2nyMpqy0tg6uLFG
# hmu6F/3Ed2wVbK6rr3M66ElGt9V/zLY4wNjsHPW2obhDLN9OTH0eaHDAdwrUAuBc
# YLso/zjlUlrWrBciI0707NMX+1Br/wd3H3GXREHJuEbTbDJ8WC9nR2XlG3O2mflr
# LAZG70Ee8PBf4NvZrZCARK+AEEGKMYIFCTCCBQUCAQEwMzAfMR0wGwYDVQQDDBRH
# ZW5YZGV2IEF1dGhlbnRpY29kZQIQcMTn04rqJ4VN0mX92MKVgDANBglghkgBZQME
# AgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3DQEJAzEM
# BgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEVMC8GCSqG
# SIb3DQEJBDEiBCDTuTPdRWoWpRl6Ea3IOwGIq373Z7J2BjWUZ6YY6x7zQjANBgkq
# hkiG9w0BAQEFAASCAQAK/9581V7u3rdCPOKtqZJ9Tt3LwPI/F06fmfvUGgaIOjI1
# iRVlLKkPVvYXOaA9GBPotXXlvS417ZVQzqluXmbJ71jAEhhMhDos3hKcAg7g5JWM
# mCM8KSmcd6pi86pvCnUvkFkCxjrtydJcAYYRX9gKVBGlk9UPK+LCglaLM3ViFJ1u
# vIzjD0hyEd5/zXG/IfbMDSy67o1bMXrWGY69Tz9W+2d3ZGJXblMTPEzlx6uBgXop
# ANwH65SWs/UpIv3r5HtLF2Xt1FhOBr63cUqhkhPLJEEhYrj0f/ff//Dekai3IUia
# 98YWCevYKbvDb09qmWC61Ra27+rXJxiiSL3sbJzooYIDIDCCAxwGCSqGSIb3DQEJ
# BjGCAw0wggMJAgEBMHcwYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0
# LCBJbmMuMTswOQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hB
# MjU2IFRpbWVTdGFtcGluZyBDQQIQBUSv85SdCDmmv9s/X+VhFjANBglghkgBZQME
# AgEFAKBpMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8X
# DTI0MDYwNzA5MTkzOFowLwYJKoZIhvcNAQkEMSIEIEa1YKGvLbJu1LBTUHxdjSe6
# ECw+f7spPokESvndsVy2MA0GCSqGSIb3DQEBAQUABIICAGjDgdzsN91q5nqNFZfk
# wCV6BKd0it47GYZlyxvKfgHwrjFqNnJpNmhjYACdyatfA5sfB5Ep4yP/cDsCwQeP
# zvnmv2DBGvTQomPi+7CWaTy0RdgoPAJU99H18bIrE+qk0ISKTgwjq+iw0kqZWOL7
# x4Pc3+Z1HyznchKo1uLr+cgvBd6Vo9lyFYa98UMbw0+7NGwwccc/+9TmnSiawh4G
# 3TmaK5J11TUWagxwanytaqTSFVchCuPqPfWL91GjmyyDKIvD0lC2wCH1KZBiKUpx
# V1m6Mkm/ZSJTCfhrgwghdN3U4UIR6zM20p39vDeJUDZ3AH1ZS7cJ0zzw7v6pM7mP
# OQx8psRdMrJ2DpJaF1MPlY+aH1pwOzoFzB5cBDP0v7hC8SpU/r1OaEPK8uJLQEfz
# KZM1IIZHvXhBCjACShAmqLpesrUDvTVyZNg7Yb8/0J6muGonoxg2L1AwQdP6RtuK
# uhYay3rxUeJVOYemfTHBMoXdJQFYzg4SDRtv6lYCdKXiv8P2OcWjiSWWz0o2Jtt5
# Idwq3Ll65UPJsVSt6XtaxLUUSP1XYkY6RPLuMNnRYFvuKOB4m4x48aCa2VYCjb4L
# UTtxpKi866mUGz7dId8GsKi6EVuQhlzBVB4DNf3Zz3qEgv0Gh+oFlybAEZW2Hanv
# nuJDnBWWW8Lr9nPeoXyjCFGx
# SIG # End signature block
