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
            ValueFromRemainingArguments = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "The query to perform"
        )]
        [string[]] $Queries
        ########################################################################
    )

    begin {
        # helper function to clean up wikipedia text by removing parentheticals
        function Remove-ParentheticalContent {
            param([string]$Text)

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

            Write-Verbose "Searching Wikipedia for: $query"

            # prepare the url-encoded query
            $urlPart = [Uri]::EscapeUriString($query.Replace("-", " "))
            $url = "https://en.wikipedia.org/w/api.php?format=json&action=query" + `
                   "&prop=extracts&exintro=1&explaintext=1&titles=$urlPart"

            try {
                # fetch and parse the wikipedia api response
                $response = Invoke-WebRequest -Uri $url -MaximumRedirection 20
                $data = $response.Content | ConvertFrom-Json

                # extract the page content
                $pageId = ($data.query.pages |
                    Get-Member -MemberType NoteProperty |
                    Select-Object -ExpandProperty Name -First 1)
                $extract = $data.query.pages.$pageId.extract

                if ([string]::IsNullOrEmpty($extract)) {
                    Write-Warning "No Wikipedia content found for '$query'"
                    continue
                }

                # clean up and output the result
                Write-Verbose "Found content, cleaning up response"
                try {
                    Remove-ParentheticalContent -Text $extract
                }
                catch {
                    Write-Verbose "Failed to clean content, returning raw extract"
                    $extract
                }
            }
            catch {
                Write-Error "Failed to retrieve Wikipedia content: $_"
            }
        }
    }
}
################################################################################
