################################################################################
<#
.SYNOPSIS
Retrieves a summary of a topic from Wikipedia.

.DESCRIPTION
Queries the Wikipedia API to get a concise summary of the specified topic,
removing parenthetical content for improved readability.

.PARAMETER Queries
One or more search terms to look up on Wikipedia.

.EXAMPLE
Get-WikipediaSummary -Queries "PowerShell"

.EXAMPLE
wikitxt "PowerShell", "Typescript", "C#"
#>
function Get-WikipediaSummary {

    [CmdletBinding()]
    [Alias("wikitxt")]
    param(
        ########################################################################
        [parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromRemainingArguments = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The query to perform"
        )]
        [Alias("q", "Value", "Name", "Text", "Query")]
        [string[]] $Queries
        ########################################################################
    )

    begin {
        # helper function to clean up wikipedia text by removing parentheticals
        function Remove-ParentheticalContent {

            [OutputType([string])]
            [CmdletBinding()]
            [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
            param(
                [string] $Text
            )
            ########################################################################

            $i = $Text.IndexOf("(")
            if ($i -ge 150) { return $Text }

            if ($i -eq $Text.Length - 1) {
                return $Text.Substring(0, $i).Replace("  ", " ")
            }

            $end = $Text.IndexOf(")", $i)
            $result = $Text.Substring(0, $i)

            if ($end -lt $Text.Length) {
                $result += $Text.Substring($end + 1)
            }

            return $result.Replace("  ", " ")
        }
    }

    process {
        foreach ($query in $Queries) {

            Microsoft.PowerShell.Utility\Write-Verbose "Searching Wikipedia for: $query"

            # prepare the url-encoded query
            $urlPart = [Uri]::EscapeUriString($query.Replace("-", " "))
            $url = "https://en.wikipedia.org/w/api.php?format=json&action=query" +
            "&prop=extracts&exintro=1&explaintext=1&titles=$urlPart"

            try {
                # fetch and parse the wikipedia api response
                $response = Microsoft.PowerShell.Utility\Invoke-WebRequest -Uri $url -MaximumRedirection 20
                $data = $response.Content | Microsoft.PowerShell.Utility\ConvertFrom-Json

                # extract the page content
                $pageId = ($data.query.pages |
                    Microsoft.PowerShell.Utility\Get-Member -MemberType NoteProperty |
                    Microsoft.PowerShell.Utility\Select-Object -ExpandProperty Name -First 1)
                $extract = $data.query.pages.$pageId.extract

                if ([string]::IsNullOrEmpty($extract)) {
                    Microsoft.PowerShell.Utility\Write-Warning "No Wikipedia content found for '$query'"
                    continue
                }

                # clean up and output the result
                Microsoft.PowerShell.Utility\Write-Verbose "Found content, cleaning up response"
                try {
                    Remove-ParentheticalContent -Text $extract
                }
                catch {
                    Microsoft.PowerShell.Utility\Write-Verbose "Failed to clean content, returning raw extract"
                    $extract
                }
            }
            catch {
                Microsoft.PowerShell.Utility\Write-Error "Failed to retrieve Wikipedia content: $_"
            }
        }
    }
}
################################################################################