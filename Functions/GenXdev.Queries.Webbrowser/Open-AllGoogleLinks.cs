// ################################################################################
// Part of PowerShell module : GenXdev.Queries.Webbrowser
// Original cmdlet filename  : Open-AllGoogleLinks.cs
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
    /// Performs an infinite auto opening google search.
    /// </para>
    ///
    /// <para type="description">
    /// Performs a google search.
    /// Opens 10 tabs each times, pauses until initial tab is revisited
    /// Close initial tab to stop
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Queries &lt;String[]&gt;<br/>
    /// The query to perform<br/>
    /// - <b>Aliases</b>: q, Name, Text, Query<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// </para>
    ///
    /// <para type="description">
    /// -Language &lt;String&gt;<br/>
    /// The language of the returned search results<br/>
    /// - <b>Position</b>: named<br/>
    /// - <b>Mandatory</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Example description</para>
    /// <para>Detailed explanation of the example.</para>
    /// <code>
    /// Open-AllGoogleLinks "site:github.com PowerShell module"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Open, "AllGoogleLinks")]
    [Alias("qlinks")]
    [OutputType(typeof(void))]
    public class OpenAllGoogleLinksCommand : PSGenXdevCmdlet
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
            HelpMessage = "The query to perform"
        )]
        [Alias("q", "Name", "Text", "Query")]
        public string[] Queries { get; set; }

        /// <summary>
        /// The language of the returned search results
        /// </summary>
        [Parameter(
            Mandatory = false,
            HelpMessage = "The language of the returned search results"
        )]
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

        private string langKey;

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            // Set default language key
            langKey = "&hl=en";

            // If language is specified, get the language key
            if (!string.IsNullOrWhiteSpace(Language))
            {
                // Call PowerShell to get the web language dictionary
                var getLangDictScript = ScriptBlock.Create("GenXdev.Helpers\\Get-WebLanguageDictionary");
                var langDictResult = getLangDictScript.Invoke();
                var langDict = (Hashtable)((PSObject)langDictResult[0]).BaseObject;

                // Get the language code
                var langCode = (string)langDict[Language];
                langKey = "&hl=en&lr=lang_" + Uri.EscapeDataString(langCode);
            }
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            // Process each query
            foreach (var query in Queries)
            {
                // Convert query to string
                var queryString = query.ToString();

                // Set global data in PowerShell
                var setGlobalDataScript = ScriptBlock.Create("$global:data = @{ urls = @(); query = $args[0] }");
                setGlobalDataScript.Invoke(queryString);

                // Build the initial URL
                var initialUrl = "https://www.google.com/search?q=" + Uri.EscapeDataString(queryString) + langKey;

                // Get the script path
                var scriptPath = Path.Combine(this.MyInvocation.MyCommand.Module.ModuleBase, "functions", "GenXdev.Queries.Webbrowser", "Open-AllGoogleLinks.js");

                // Call the Invoke-WebbrowserTabPollingScript cmdlet
                var invokeScript = ScriptBlock.Create("param($scripts, $initialUrl) GenXdev.Queries\\Invoke-WebbrowserTabPollingScript -Scripts $scripts -InitialUrl $initialUrl");
                foreach (var o in invokeScript.Invoke(new object[] { new string[] { scriptPath } }, initialUrl))
                {
                    WriteObject(o);
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