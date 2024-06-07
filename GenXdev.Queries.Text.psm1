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

# SIG # Begin signature block
# MIIbzgYJKoZIhvcNAQcCoIIbvzCCG7sCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDGq3bWT/uMMXYP
# oBuo/b6BN6TpKkYXmV25H12g0rKPj6CCFhswggMOMIIB9qADAgECAhBwxOfTiuon
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
# SIb3DQEJBDEiBCDmFZyMXzz9IdCcAi61mTqJQYJG4B8Y95x8oSxCzSHbzDANBgkq
# hkiG9w0BAQEFAASCAQAFDurIdaNwIa3BncJxCSON73eN9jjop9p2wKCVsZx83pDE
# vCqCP8ceqsRt59cMqd8IA9fwSK3LNYc6eU9njmxOG1z6lxgpYXrApJzRJjIntydh
# LOPAnfwRDRj/meUOZmZqsSGkO3srQxn/xyceQKgBOQBqZJ+tA6dL3J5m+8s6kDMq
# VWMMIrWHkxPV+WFjygmmZkkbkHYuCUoaJa7yYp5P51kNwMbR7bOEjAR8eiodE4fC
# p/DIPDoyQk7wta+37Z32Pb7UaRxSiea2CZ+0q3tikueq1i2VxYmS1sPRzWy5vWAz
# rO8irSj3aiBw9IoyIRyprd6u7sNUxXi6KkKfVExtoYIDIDCCAxwGCSqGSIb3DQEJ
# BjGCAw0wggMJAgEBMHcwYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0
# LCBJbmMuMTswOQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hB
# MjU2IFRpbWVTdGFtcGluZyBDQQIQBUSv85SdCDmmv9s/X+VhFjANBglghkgBZQME
# AgEFAKBpMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8X
# DTI0MDYwNzA5MTkzOFowLwYJKoZIhvcNAQkEMSIEIIcLk6T3QiXVRcIYNMi6utKW
# E6Ezcs0202UD4uzrBuw3MA0GCSqGSIb3DQEBAQUABIICAA6vJEQCMSJXU5RbM5y5
# QEsUiPEXcVuEsePY/D41TpFrxaxZxKChSbxhUoODSxpA1RBDHIIHG96Ti31k1P+Y
# MQ0pbS8ingQ196s/YDqQfWlxczHPb5nnD12R5i/jCsQnUkL7mcLtXshlLBf2IC5z
# 77OTTAN9OWuqV8pI4Q0oEwrC2dBNfRXS1j8lUoGI2TQOn8644QqxAdQFCfcMLvZV
# iyYtSJzpegQO7LmgNX3kvWSPYKKoRW91+tdHKCJjYofB+zDtV+LB6p6QQKg8MK7C
# 9RVRf9ZsyutvQ41DMp6vNP4iVy7ihsOn5j2rlvBowlX6Kw8ZK7Fn2cXGm4AKDmv6
# AQnxz2/ZOwcAV6i//PyCKzYQSLOE8v7pV6SjNqDiVGcyN54blFVgi8J7k+4P7Vrw
# 6CKz7F+NneRwcd5ULe+cl/VtIe7mGFRBcyK5QDgYERSNmlpbMYvIuxdFgREiGWqh
# Tsb8MNmPT0/IXkkbI7KFhS+Igk4KsN87qkkr/Z8SJ7M2ggEbyNAVZNXBSOrd2wXz
# c8jOvWCZLnLMHjy/gq0ZpbXgpg03/oDtWI7skYHeAECPuTOf1AmqM5PVLAbrcg3U
# AJlV69E5hoPDhNRVQ4+w4DqUBb4yC1x0u0m34mF99BYV5LA9JJbGC+gIOU8GJuFR
# CJxxzre33rtKSoHTq9S9nNPa
# SIG # End signature block
