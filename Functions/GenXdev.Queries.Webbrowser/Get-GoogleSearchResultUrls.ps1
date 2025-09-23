<##############################################################################
Part of PowerShell module : GenXdev.Queries.Webbrowser
Original cmdlet filename  : Get-GoogleSearchResultUrls.ps1
Original author           : René Vaessen / GenXdev
Version                   : 1.286.2025
################################################################################
MIT License

Copyright 2021-2025 GenXdev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
################################################################################>
###############################################################################

<#
.SYNOPSIS
Performs a google search and returns the links

.DESCRIPTION
Performs a google search and returns the links

.PARAMETER Query
The google query to perform

.PARAMETER Max
The maximum number of results to obtain, defaults to 200

.EXAMPLE
PS C:\> $Urls = Get-GoogleSearchResultUrls "site:github.com PowerShell module"; $Urls

.NOTES
Requires the Windows 10+ Operating System
##############################################################################
#>
###############################################################################

function Get-GoogleSearchResultUrls {

    [CmdletBinding()]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns', '')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
    [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Alias('qlinksget')]
    param(
        [parameter(
            Mandatory,
            Position = 0,
            ValueFromRemainingArguments,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = 'The query to perform'
        )]
        [Alias('q', 'Name', 'Text', 'Query')]
        [string[]] $Queries,
        #
        [parameter(
            Mandatory = $false,
            HelpMessage = 'The maximum number of results to obtain, defaults to 200'
        )]
        [int] $Max = 200,
        ###############################################################################
        [ValidateSet(
            'Afrikaans',
            'Akan',
            'Albanian',
            'Amharic',
            'Arabic',
            'Armenian',
            'Azerbaijani',
            'Basque',
            'Belarusian',
            'Bemba',
            'Bengali',
            'Bihari',
            'Bork, bork, bork!',
            'Bosnian',
            'Breton',
            'Bulgarian',
            'Cambodian',
            'Catalan',
            'Cherokee',
            'Chichewa',
            'Chinese (Simplified)',
            'Chinese (Traditional)',
            'Corsican',
            'Croatian',
            'Czech',
            'Danish',
            'Dutch',
            'Elmer Fudd',
            'English',
            'Esperanto',
            'Estonian',
            'Ewe',
            'Faroese',
            'Filipino',
            'Finnish',
            'French',
            'Frisian',
            'Ga',
            'Galician',
            'Georgian',
            'German',
            'Greek',
            'Guarani',
            'Gujarati',
            'Hacker',
            'Haitian Creole',
            'Hausa',
            'Hawaiian',
            'Hebrew',
            'Hindi',
            'Hungarian',
            'Icelandic',
            'Igbo',
            'Indonesian',
            'Interlingua',
            'Irish',
            'Italian',
            'Japanese',
            'Javanese',
            'Kannada',
            'Kazakh',
            'Kinyarwanda',
            'Kirundi',
            'Klingon',
            'Kongo',
            'Korean',
            'Krio (Sierra Leone)',
            'Kurdish',
            'Kurdish (Soranî)',
            'Kyrgyz',
            'Laothian',
            'Latin',
            'Latvian',
            'Lingala',
            'Lithuanian',
            'Lozi',
            'Luganda',
            'Luo',
            'Macedonian',
            'Malagasy',
            'Malay',
            'Malayalam',
            'Maltese',
            'Maori',
            'Marathi',
            'Mauritian Creole',
            'Moldavian',
            'Mongolian',
            'Montenegrin',
            'Nepali',
            'Nigerian Pidgin',
            'Northern Sotho',
            'Norwegian',
            'Norwegian (Nynorsk)',
            'Occitan',
            'Oriya',
            'Oromo',
            'Pashto',
            'Persian',
            'Pirate',
            'Polish',
            'Portuguese (Brazil)',
            'Portuguese (Portugal)',
            'Punjabi',
            'Quechua',
            'Romanian',
            'Romansh',
            'Runyakitara',
            'Russian',
            'Scots Gaelic',
            'Serbian',
            'Serbo-Croatian',
            'Sesotho',
            'Setswana',
            'Seychellois Creole',
            'Shona',
            'Sindhi',
            'Sinhalese',
            'Slovak',
            'Slovenian',
            'Somali',
            'Spanish',
            'Spanish (Latin American)',
            'Sundanese',
            'Swahili',
            'Swedish',
            'Tajik',
            'Tamil',
            'Tatar',
            'Telugu',
            'Thai',
            'Tigrinya',
            'Tonga',
            'Tshiluba',
            'Tumbuka',
            'Turkish',
            'Turkmen',
            'Twi',
            'Uighur',
            'Ukrainian',
            'Urdu',
            'Uzbek',
            'Vietnamese',
            'Welsh',
            'Wolof',
            'Xhosa',
            'Yiddish',
            'Yoruba',
            'Zulu')]
        [parameter(
            Mandatory = $false,
            HelpMessage = 'The language of the returned search results'
        )]
        [string] $Language
    )

    begin {
        Microsoft.PowerShell.Utility\Write-Verbose "Starting Google search operation"
    }

    process {
        foreach ($query in $Queries) {
            Microsoft.PowerShell.Utility\Write-Verbose "Processing query: $query with language: $($Language ?? 'default')"

            # prepare language key for search URL
            $langKey = '&hl=en'
            if ($Language) {
                $langKey = "&hl=en&lr=lang_$([Uri]::EscapeUriString((GenXdev.Helpers\Get-WebLanguageDictionary)[$Language]))"
            }

            # prepare search URL
            $encodedQuery = [Uri]::EscapeUriString($query)
            $url = "https://www.google.com/search?q=$encodedQuery$langKey"
            $results = [System.Collections.Generic.List[string]]::new()

            # navigate to search page
            Microsoft.PowerShell.Utility\Write-Verbose "Navigating to: $url"
            GenXdev.Webbrowser\Set-WebbrowserTabLocation $url

            $more = $true
            $i = 0
            do {
                Microsoft.PowerShell.Utility\Write-Verbose 'Scanning page for URLs...'
                GenXdev.Webbrowser\Get-WebbrowserTabDomNodes a "e.getAttribute('href')" |
                    Microsoft.PowerShell.Core\Where-Object { -not ("$PSItem" -like '*google*') } |
                    Microsoft.PowerShell.Core\Where-Object { "$PSItem" -like 'http?://*' } |
                    Microsoft.PowerShell.Core\ForEach-Object {
                        $urlString = $_
                        if ($results.Count -ge $Max) { return }
                        if (-not $results.Contains($urlString)) {
                            $results.Add($urlString)
                        }
                    }

                try {
                    $Global:chromeController.GetByText('Next')[0].ClickAsync().Wait();
                    $Global:chromeController.WaitForNavigationAsync().Wait();
                    $more = $true
                }
                catch {
                    $more = $i++ -gt 3;
                }

                Microsoft.PowerShell.Utility\Start-Sleep -Seconds 1
            } while ($more -and ($results.Count -lt $Max))

            Microsoft.PowerShell.Utility\Write-Verbose "Found $($results.Count) unique URLs"
            $results | Microsoft.PowerShell.Core\ForEach-Object { $PSItem }
        }
    }
}