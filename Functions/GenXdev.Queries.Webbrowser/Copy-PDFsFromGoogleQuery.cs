// ################################################################################
// Part of PowerShell module : GenXdev.Queries.Webbrowser
// Original cmdlet filename  : Copy-PDFsFromGoogleQuery.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 3.23.2026
// ################################################################################
// Copyright (c)  René Vaessen / GenXdev
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ################################################################################



using System.Collections;
using System.Management.Automation;

namespace GenXdev.Queries.Webbrowser
{

    /// <summary>
    /// <para type="synopsis">
    /// Downloads PDF files found through Google search results.
    /// </para>
    ///
    /// <para type="description">
    /// Performs a Google query in the previously selected webbrowser tab and downloads
    /// all found PDF files into the current directory. Supports multiple queries and
    /// language filtering.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Queries &lt;String[]&gt;<br/>
    /// The search terms to query Google for PDF files.<br/>
    /// - <b>Aliases</b>: q, Name, Text, Query<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Max &lt;Int32&gt;<br/>
    /// Maximum number of results to retrieve.<br/>
    /// - <b>Position</b>: 1<br/>
    /// - <b>Default</b>: 200<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Language &lt;String&gt;<br/>
    /// Optional language filter for search results.<br/>
    /// - <b>Position</b>: 2<br/>
    /// - <b>Default</b>: null (default language)<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Download PDF files with language filtering</para>
    /// <para>Opens a browser, selects a tab, creates a pdfs directory, and downloads up
    /// to 50 PDF files matching the search query with English language filter.</para>
    /// <code>
    /// Open-Webbrowser
    /// Select-WebbrowserTab
    /// $null = New-Item -ItemType Directory -Name pdfs
    /// Set-Location pdfs
    /// Copy-PDFsFromGoogleQuery "scientific paper co2" -Max 50 -Language "English"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Download PDFs for multiple search terms</para>
    /// <para>Downloads PDF files for multiple search queries with default settings.</para>
    /// <code>
    /// Copy-PDFsFromGoogleQuery "climate research", "renewable energy" -Max 100
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Copy, "PDFsFromGoogleQuery")]
    [OutputType(typeof(FileInfo))]
    public partial class CopyPDFsFromGoogleQueryCommand : PSGenXdevCmdlet
    {

        /// <summary>
        /// The search terms to query Google for PDF files
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromRemainingArguments = false,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "The search terms to query Google for PDF files")]
        [Alias("q", "Name", "Text", "Query")]
        public string[] Queries { get; set; }

        /// <summary>
        /// Maximum number of results to retrieve (default: 200)
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 1,
            HelpMessage = "Maximum number of results to retrieve (default: 200)")]
        public int Max { get; set; } = 200;

        /// <summary>
        /// Optional language filter for search results
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 2,
            HelpMessage = "Optional language filter for search results")]
        [ValidateSet(
            "Afrikaans",
            "Akan",
            "Albanian",
            "Amharic",
            "Arabic",
            "Armenian",
            "Azerbaijani",
            "Basque",
            "Belarusian",
            "Bemba",
            "Bengali",
            "Bihari",
            "Bork, bork, bork!",
            "Bosnian",
            "Breton",
            "Bulgarian",
            "Cambodian",
            "Catalan",
            "Cherokee",
            "Chichewa",
            "Chinese (Simplified)",
            "Chinese (Traditional)",
            "Corsican",
            "Croatian",
            "Czech",
            "Danish",
            "Dutch",
            "Elmer Fudd",
            "English",
            "Esperanto",
            "Estonian",
            "Ewe",
            "Faroese",
            "Filipino",
            "Finnish",
            "French",
            "Frisian",
            "Ga",
            "Galician",
            "Georgian",
            "German",
            "Greek",
            "Guarani",
            "Gujarati",
            "Hacker",
            "Haitian Creole",
            "Hausa",
            "Hawaiian",
            "Hebrew",
            "Hindi",
            "Hungarian",
            "Icelandic",
            "Igbo",
            "Indonesian",
            "Interlingua",
            "Irish",
            "Italian",
            "Japanese",
            "Javanese",
            "Kannada",
            "Kazakh",
            "Kinyarwanda",
            "Kirundi",
            "Klingon",
            "Kongo",
            "Korean",
            "Krio (Sierra Leone)",
            "Kurdish",
            "Kurdish (Soranî)",
            "Kyrgyz",
            "Laothian",
            "Latin",
            "Latvian",
            "Lingala",
            "Lithuanian",
            "Lozi",
            "Luganda",
            "Luo",
            "Macedonian",
            "Malagasy",
            "Malay",
            "Malayalam",
            "Maltese",
            "Maori",
            "Marathi",
            "Mauritian Creole",
            "Moldavian",
            "Mongolian",
            "Montenegrin",
            "Nepali",
            "Nigerian Pidgin",
            "Northern Sotho",
            "Norwegian",
            "Norwegian (Nynorsk)",
            "Occitan",
            "Oriya",
            "Oromo",
            "Pashto",
            "Persian",
            "Pirate",
            "Polish",
            "Portuguese (Brazil)",
            "Portuguese (Portugal)",
            "Punjabi",
            "Quechua",
            "Romanian",
            "Romansh",
            "Runyakitara",
            "Russian",
            "Scots Gaelic",
            "Serbian",
            "Serbo-Croatian",
            "Sesotho",
            "Setswana",
            "Seychellois Creole",
            "Shona",
            "Sindhi",
            "Sinhalese",
            "Slovak",
            "Slovenian",
            "Somali",
            "Spanish",
            "Spanish (Latin American)",
            "Sundanese",
            "Swahili",
            "Swedish",
            "Tajik",
            "Tamil",
            "Tatar",
            "Telugu",
            "Thai",
            "Tigrinya",
            "Tonga",
            "Tshiluba",
            "Tumbuka",
            "Turkish",
            "Turkmen",
            "Twi",
            "Uighur",
            "Ukrainian",
            "Urdu",
            "Uzbek",
            "Vietnamese",
            "Welsh",
            "Wolof",
            "Xhosa",
            "Yiddish",
            "Yoruba",
            "Zulu")]
        public string Language { get; set; }

        /// <summary>
        /// Process each query from the pipeline
        /// </summary>
        protected override void ProcessRecord()
        {

            foreach (string query in Queries)
            {

                WriteVerbose(
                    $"Processing query: {query} with language: {Language ?? "default"}"
                );

                string searchQuery = $"filetype:pdf {query}";

                WriteVerbose($"Using search query: {searchQuery}");

                var getUrlsScript = ScriptBlock.Create(
                    "param($searchQuery, $max, $language) " +
                    "GenXdev.Queries\\Get-GoogleSearchResultUrls " +
                    "-Queries $searchQuery -Max $max -Language $language"
                );

                var urlResults = getUrlsScript.Invoke(searchQuery, Max, Language);

                var urls = new List<string>();

                foreach (var result in urlResults)
                {

                    if (result == null) continue;

                    var baseObj = result.BaseObject;

                    if (baseObj is string urlStr)
                    {

                        urls.Add(urlStr);
                    }
                    else if (baseObj is IEnumerable enumerable && !(baseObj is string))
                    {

                        foreach (var item in enumerable)
                        {

                            if (item != null)
                            {

                                urls.Add(item.ToString());
                            }
                        }
                    }
                    else
                    {

                        urls.Add(baseObj.ToString());
                    }
                }

                WriteVerbose($"Found {urls.Count} PDF URLs to process");

                WriteVerbose("Starting parallel download with throttle limit: 64");

                string currentPwd = SessionState.Path.CurrentFileSystemLocation.Path;

                var parallelScript = ScriptBlock.Create(
                    "param($urls, $currentPwd) " +
                    "$urls | Microsoft.PowerShell.Core\\ForEach-Object -ThrottleLimit 64 -Parallel {" +
                    "    try {" +
                    "        Microsoft.PowerShell.Utility\\Write-Verbose \"Processing URL: $PSItem\";" +
                    "        $safeName = [Uri]::UnescapeDataString(" +
                    "            [IO.Path]::GetFileName($PSItem)" +
                    "        ).Split('#')[0].Split('?')[0];" +
                    "        $safeName = $safeName -replace '[\\\\/:*?\"<>|\\s]', '_';" +
                    "        Microsoft.PowerShell.Utility\\Write-Verbose \"Sanitized filename: $safeName\";" +
                    "        $destination = Microsoft.PowerShell.Management\\Join-Path $using:currentPwd (" +
                    "            '{0}_{1}_{2}.pdf' -f $safeName," +
                    "            [DateTime]::UtcNow.Ticks," +
                    "            [Threading.Thread]::CurrentThread.ManagedThreadId" +
                    "        );" +
                    "        Microsoft.PowerShell.Utility\\Write-Verbose \"Downloading to: $destination\";" +
                    "        $response = Microsoft.PowerShell.Utility\\Invoke-WebRequest -Uri $PSItem -OutFile $destination;" +
                    "        Microsoft.PowerShell.Utility\\Write-Verbose \"Download completed: $($response.StatusCode) - $($response.StatusDescription)\";" +
                    "        $fileInfo = Microsoft.PowerShell.Management\\Get-Item -LiteralPath $destination;" +
                    "        Microsoft.PowerShell.Utility\\Write-Verbose \"Saved file: $($fileInfo.FullName) ($($fileInfo.Length) bytes)\";" +
                    "        $fileInfo" +
                    "    }" +
                    "    catch {" +
                    "        Microsoft.PowerShell.Utility\\Write-Warning \"Failed to download: $PSItem. Error: $($_.Exception.Message)\"" +
                    "    }" +
                    "}"
                );

                var downloadResults = parallelScript.Invoke(urls.ToArray(), currentPwd);

                foreach (var downloadedFile in downloadResults)
                {

                    WriteObject(downloadedFile);
                }

                var cleanupScript = ScriptBlock.Create(
                    "Microsoft.PowerShell.Management\\Get-ChildItem -LiteralPath .\\ -filter \"*.pdf\" | " +
                    "Microsoft.PowerShell.Core\\ForEach-Object {" +
                    "    $newName = [System.Text.RegularExpressions.Regex]::Replace(($_.Name), '\\.pdf_\\d*_\\d*\\.pdf', '.pdf');" +
                    "    if ($newName -eq $_.Name) { return };" +
                    "    if ([IO.File]::Exists((GenXdev.FileSystem\\Expand-Path \".\\\\$newName\"))) {" +
                    "        $null = Microsoft.PowerShell.Management\\Remove-Item -LiteralPath $_.FullName -Force;" +
                    "        return" +
                    "    };" +
                    "    $null = Microsoft.PowerShell.Management\\Rename-Item -LiteralPath $_ $newName -Force" +
                    "}"
                );

                cleanupScript.Invoke();
            }
        }
    }
}
