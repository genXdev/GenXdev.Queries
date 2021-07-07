function Build-InvocationArguments {

    param(
        [parameter(Mandatory, Position = 0)]
        $InvocationInfo,

        [parameter(Mandatory, Position = 1)]
        [string[]] $Arguments
    )

    if ($Arguments.Length -gt 1 -and (!!$InvocationInfo) -and
        ![string]::IsNullOrWhiteSpace($InvocationInfo.Line) -and
        ![string]::IsNullOrWhiteSpace($InvocationInfo.InvocationName) -and
        $InvocationInfo.Line.Trim("`r`n`t ").StartsWith($InvocationInfo.InvocationName)
    ) {

        $cmd = $InvocationInfo.Line.Trim("`r`n`t ").Substring($InvocationInfo.InvocationName.Length).Trim();

        if (!$cmd.Contains(",") -and !$cmd.Contains("@") -and !$cmd.Contains("$")) {

            $Arguments = @($cmd);
        }
    }

    $Arguments
}

function Open-AllPossibleTextQueries {

    [CmdletBinding()]
    [Alias("qqq")]

    param(
        [Alias("q", "Value", "Name", "Text")]
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

######################################################################################################################################################
function Open-AllPossibleQueries {

    [CmdletBinding()]
    [Alias("qq")]

    param(
        [Alias("q", "Value", "Name", "Text")]
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
                                    Invoke-Expression "$PSItem '$safeUrl'"
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

            Get-Command -Module "*.Queries" -ErrorAction SilentlyContinue |
            ForEach-Object Name |
            ForEach-Object -Process {

                if ($PSItem.EndsWith("Query") -and $PSItem.StartsWith("Open-")) {

                    $Query = $Query.Replace("`"", "```"");
                    try {
                        Invoke-Expression "$PSItem `"$Query`""
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
######################################################################################################################################################
######################################################################################################################################################
function Open-GoogleQuery {

    [CmdletBinding()]
    [Alias("q")]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.google.com/search?q=$([Uri]::EscapeUriString($Query))";

            Open-Webbrowser @PSBoundParameters
        }
    }
}

######################################################################################################################################################
function Open-WikipediaQuery {

    [CmdletBinding()]
    [Alias("wiki")]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {
        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://en.wikipedia.org/wiki/Special:Search?search=$([Uri]::EscapeUriString($Query))";

            Open-Webbrowser @PSBoundParameters
        }
    }
}
######################################################################################################################################################
function Open-WikipediaNLQuery {

    [CmdletBinding()]
    [Alias("wikinl")]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://nl.wikipedia.org/wiki/Special:Search?search=$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}
######################################################################################################################################################
function Open-YoutubeQuery {

    [CmdletBinding()]
    [Alias("youtube")]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.youtube.com/results?search_query=$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}
######################################################################################################################################################
function Open-IMDBQuery {

    [CmdletBinding()]
    [Alias("imdb")]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.imdb.com/find?q=$([Uri]::EscapeUriString($Query))&ref_=nv_sr_sm="

            Open-Webbrowser @PSBoundParameters
        }
    }
}
######################################################################################################################################################
function Open-StackOverflowQuery {

    [CmdletBinding()]
    [Alias("qso")]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://stackoverflow.com/search?q=$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}
######################################################################################################################################################
function Open-WolframAlphaQuery {

    [CmdletBinding()]
    [Alias("qalpha")]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.wolframalpha.com/input/?i=$([Uri]::EscapeUriString($Query))";

            Open-Webbrowser @PSBoundParameters
        }
    }
}
######################################################################################################################################################
function Open-GithubQuery {

    [CmdletBinding()]
    [Alias("qgit")]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        [parameter(
            Mandatory = $false
        )]
        [string] $Language = "",
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        if ([string]::IsNullOrWhiteSpace($Language)) {

            $Language = ""
        }
        else {

            $Language = "l=$([Uri]::EscapeUriString($Language))&"
        }
        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Remove("Language") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://github.com/search?q=$([Uri]::EscapeUriString($Query))$Language&type=repositories"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

######################################################################################################################################################
######################################################################################################################################################
function Open-GoogleSiteInfo {

    [CmdletBinding()]
    [Alias()]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        foreach ($Query in $Queries) {

            $PSBoundParameters["Queries"] = @("site:$Query", "link:$Query", "related:$Query");

            Open-GoogleQuery @PSBoundParameters
        }
    }
}

######################################################################################################################################################
function Open-BuiltWithSiteInfo {

    [CmdletBinding()]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://builtwith.com/?$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}
######################################################################################################################################################
function Open-WhoisHostSiteInfo {

    [CmdletBinding()]
    [Alias()]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://whois.domaintools.com/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}
######################################################################################################################################################
function Open-WaybackMachineSiteInfo {

    [CmdletBinding()]
    [Alias()]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://web.archive.org/web/*/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}
######################################################################################################################################################
function Open-SimularWebSiteInfo {

    [CmdletBinding()]
    [Alias()]

    param(
        [Alias("q", "Value", "Name", "Text")]
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries,
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor"
    }

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries
    }

    process {

        $PSBoundParameters.Remove("Queries") | Out-Null;
        $PSBoundParameters.Add("Url", "Url") | Out-Null;

        foreach ($Query in $Queries) {

            $PSBoundParameters["Url"] = "https://www.similarweb.com/website/$([Uri]::EscapeUriString($Query))"

            Open-Webbrowser @PSBoundParameters
        }
    }
}

######################################################################################################################################################
######################################################################################################################################################

function Get-WikipediaSummary {

    [CmdletBinding()]
    [Alias("wikitxt")]

    Param(
        [Alias("q", "Value", "Name", "Text")]
        [Parameter(
            Mandatory = $True,
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
        function fixWiki ([string]$text) {

            $input | ForEach-Object -Process {

                $i = $_.IndexOf("(")

                if ($i -lt 150) {

                    if ($result.Length - 1 -eq $i) {

                        Write-Output $result.SubString(0, $i).Replace("  ", " ");
                    }
                    else {

                        $end = $_.IndexOf(")", $i);

                        $result = $_.Substring(0, $i)

                        if ($end -lt $_.Length) {

                            $result = $result + $_.Substring($end + 1)
                        }

                        Write-Output $result.Replace("  ", " ");
                    }
                }
            }
        }

        foreach ($Query in $Queries) {

            $urlPart = [Uri]::EscapeUriString($Query.Replace("-", " "))

            $url = ("https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=1&explaintext=1&titles=" + $urlPart)

            $r = (Invoke-WebRequest -Uri $url -MaximumRedirection 20).Content | ConvertFrom-Json

            $memberName = ($r.query.pages | Get-Member | Where-Object -Property "MemberType" -EQ "NoteProperty" | Select-Object -ExpandProperty "Name" | Select-Object -First 1)

            $value = ($r.query.pages | Select-Object -ExpandProperty $memberName)

            $result = $value.extract

            if ((!$result) -or ($result -eq "")) {

                "Nothing found on `"$Query`".."
                continue;
            }

            try {

                $result = ($result | fixWiki)
            }
            catch {

                $result = $value.extract
            }

            $result
        }
    }
}
######################################################################################################################################################
function Get-Gpt3QuestionSummary {

    [CmdletBinding()]
    [Alias("q3")]

    Param(
        [Alias("q", "Value", "Name", "Text")]
        [Parameter(
            Mandatory = $True,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries
    )

    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries

        if ([string]::IsNullOrWhiteSpace($Global:GPT3ApiKey)) {

            throw "No api key found, please set `$Global:GPT3ApiKey variable in your profile script"
        }
    }

    process {

        foreach ($Query in $Queries) {

            $result = [GenXdev.Helpers.GPT3]::AskQuestion($Global:GPT3ApiKey, $Query)

            if ((!$result) -or ($result -eq "") -or ($result.Result -like "Unknown *")) {

                "Nothing found on `"$Query`".."

                continue;
            }

            "$($result.Result)".Trim();
        }
    }
}
######################################################################################################################################################
function Get-Gpt3EnglishSummary {

    [CmdletBinding()]
    [Alias("q3")]

    Param(
        [Alias("q", "Value", "Name", "Text")]
        [Parameter(
            Mandatory = $True,
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

        if ([string]::IsNullOrWhiteSpace($Global:GPT3ApiKey)) {

            throw "No api key found, please set `$Global:GPT3ApiKey variable in your profile script"
        }

        foreach ($Query in $Queries ) {

            $result = [GenXdev.Helpers.GPT3]::CorrectGrammar($Global:GPT3ApiKey, $Query, "English")

            if ((!$result) -or ($result -eq "") -or ($result.Result -like "Unknown *")) {

                return "Nothing found on `"$Query`".."
            }

            "$($result.Result)".Split("`n")[0].Trim();
        }
    }
}
######################################################################################################################################################
function Get-Gpt3DutchSummary {

    [CmdletBinding()]
    [Alias("q3")]

    Param(
        [Alias("q", "Value", "Name", "Text")]
        [Parameter(
            Mandatory = $True,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string[]] $Queries
    )


    begin {

        $Queries = Build-InvocationArguments $MyInvocation $Queries

        if ([string]::IsNullOrWhiteSpace($Global:GPT3ApiKey)) {

            throw "No api key found, please set `$Global:GPT3ApiKey variable in your profile script"
        }
    }

    process {

        foreach ($Query in $Queries) {
            $result = [GenXdev.Helpers.GPT3]::CorrectGrammar($Global:GPT3ApiKey, $Query, "Dutch")

            if ((!$result) -or ($result -eq "") -or ($result.Result -like "Unknown *")) {

                "Nothing found on `"$Query`".."
                continue;
            }

            "$($result.Result)".Split("`n")[0].Trim();
        }
    }
}

######################################################################################################################################################
######################################################################################################################################################
function Get-NextAffirmations {

    [CmdletBinding()]
    [Alias("WhatAboutIt")]

    Param(
        [Parameter(
            Mandatory = $False,
            Position = 0
        )]
        [Switch] $Speak
    )

    $affirmation = (Invoke-RestMethod https://www.affirmations.dev/).affirmation;

    if ($Speak -eq $true) {

        say $affirmation
    }

    Write-Output $affirmation
}
######################################################################################################################################################
function Get-NextJoke {

    [CmdletBinding()]
    [Alias("TellAJoke")]

    Param(
        [Parameter(
            Mandatory = $False,
            Position = 0
        )]
        [Switch] $Speak
    )

    $joke = [System.Web.HttpUtility]::HtmlDecode((Invoke-RestMethod https://icanhazdadjoke.com/ -Headers @{"Accept" = "text/plain" }));

    if ($Speak -eq $true) {

        say $joke
    }

    Write-Output $joke
}

######################################################################################################################################################
function Open-Repeaters {

    [CmdletBinding()]
    [Alias()]

    Param(
        [Alias("q", "Value", "Name", "Text")]
        [Parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateSet("PI2NOS", "PI3UTR", "PI3GOE", "MEETNET", "PI6NOS", "PI1DFT")]
        [string[]] $Repeaters = @("PI6NOS"),
        ####################################################################################################
        [Alias("m", "mon")]
        [parameter(
            Mandatory = $false,
            HelpMessage = "The monitor to use, 0 = default, -1 is discard"
        )]
        [int] $Monitor = -1
    )

    DynamicParam {

        Copy-OpenWebbrowserParameters -ParametersToSkip "Url", "Monitor", "ApplicationMode"
    }

    process {

        $PSBoundParameters.Add("Url", "https://pc7x.net/repeaters/") | Out-Null;
        $PSBoundParameters.Add("ApplicationMode", $True) | Out-Null;
        $PSBoundParameters.Remove("Repeater") | Out-Null;

        foreach ($Repeater in $Repeaters) {

            $PSBoundParameters["Url"] = "https://pc7x.net/repeaters/#/map/google/$($Repeater.ToLowerInvariant())";

            Open-Webbrowser @PSBoundParameters
        }
    }
}


##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Performs a google search in previously selected webbrowser tab and returns the links

.DESCRIPTION
Performs a google search in previously selected webbrowser tab and returns the links

.PARAMETER Query
The google query to perform

.PARAMETER Max
The maximum number of results to obtain, defaults to 200

.EXAMPLE
PS C:\> Select-WebbrowserTab; $Urls = Get-GoogleSearchResultUrls "site:github.com PowerShell module"; $Urls

.NOTES
Requires the Windows 10+ Operating System
#>
function Get-GoogleSearchResultUrls {

    [CmdletBinding()]
    [Alias("qlinksget")]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query,
        ###################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "The maximum number of results to obtain, defaults to 200"
        )]
        [int] $Max = 200
    )

    $Global:Data = @{

        urls  = @();
        query = $Query
    }

    $Query = "$([Uri]::EscapeUriString($Query))"
    $Url = "https://www.google.com/search?q=$Query"

    Invoke-WebbrowserEvaluation "document.location.href='$Url'" | Out-Null

    do {
        Start-Sleep 5 | Out-Null

        Invoke-WebbrowserEvaluation -Scripts @("$PSScriptRoot\Get-GoogleSearchResultUrls.js") | Out-Null

        $Global:data.urls | ForEach-Object -ErrorAction SilentlyContinue {

            if ($Max-- -gt 0) {

                $_;
            }
        }
    }

    while ($Global:data.more -and ($Max-- -gt 0))
}

##############################################################################################################
##############################################################################################################

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

##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Performs an infinite auto opening google search in previously selected webbrowser tab.

.DESCRIPTION
Performs a google search in previously selected webbrowser tab.
Opens 10 tabs each times, pauses until initial tab is revisited
Close initial tab to stop

.PARAMETER Query
The google query to perform

.EXAMPLE
PS C:\>

    Select-WebbrowserTab;
    Open-AllGoogleLinks "site:github.com PowerShell module"

.NOTES
Requires the Windows 10+ Operating System
#>
function Open-AllGoogleLinks {

    [CmdletBinding()]
    [Alias("qlinks")]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    $Global:data = @{

        urls  = @();
        query = $Query
    }

    Invoke-WebbrowserTabPollingScript -Scripts @("$PSScriptRoot\Open-AllGoogleLinks.js") -InitialUrl "https://www.google.com/search?q=$([Uri]::EscapeUriString($Query))"
}

##############################################################################################################
##############################################################################################################

<#
.SYNOPSIS
Performs an infinite auto opening youtube search in a new fullscreen browser window on second monitor

.DESCRIPTION
Performs an infinite auto opening youtube search in a new fullscreen browser window on second monitor
Console window will show info about the video and keyboard shortcuts for controlling current playing video

.PARAMETER Query
The youtube query to perform

.EXAMPLE
PS C:\>

    Select-WebbrowserTab;
    Open-AllYoutubeVideos "PowerShell Windows Terminal"

.NOTES
Requires the Windows 10+ Operating System
#>
function Open-AllYoutubeVideos {

    [CmdletBinding()]
    [Alias("qvideos")]

    param(
        [Alias("q")]
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    $Global:data = @{

        urls           = @();
        query          = $Query;
        description    = "";
        title          = "";
        subscribeTitle = "";
        playing        = $true;
        duration       = 0;
        position       = 0;
    }

    $Url = $null
    if (![string]::IsNullOrWhiteSpace($Query)) {

        $Url = "https://www.youtube.com/results?search_query=$([Uri]::EscapeUriString($Query))"
    }

    $hostInfo = & { $H = Get-Host; $H.ui.rawui; }
    Clear-Host
    Write-Host "Hold on.. launching query".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)

    if ([System.Windows.Forms.Screen]::AllScreens.Length -lt 2) {

        $browser = Open-Webbrowser -NewWindow -ApplicationMode -RestoreFocus -Chromium -Right -Url $Url -ReturnProcess
    }
    else {
        $browser = Open-Webbrowser -NewWindow -FullScreen -RestoreFocus -Chromium -Url $Url -ReturnProcess
    }

    Start-Sleep 3
    Select-WebbrowserTab -Name "*youtube*" | Out-Null

    $job = Invoke-WebbrowserTabPollingScript -Scripts @("$PSScriptRoot\Open-AllYoutubeVideos.js")

    while ([Console]::KeyAvailable) { [Console]::ReadKey(); }

    while ($null -ne $job -and $job.State -ne "Running") {
        Start-Sleep 1
        $job = Get-Job $job.Name -ErrorAction SilentlyContinue
    }

    while ($null -ne $job -and $job.State -eq "Running") {

        do {
            $hostInfo = & { $H = Get-Host; $H.ui.rawui; }
            Clear-Host
            $sub = ""; if (![string]::IsNullOrWhiteSpace($Global:data.subscribeTitle)) { $sub = " S = $($Global:data.subscribeTitle)," }
            if ($Global:data.playing) { $pause = " P = Pause," } else { $pause = "P = Resume" }

            Write-Host "Q = quit,$sub $pause SPACE=Next video, 0..9 = skip 0% to 90%, Left-Arrow = -20sec, RightArrow = +20sec".PadRight($hostInfo.WindowSize.Width, " ") -BackgroundColor ([ConsoleColor]::Blue) -ForegroundColor ([ConsoleColor]::White)
            Write-Host "$($Global:data.title)".PadRight($hostInfo.WindowSize.Width, " ") -ForegroundColor ([ConsoleColor]::black) -BackgroundColor ([ConsoleColor]::Gray)
            Write-Host ((("$($Global:data.description)".Replace("Show less", "").Replace("Show more", "").Replace("`r", "").Replace("`n", "`r").Replace("`t", " ") -Split "`r"  | ForEach-Object -ErrorAction SilentlyContinue { if ($nn -isnot [int]) { $nn = 0; } if ([string]::IsNullOrWhiteSpace($PSItem)) { $nn = $nn + 1; } else { $nn = 0 } if ($nn -lt 2) { $s = $PSItem.Trim(); for ([int] $i = $hostInfo.WindowSize.Width - 1; $i -lt $s.length - 1; $i += $hostInfo.WindowSize.Width - 3) { $s = $s.substring(0, $i) + "`r" + $s.substring($i); } $s } }) -Join "`r" -Split "`r" | Select-Object -First ($hostInfo.WindowSize.Height - 3)) -Join "`r`n")
            [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 1);
            [Console]::BackgroundColor = [ConsoleColor]::Blue;
            [Console]::ForegroundColor = [ConsoleColor]::Yellow;
            try { [Console]::Write([TimeSpan]::FromSeconds([Math]::Round($Global:data.Position, 0)).ToString()) } catch {}
            [Console]::SetCursorPosition($hostInfo.WindowSize.Width - 9, $hostInfo.WindowSize.Height - 1);
            try { [Console]::Write([TimeSpan]::FromSeconds([Math]::Round($Global:data.Duration - $Global:data.Position, 0)).ToString()) } catch {}
            [Console]::SetCursorPosition(0, 0);
            [Console]::ResetColor();

            if ([Console]::KeyAvailable) {
                [Console]::SetCursorPosition(0, $hostInfo.WindowSize.Height - 2);
                $c = [Console]::ReadKey();

                switch ("$($c.KeyChar)".ToLowerInvariant()) {

                    "q" {
                        Stop-Job $job.Name -ErrorAction SilentlyContinue | Out-Null
                        $browser.CloseMainWindow();
                        Clear-Host;
                        return;
                    }

                    " " {

                        Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                        Invoke-WebbrowserEvaluation "window.close()" -ErrorAction SilentlyContinue | Out-Null
                        Start-Sleep 1
                        Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                    }

                    "s" {

                        Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                        Invoke-WebbrowserEvaluation "
                        window.fakeClick = function (anchorObj, event) {
                            try {

                                if (anchorObj.click) {
                                    anchorObj.click()
                                } else if (document.createEvent) {
                                    if (!event || event.target !== anchorObj) {
                                        var evt = document.createEvent("MouseEvents");
                                        evt.initMouseEvent("click", true, true, window,
                                            0, 0, 0, 0, 0, false, false, false, false, 0, null);
                                        var allowDefault = anchorObj.dispatchEvent(evt);
                                    }
                                }
                            } catch (e) { }
                        }
                        " -ErrorAction SilentlyContinue | Out-Null
                        Invoke-WebbrowserEvaluation "fakeClick(document.querySelector('#subscribe-button tp-yt-paper-button'))" -ErrorAction SilentlyContinue | Out-Null
                        Invoke-WebbrowserEvaluation "fakeClick(document.querySelector('#confirm-button tp-yt-paper-button'))" -ErrorAction SilentlyContinue | Out-Null
                    }

                    "p" {

                        Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                        Invoke-WebbrowserEvaluation "

                        window.video = document.getElementsByTagName('video')[0];
                        if (window.video.paused) {
                            window.video.play();
                        }
                        else {
                           window.video.pause();
                        }
                          data.playing = !window.video.paused;
                          data.position = window.video.currentTime;
                          data.duration = window.video.duration;

                        " -ErrorAction SilentlyContinue | Out-Null
                    }

                    default {

                        [int] $n = 0;
                        if ([int]::TryParse("$($c.KeyChar)", [ref] $n)) {

                            Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                            Invoke-WebbrowserEvaluation "
                                window.video = document.getElementsByTagName('video')[0];
                                window.video.currentTime = Math.round(window.video.duration * ($n/10));
                                window.video.play();
                                data.playing = !window.video.paused;
                                data.position = window.video.currentTime;
                                data.duration = window.video.duration;
                               " -ErrorAction SilentlyContinue | Out-Null;
                        }
                        else {
                            if ($c.Key -eq [ConsoleKey]::RightArrow) {

                                Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                                Invoke-WebbrowserEvaluation "
                                window.video = document.getElementsByTagName('video')[0];
                                window.video.currentTime = Math.min(window.video.duration, window.video.currentTime+20);
                                window.video.play();
                                data.playing = !window.video.paused;
                                data.position = window.video.currentTime;
                                data.duration = window.video.duration;
                                " -ErrorAction SilentlyContinue | Out-Null;
                            }
                            else {
                                if ($c.Key -eq [ConsoleKey]::LeftArrow) {

                                    Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
                                    Invoke-WebbrowserEvaluation "
                                    window.video = document.getElementsByTagName('video')[0];
                                    window.video.currentTime = Math.max(0, window.video.currentTime-20);
                                    window.video.play();
                                    data.playing = !window.video.paused;
                                    data.position = window.video.currentTime;
                                    data.duration = window.video.duration;
                                " -ErrorAction SilentlyContinue | Out-Null;
                                }
                            }

                        }
                    }
                }
            }
        } while ([Console]::KeyAvailable);

        Select-WebbrowserTab -Name "*youtube*" -ErrorAction SilentlyContinue | Out-Null
        Invoke-WebbrowserEvaluation "
            window.video = document.getElementsByTagName('video')[0];
            window.video.setAttribute('style','position:fixed;left:0;top:0;bottom:0;right:0;z-index:10000;width:100vw;height:100vh');

            if (!document.getElementById('genxbackground')) {
                window.video.onended = () => { window.close() };
                let div = document.createElement('div'); document.body.appendChild(div);div.setAttribute('style', 'position:fixed;left:0;top:0;bottom:0;right:0;z-index:9999;width:100vw;height:100vh;background-color:black;');
                document.body.appendChild(window.video);document.body.setAttribute('style', 'overflow:hidden');
            }

            data.description = document.getElementById('description').innerText;
            data.title = document.querySelector('h1.title').innerText;
            data.subscribeTitle = document.querySelector('#subscribe-button').innerText.trim()
            window.video.setAttribute('style','position:fixed;left:0;top:0;bottom:0;right:0;z-index:10000;width:100vw;height:100vh');
            data.playing = !window.video.paused;
            data.position = window.video.currentTime;
            data.duration = window.video.duration;
        " -ErrorAction SilentlyContinue | Out-Null;

        $job = Get-Job $job.Name -ErrorAction SilentlyContinue
    }

    while ([Console]::KeyAvailable) { [Console]::ReadKey(); }
}

##############################################################################################################
##############################################################################################################
<#
.SYNOPSIS
Performs a google query in the previously selected webbrowser tab, and download all found pdf's into current directory

.DESCRIPTION
Performs a google query in the previously selected webbrowser tab, and download all found pdf's into current directory

.PARAMETER Query
Parameter description

.PARAMETER Max
The maximum number of results to obtain, defaults to 200

.EXAMPLE
PS D:\Downloads>

    mkdir pdfs;
    cd pdfs;

    Select-WebbrowserTab;

    Copy-PDFsFromGoogleQuery "scientific paper co2"

.NOTES
Requires the Windows 10+ Operating System
#>
function Copy-PDFsFromGoogleQuery {

    [CmdletBinding()]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query,
        ###################################################################
        [parameter(
            Mandatory = $false,
            HelpMessage = "The maximum number of results to obtain, defaults to 200"
        )]
        [int] $Max = 200
    )

    Get-GoogleSearchResultUrls -Max $Max -Query "filetype:pdf $Query" |
    ForEach-Object -ThrottleLimit 64 -Parallel {

        try {

            $destination = [IO.Path]::Combine(
                $PWD,
                (
                    [IO.Path]::ChangeExtension(
                        [Uri]::UnescapeDataString(
                            [IO.Path]::GetFileName($_).Split("#")[0].Split("?")[0]
                        ).Replace("\", "_").Replace("/", "_").Replace("?", "_").Replace("*", "_").Replace(" ", "_").Replace("__", "_"),
                        ".pdf"
                    )
                )
            );

            Invoke-WebRequest -Uri $_ -OutFile $destination

            "Success: $_"
        }
        catch {

            "Failed: $_"
        }
    }
}