// ################################################################################
// Part of PowerShell module : GenXdev.Queries.Webbrowser
// Original cmdlet filename  : Get-GoogleSearchResultUrls.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 2.3.2026
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



using System.Management.Automation;

namespace GenXdev.Queries.Webbrowser
{
    /// <summary>
    /// <para type="synopsis">
    /// Performs a google search and returns the links
    /// </para>
    ///
    /// <para type="description">
    /// Performs a google search and returns the links
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Queries &lt;string[]&gt;<br/>
    /// The query to perform<br/>
    /// - <b>Aliases</b>: q, Name, Text, Query<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Max &lt;int&gt;<br/>
    /// The maximum number of results to obtain, defaults to 200<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Default</b>: 200<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Language &lt;string&gt;<br/>
    /// The language of the returned search results<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>ValidateSet</b>: Afrikaans, Akan, Albanian, Amharic, Arabic, Armenian, Azerbaijani, Basque, Belarusian, Bemba, Bengali, Bihari, Bork, bork, bork!, Bosnian, Breton, Bulgarian, Cambodian, Catalan, Cherokee, Chichewa, Chinese (Simplified), Chinese (Traditional), Corsican, Croatian, Czech, Danish, Dutch, Elmer Fudd, English, Esperanto, Estonian, Ewe, Faroese, Filipino, Finnish, French, Frisian, Ga, Galician, Georgian, German, Greek, Guarani, Gujarati, Hacker, Haitian Creole, Hausa, Hawaiian, Hebrew, Hindi, Hungarian, Icelandic, Igbo, Indonesian, Interlingua, Irish, Italian, Japanese, Javanese, Kannada, Kazakh, Kinyarwanda, Kirundi, Klingon, Kongo, Korean, Krio (Sierra Leone), Kurdish, Kurdish (Soranî), Kyrgyz, Laothian, Latin, Latvian, Lingala, Lithuanian, Lozi, Luganda, Luo, Macedonian, Malagasy, Malay, Malayalam, Maltese, Maori, Marathi, Mauritian Creole, Moldavian, Mongolian, Montenegrin, Nepali, Nigerian Pidgin, Northern Sotho, Norwegian, Norwegian (Nynorsk), Occitan, Oriya, Oromo, Pashto, Persian, Pirate, Polish, Portuguese (Brazil), Portuguese (Portugal), Punjabi, Quechua, Romanian, Romansh, Runyakitara, Russian, Scots Gaelic, Serbian, Serbo-Croatian, Sesotho, Setswana, Seychellois Creole, Shona, Sindhi, Sinhalese, Slovak, Slovenian, Somali, Spanish, Spanish (Latin American), Sundanese, Swahili, Swedish, Tajik, Tamil, Tatar, Telugu, Thai, Tigrinya, Tonga, Tshiluba, Tumbuka, Turkish, Turkmen, Twi, Uighur, Ukrainian, Urdu, Uzbek, Vietnamese, Welsh, Wolof, Xhosa, Yiddish, Yoruba, Zulu<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Example description</para>
    /// <para>Detailed explanation of the example.</para>
    /// <code>
    /// Get-GoogleSearchResultUrls "site:github.com PowerShell module"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "GoogleSearchResultUrls")]
    [OutputType(typeof(string))]
    [Alias("qlinksget")]
    public partial class GetGoogleSearchResultUrlsCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// The query to perform
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromRemainingArguments = true,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "The query to perform")]
        [Alias("q", "Name", "Text", "Query")]
        public string[] Queries { get; set; }

        /// <summary>
        /// The maximum number of results to obtain, defaults to 200
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "The maximum number of results to obtain, defaults to 200")]
        public int Max { get; set; } = 200;

        /// <summary>
        /// The language of the returned search results
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "The language of the returned search results")]
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
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Starting Google search operation");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            foreach (string query in Queries)
            {
                WriteVerbose($"Processing query: {query} with language: {Language ?? "default"}");

                // Prepare language key for search URL
                string langKey = "&hl=en";
                if (!string.IsNullOrEmpty(Language))
                {
                    // Get language dictionary
                    var scriptBlock = ScriptBlock.Create("param($lang) (GenXdev.Helpers\\Get-WebLanguageDictionary)[$lang]");
                    var langResult = scriptBlock.Invoke(Language);
                    string langCode = langResult[0]?.ToString() ?? "";
                    langKey = $"&hl=en&lr=lang_{Uri.EscapeDataString(langCode)}";
                }

                // Prepare search URL
                string encodedQuery = Uri.EscapeDataString(query);
                string url = $"https://www.google.com/search?q={encodedQuery}{langKey}";
                var results = new List<string>();

                // Navigate to search page
                WriteVerbose($"Navigating to: {url}");
                var setLocationScript = ScriptBlock.Create("param($url) GenXdev.Webbrowser\\Set-WebbrowserTabLocation $url");
                foreach (var line in setLocationScript.Invoke(url))
                {
                    System.Console.WriteLine(line.ToString().Trim());
                }

                bool more = true;
                int i = 0;
                do
                {
                    WriteVerbose("Scanning page for URLs...");

                    // Get DOM nodes and extract hrefs
                    var getNodesScript = ScriptBlock.Create(@"
param($maxCount)
GenXdev.Webbrowser\Get-WebbrowserTabDomNodes a ""e.getAttribute('href')"" |
    Microsoft.PowerShell.Core\Where-Object { -not (""$PSItem"" -like '*google*') } |
    Microsoft.PowerShell.Core\Where-Object { ""$PSItem"" -like 'http?://*' } |
    Microsoft.PowerShell.Core\Select-Object -First $maxCount
");
                    var hrefs = getNodesScript.Invoke(Max - results.Count);

                    foreach (var href in hrefs)
                    {
                        string urlString = href?.ToString();
                        if (string.IsNullOrEmpty(urlString)) continue;
                        if (results.Count >= Max) break;
                        if (!results.Contains(urlString))
                        {
                            results.Add(urlString);
                        }
                    }

                    if (results.Count >= Max) break;

                    try
                    {
                        // Click Next button
                        var clickScript = ScriptBlock.Create(@"
$Global:chromeController.GetByText('Next')[0].ClickAsync().Wait();
$Global:chromeController.WaitForNavigationAsync().Wait();
$true
");
                        clickScript.Invoke();
                        more = true;
                    }
                    catch
                    {
                        more = i++ > 3;
                    }

                    // Sleep for 1 second
                    var sleepScript = ScriptBlock.Create("Microsoft.PowerShell.Utility\\Start-Sleep -Seconds 1");
                    sleepScript.Invoke();
                } while (more && (results.Count < Max));

                WriteVerbose($"Found {results.Count} unique URLs");

                // Output results
                foreach (string result in results)
                {
                    WriteObject(result);
                }
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
            // No cleanup needed
        }
    }
}