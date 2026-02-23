// ################################################################################
// Part of PowerShell module : GenXdev.Queries.Text
// Original cmdlet filename  : Get-WikipediaSummary.cs
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

namespace GenXdev.Queries.Text
{
    /// <summary>
    /// <para type="synopsis">
    /// Retrieves a summary of a topic from Wikipedia.
    /// </para>
    ///
    /// <para type="description">
    /// Queries the Wikipedia API to get a concise summary of the specified topic,
    /// removing parenthetical content for improved readability.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Queries &lt;string[]&gt;<br/>
    /// One or more search terms to look up on Wikipedia.<br/>
    /// - <b>Aliases</b>: q, Name, Text, Query<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Mandatory</b>: true<br/>
    /// - <b>ValueFromPipeline</b>: true<br/>
    /// - <b>ValueFromPipelineByPropertyName</b>: true<br/>
    /// - <b>HelpMessage</b>: The query to perform<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get a Wikipedia summary for PowerShell</para>
    /// <para>This example retrieves a summary of PowerShell from Wikipedia.</para>
    /// <code>
    /// Get-WikipediaSummary -Queries "PowerShell"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get Wikipedia summaries for multiple topics</para>
    /// <para>This example retrieves summaries for PowerShell, TypeScript, and C#.</para>
    /// <code>
    /// wikitxt "PowerShell", "Typescript", "C#"
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "WikipediaSummary")]
    [Alias("wikitxt")]
    [OutputType(typeof(string))]
    public class GetWikipediaSummaryCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// One or more search terms to look up on Wikipedia.
        /// </summary>
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromRemainingArguments = false,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true,
            HelpMessage = "The query to perform")]
        [Alias("q", "Name", "Text", "Query")]
        public string[] Queries { get; set; }

        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
        }

        /// <summary>
        /// Helper method to clean up wikipedia text by removing parentheticals
        /// </summary>
        /// <param name="text">The text to clean</param>
        /// <returns>The cleaned text</returns>
        private string RemoveParentheticalContent(string text)
        {
            // Find the first opening parenthesis
            var i = text.IndexOf('(');

            // If no parenthesis found or it's after position 150, return as-is
            if (i >= 150)
            {
                return text;
            }

            // If parenthesis is at the end, remove it and trailing space
            if (i == text.Length - 1)
            {
                return text.Substring(0, i).Replace("  ", " ");
            }

            // Find the matching closing parenthesis
            var end = text.IndexOf(')', i);

            // Build result by removing the parenthetical content
            var result = text.Substring(0, i);

            // Add the rest of the text after the closing parenthesis
            if (end < text.Length)
            {
                result += text.Substring(end + 1);
            }

            // Clean up double spaces
            return result.Replace("  ", " ");
        }

        /// <summary>
        /// Process record - main cmdlet logic for each query
        /// </summary>
        protected override void ProcessRecord()
        {
            // Process each query in the array
            foreach (var query in Queries)
            {
                // Log the search operation
                WriteVerbose($"Searching Wikipedia for: {query}");

                // Prepare the URL-encoded query
                var urlPart = Uri.EscapeDataString(query.Replace("-", " "));

                // Construct the Wikipedia API URL
                var url = $"https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=1&explaintext=1&titles={urlPart}";

                try
                {
                    // Fetch the response using PowerShell's Invoke-WebRequest
                    var webRequestScript = ScriptBlock.Create("param($url) Microsoft.PowerShell.Utility\\Invoke-WebRequest -Uri $url -MaximumRedirection 20");
                    var response = webRequestScript.Invoke(url);

                    // Extract the content from the response
                    var content = response[0].Properties["Content"].Value.ToString();

                    // Parse the JSON response using PowerShell's ConvertFrom-Json
                    var jsonParseScript = ScriptBlock.Create("param($content) $content | Microsoft.PowerShell.Utility\\ConvertFrom-Json");
                    var data = jsonParseScript.Invoke(content);

                    // Navigate to the pages object
                    var queryObj = ((PSObject)data[0]).Properties["query"].Value;
                    var pages = ((PSObject)queryObj).Properties["pages"].Value;

                    // Get the first page ID (there should be only one)
                    var properties = ((PSObject)pages).Properties;
                    if (properties.Count() == 0)
                    {
                        WriteWarning($"No Wikipedia content found for '{query}'");
                        continue;
                    }

                    var pageId = properties.First().Name;

                    // Extract the page content
                    var page = ((PSObject)pages).Properties[pageId].Value;
                    var extract = ((PSObject)page).Properties["extract"].Value.ToString();

                    // Check if content was found
                    if (string.IsNullOrEmpty(extract))
                    {
                        WriteWarning($"No Wikipedia content found for '{query}'");
                        continue;
                    }

                    // Log successful content retrieval
                    WriteVerbose("Found content, cleaning up response");

                    try
                    {
                        // Clean up the content by removing parentheticals
                        var cleanedContent = RemoveParentheticalContent(extract);
                        WriteObject(cleanedContent);
                    }
                    catch
                    {
                        // If cleaning fails, return the raw extract
                        WriteVerbose("Failed to clean content, returning raw extract");
                        WriteObject(extract);
                    }
                }
                catch (Exception ex)
                {
                    // Handle errors by writing a PowerShell error record
                    WriteError(new ErrorRecord(ex, "WikipediaQueryFailed", ErrorCategory.InvalidOperation, query));
                }
            }
        }

        /// <summary>
        /// End processing - cleanup logic
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}