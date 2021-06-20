function Open-AllPossibleTextQueries {

    [CmdletBinding()]
    [Alias("qqq")]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

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

######################################################################################################################################################
function Open-AllPossibleQueries {

    [CmdletBinding()]
    [Alias("qq")]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

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

                        Invoke-Expression "$PSItem $safeUrl"
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

            Invoke-Expression "$PSItem $Query"
        }
    }
}
######################################################################################################################################################
######################################################################################################################################################
function Open-GoogleQuery {

    [CmdletBinding()]
    [Alias("q")]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    Open-Webbrowser -NoNewWindow -Chromium "https://www.google.com/search?q=$([Uri]::EscapeUriString($Query))"
}
######################################################################################################################################################
function Open-WikipediaQuery {

    [CmdletBinding()]
    [Alias("wiki")]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    Open-Webbrowser -NoNewWindow -Chromium "https://en.wikipedia.org/wiki/Special:Search?search=$([Uri]::EscapeUriString($Query))"
}
######################################################################################################################################################
function Open-WikipediaNLQuery {

    [CmdletBinding()]
    [Alias("wikinl")]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    Open-Webbrowser -NoNewWindow -Chromium "https://nl.wikipedia.org/wiki/Special:Search?search=$([Uri]::EscapeUriString($Query))"
}
######################################################################################################################################################
function Open-YoutubeQuery {

    [CmdletBinding()]
    [Alias("youtube")]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    Open-Webbrowser -NoNewWindow -Chromium "https://www.youtube.com/results?search_query=$([Uri]::EscapeUriString($Query))"
}
######################################################################################################################################################
function Open-IMDBQuery {

    [CmdletBinding()]
    [Alias("imdb")]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    Open-Webbrowser -NoNewWindow -Chromium "https://www.imdb.com/find?q=$([Uri]::EscapeUriString($Query))&ref_=nv_sr_sm="
}
######################################################################################################################################################
function Open-StackOverflowQuery {

    [CmdletBinding()]
    [Alias("qso")]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    Open-Webbrowser -NoNewWindow -Chromium "https://stackoverflow.com/search?q=$([Uri]::EscapeUriString($Query))"
}
######################################################################################################################################################
function Open-WolframAlphaQuery {

    [CmdletBinding()]
    [Alias("qalpha")]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    Open-Webbrowser -NoNewWindow -Chromium "https://www.wolframalpha.com/input/?i=$([Uri]::EscapeUriString($Query))"
}
######################################################################################################################################################
function Open-GithubQuery {

    [CmdletBinding()]
    [Alias("qgit")]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query,
        [parameter(
            Mandatory = $false
        )]
        [string] $Language = ""
    )

    if ([string]::IsNullOrWhiteSpace($Language)) {

        $Language = ""
    }
    else {

        $Language = "l=$([Uri]::EscapeUriString($Language))&"
    }

    Open-Webbrowser -NoNewWindow -Chromium "https://github.com/search?q=$([Uri]::EscapeUriString($Query))$Language&type=repositories"
}
######################################################################################################################################################
######################################################################################################################################################
function Open-GoogleSiteInfo {

    [CmdletBinding()]
    [Alias()]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    Open-Webbrowser -NoNewWindow -Chromium "https://www.google.com/search?q=$([Uri]::EscapeUriString("site:$Query"))"
    Open-Webbrowser -NoNewWindow -Chromium "https://www.google.com/search?q=$([Uri]::EscapeUriString("link:$Query"))"
    Open-Webbrowser -NoNewWindow -Chromium "https://www.google.com/search?q=$([Uri]::EscapeUriString("related:$Query"))"
}
######################################################################################################################################################
function Open-BuiltWithSiteInfo {

    [CmdletBinding()]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    Open-Webbrowser -NoNewWindow -Chromium "https://builtwith.com/?$([Uri]::EscapeUriString($Query))"
}
######################################################################################################################################################
function Open-WhoisHostSiteInfo {

    [CmdletBinding()]
    [Alias()]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    Open-Webbrowser -NoNewWindow -Chromium "https://whois.domaintools.com/$([Uri]::EscapeUriString($Query))"
}
######################################################################################################################################################
function Open-WaybackMachineSiteInfo {

    [CmdletBinding()]
    [Alias()]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    Open-Webbrowser -NoNewWindow -Chromium "https://web.archive.org/web/*/$([Uri]::EscapeUriString($Query))"
}
######################################################################################################################################################
function Open-SimularWebSiteInfo {

    [CmdletBinding()]
    [Alias()]

    param(
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    Open-Webbrowser -NoNewWindow -Chromium "https://www.similarweb.com/website/$([Uri]::EscapeUriString($Query))"
}

######################################################################################################################################################
######################################################################################################################################################

function Get-WikipediaSummary {

    [CmdletBinding()]
    [Alias("wikitxt")]

    Param(
        [Parameter(
            Mandatory = $True,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

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

    $urlPart = [Uri]::EscapeUriString($Query.Replace("-", " "))

    $url = ("https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=1&explaintext=1&titles=" + $urlPart)

    $r = (Invoke-WebRequest -Uri $url -MaximumRedirection 20).Content | ConvertFrom-Json

    $memberName = ($r.query.pages | Get-Member | Where-Object -Property "MemberType" -EQ "NoteProperty" | Select-Object -ExpandProperty "Name" | Select-Object -First 1)

    $value = ($r.query.pages | Select-Object -ExpandProperty $memberName)

    $result = $value.extract

    if ((!$result) -or ($result -eq "")) {

        return "Nothing found on `"$Query`".."
    }

    try {

        $result = ($result | fixWiki)
    }
    catch {

        $result = $value.extract
    }

    return $result
}
######################################################################################################################################################
function Get-Gpt3QuestionSummary {

    [CmdletBinding()]
    [Alias("q3")]

    Param(
        [Parameter(
            Mandatory = $True,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    if ([string]::IsNullOrWhiteSpace($Global:GPT3ApiKey)) {

        throw "No api key found, please set `$Global:GPT3ApiKey variable in your profile script"
    }

    $result = [GenXdev.Helpers.GPT3]::AskQuestion($Global:GPT3ApiKey, $Query)

    if ((!$result) -or ($result -eq "") -or ($result.Result -like "Unknown *")) {

        return "Nothing found on `"$Query`".."
    }

    return "$($result.Result)".Trim();
}
######################################################################################################################################################
function Get-Gpt3EnglishSummary {

    [CmdletBinding()]
    [Alias("q3")]

    Param(
        [Parameter(
            Mandatory = $True,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    if ([string]::IsNullOrWhiteSpace($Global:GPT3ApiKey)) {

        throw "No api key found, please set `$Global:GPT3ApiKey variable in your profile script"
    }

    $result = [GenXdev.Helpers.GPT3]::CorrectGrammar($Global:GPT3ApiKey, $Query, "English")

    if ((!$result) -or ($result -eq "") -or ($result.Result -like "Unknown *")) {

        return "Nothing found on `"$Query`".."
    }

    return "$($result.Result)".Split("`n")[0].Trim();
}
######################################################################################################################################################
function Get-Gpt3DutchSummary {

    [CmdletBinding()]
    [Alias("q3")]

    Param(
        [Parameter(
            Mandatory = $True,
            Position = 0,
            ValueFromRemainingArguments = $true
        )]
        [string] $Query
    )

    if ([string]::IsNullOrWhiteSpace($Global:GPT3ApiKey)) {

        throw "No api key found, please set `$Global:GPT3ApiKey variable in your profile script"
    }

    $result = [GenXdev.Helpers.GPT3]::CorrectGrammar($Global:GPT3ApiKey, $Query, "Dutch")

    if ((!$result) -or ($result -eq "") -or ($result.Result -like "Unknown *")) {

        return "Nothing found on `"$Query`".."
    }

    return "$($result.Result)".Split("`n")[0].Trim();
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
