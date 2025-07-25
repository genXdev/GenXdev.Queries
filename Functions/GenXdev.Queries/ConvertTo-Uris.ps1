﻿###############################################################################

<#
.SYNOPSIS
Parses strings for any valid URI.

.DESCRIPTION
Extracts all valid URIs from input text, supporting standard and custom URI
schemes like http:, https:, ftp:, magnet:, about:, etc. Returns Uri objects for
each valid URI found.

.PARAMETER Text
One or more text strings that may contain URIs to parse.

.EXAMPLE
ConvertTo-Uris -Text "Check out https://github.com and about:config"

.EXAMPLE
"Visit http://example.com" | ConvertTo-Uris
#>
function ConvertTo-Uris {

    [CmdletBinding()]
    param(
        #######################################################################
        [parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline = $true,
            HelpMessage = 'Text input that may contain URIs'
        )]
        [ValidateNotNull()]
        [AllowEmptyString()]
        [string[]] $Text
        #######################################################################
    )

    begin {

        Microsoft.PowerShell.Utility\Write-Verbose 'Initializing URI parsing'

        # regex pattern to match URIs with various schemes
        $uriPattern = '(?<scheme>[A-Za-z][A-Za-z0-9+\.\-]*):[^\s""]+'
    }


    process {

        # process each input text line
        foreach ($line in $Text) {

            # get first 30 chars of line for logging
            $previewText = $line.Substring(0, [Math]::Min(30, $line.Length))
            Microsoft.PowerShell.Utility\Write-Verbose ("Processing text line: $previewText...")

            # find all URI matches in the current line
            $uriMatches = [regex]::Matches($line, $uriPattern)

            foreach ($match in $uriMatches) {

                try {
                    # attempt to create Uri object from match
                    $uri = [Uri]::new($match.Value)
                    Microsoft.PowerShell.Utility\Write-Output $uri
                }
                catch {
                    # skip invalid URIs silently
                    Microsoft.PowerShell.Utility\Write-Verbose "Invalid URI found: $($match.Value)"
                }
            }
        }
    }

    end {
    }
}