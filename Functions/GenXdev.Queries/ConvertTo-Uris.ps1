<##############################################################################
Part of PowerShell module : GenXdev.Queries
Original cmdlet filename  : ConvertTo-Uris.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.300.2025
################################################################################
Copyright (c)  René Vaessen / GenXdev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
################################################################################>
###############################################################################

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