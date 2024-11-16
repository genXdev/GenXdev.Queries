
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

                                    $line = "`r`n" + $PSItem.SubString("Get-".Length, $PSItem.Length - "Get-HostSiteSummary".Length) + ":`r`n";
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

                        $line = "`r`n" + $PSItem.SubString("Get-".Length, $PSItem.Length - "Get-Summary".Length) + ":`r`n";
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

