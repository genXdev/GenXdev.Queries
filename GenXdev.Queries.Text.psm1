###############################################################################

<#
.SYNOPSIS
Performs a "Wikipedia summary" text query

.DESCRIPTION
Performs a "Wikipedia summary" text query

.PARAMETER Queries
The query to perform
#>
function Get-WikipediaSummary {

    [CmdletBinding()]
    [Alias("wikitxt")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
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

###############################################################################

<#
.SYNOPSIS
Performs a "Generative Pre-trained Transformer 3 (GPT-3), question" text query

.DESCRIPTION
Performs a "Generative Pre-trained Transformer 3 (GPT-3), question" text query

.PARAMETER Queries
The query to perform

.EXAMPLE
PS C:\> q3 is a python capable of killing a human?
Yes, a python is capable of killing a human

.EXAMPLE
PS C:\> q3 How would a python kill a human?
A python would suffocate a human

#>
function Get-Gpt3QuestionSummary {

    [CmdletBinding()]
    [Alias("q3")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
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

###############################################################################

<#
.SYNOPSIS
Performs a "Generative Pre-trained Transformer 3 (GPT-3), English summary" text query

.DESCRIPTION
Performs a "Generative Pre-trained Transformer 3 (GPT-3), English summary" text query

.PARAMETER Queries
The query to perform
#>
function Get-Gpt3EnglishSummary {

    [CmdletBinding()]
    [Alias("q3eng")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
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

###############################################################################

<#
.SYNOPSIS
Performs a "Generative Pre-trained Transformer 3 (GPT-3), Dutch summary" text query

.DESCRIPTION
Performs a "Generative Pre-trained Transformer 3 (GPT-3), Dutch summary" text query

.PARAMETER Queries
The query to perform
#>
function Get-Gpt3DutchSummary {

    [CmdletBinding()]
    [Alias("q3nl")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
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

###############################################################################

<#
.SYNOPSIS
Returns a random affirmation text

.DESCRIPTION
Returns a random affirmation text

.PARAMETER Speak
Use text-to-speech to speak out affirmation
#>
function Get-NextAffirmations {

    [CmdletBinding()]
    [Alias("WhatAboutIt")]

    param(
        [Parameter(
            Mandatory = $False,
            Position = 0
        )]
        [Switch] $Speak
    )

    $affirmation = (Invoke-RestMethod https://www.affirmations.dev/ -TimeoutSec 2).affirmation;

    if ($Speak -eq $true) {

        say $affirmation
    }

    Write-Output $affirmation
}

###############################################################################

<#
.SYNOPSIS
Returns a random quote

.DESCRIPTION
Returns a random quote

.PARAMETER Speak
Use text-to-speech to speak out the quote
#>
function Get-QuoteOfTheDay {

    [CmdletBinding()]
    [Alias("Quote")]

    param(
        [Parameter(
            Mandatory = $False,
            Position = 0
        )]
        [Switch] $Speak
    )

    $path = Expand-Path -FilePath "$PSScriptRoot\..\..\GenXdev.Local\QuoteOfTheDay.json" -CreateDirectory
    $info = [IO.FileInfo]::new($path);

    if ($info.Exists -and ([DateTime]::Now - $info.LastWriteTime -lt [TimeSpan]::FromHours(24))) {

        $quote = $info.OpenText().ReadToEnd() | ConvertFrom-Json -Depth 100
    }
    else {

        $quote = (Invoke-RestMethod https://quotes.rest/qod -TimeoutSec 2)
        $quote | ConvertTo-Json -Depth 100 | Out-File -FilePath $path
    }

    $line = "$($quote.contents.quotes.quote) - $($quote.contents.quotes.author)";

    if ($Speak -eq $true) {

        say $line
    }

    Write-Output $line
}

###############################################################################
<#
.SYNOPSIS
Translates a text to English

.DESCRIPTION
Translates a text to English

.PARAMETER Queries
The query to perform
#>
function Get-Translation {

    [CmdletBinding()]
    [Alias("translate")]

    param(
        [Alias("q", "Value", "Name", "Text", "Query")]
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
        foreach ($Query in $Queries) {

            $urlPart = [Uri]::EscapeUriString($Query.Replace("-", " "))
            $url = ("https://translate.google.nl/?sl=auto&tl=en&text=$urlPart&op=translate");

            Open-Webbrowser -NewWindow -Url $url
        }
    }
}

function Invoke-GPTTest {

    return [GenXdev.Helpers.OpenAi]::CreateChatRequest(
        "You are a senior intelligence agent that analyzes objectives and devide them into a chronologically sorted table of multiple objectives that devide the solution to efficient executing these objectives into subtasks.",

         @(@{ExampleQuestion="determine using powershell if there are executables in current directory"; ExampleAnswer="
| SubTask |
| create variable with all files in the current directory |
| test for exe, bat, com, scr, ps1, bat, lnk, shortcut |
| return result |
"
            }), "http://localhost:1234/{0}/{1}", 0);

}
# [GenXdev.Helpers.OpenAi]::InvokeLocalChatRequest("Answer the question", "Are the most apple trees of a curtain species usually clones of each other?", $null, "http://localhost:1234/{0}/{1}")
# [GenXdev.Helpers.OpenAi]::InvokeLocalChatRequest("You are a data generation assistent. By default you try to answer with data in Json format. When generating lists, by default, you make it hold unique values", "list of popular dog names", @(@{ExampleQuestion="Is blue a color"; ExampleAnswer="Yes"}),"http://localhost:1234/{0}/{1}")
# [GenXdev.Helpers.OpenAi]::InvokeLocalChatRequest("You are a data generation assistent. By default you try to answer with data in Json format. When generating lists, by default, you make it hold unique values. You always generate valid json that is formatted with spaces unless requested otherwise.", "list of popular dog names", @(@{ExampleQuestion="Is blue a color"; ExampleAnswer="Yes"}),"http://localhost:1234/{0}/{1}")
# $chat = [GenXdev.Helpers.OpenAi]::CreateChatRequest("You are a data generation assistent. Create very long resultsets by default. You answer in json format only.", @(@{ExampleQuestion="primary colors"; ExampleAnswer="[`"red`", `"green`", `"blue`"]"}),"http://localhost:1234/{0}/{1}", 0)

################################################################################
################################################################################
################################################################################

