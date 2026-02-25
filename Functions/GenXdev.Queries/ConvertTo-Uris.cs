// ################################################################################
// Part of PowerShell module : GenXdev.Queries
// Original cmdlet filename  : ConvertTo-Uris.cs
// Original author           : René Vaessen / GenXdev
// Version                   : 3.3.2026
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
using System.Text.RegularExpressions;

namespace GenXdev.Queries
{
    /// <summary>
    /// <para type="synopsis">
    /// Parses strings for any valid URI.
    /// </para>
    ///
    /// <para type="description">
    /// Extracts all valid URIs from input text, supporting standard and custom URI
    /// schemes like http:, https:, ftp:, magnet:, about:, etc. Returns Uri objects for
    /// each valid URI found.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Text &lt;string[]&gt;<br/>
    /// One or more text strings that may contain URIs to parse.<br/>
    /// - <b>Position</b>: 0<br/>
    /// </para>
    ///
    /// <example>
    /// <para>ConvertTo-Uris -Text "Check out https://github.com and about:config"</para>
    /// <para>Parses the provided text string for URIs and returns Uri objects.</para>
    /// <code>
    /// ConvertTo-Uris -Text "Check out https://github.com and about:config"
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>"Visit http://example.com" | ConvertTo-Uris</para>
    /// <para>Pipes a text string to the cmdlet for URI parsing.</para>
    /// <code>
    /// "Visit http://example.com" | ConvertTo-Uris
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsData.ConvertTo, "Uris")]
    [OutputType(typeof(Uri))]
    public class ConvertToUrisCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// One or more text strings that may contain URIs to parse
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 0,
            ValueFromPipeline = true,
            HelpMessage = "Text input that may contain URIs"
        )]
        [ValidateNotNull()]
        public string[] Text { get; set; }

        private Regex uriRegex;

        /// <summary>
        /// Initialize URI parsing
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Initializing URI parsing");

            // Regex pattern to match URIs with various schemes
            uriRegex = new Regex(@"(?<scheme>[A-Za-z][A-Za-z0-9+\.\-]*):[^\s""]+");
        }

        /// <summary>
        /// Process each input text line
        /// </summary>
        protected override void ProcessRecord()
        {
            if (Text == null)
            {
                return;
            }

            // Process each input text line
            foreach (var line in Text)
            {
                // Get first 30 chars of line for logging
                var previewText = line.Length > 30 ? line.Substring(0, 30) : line;

                WriteVerbose($"Processing text line: {previewText}...");

                // Find all URI matches in the current line
                var uriMatches = uriRegex.Matches(line);

                foreach (Match match in uriMatches)
                {
                    try
                    {
                        // Attempt to create Uri object from match
                        var uri = new Uri(match.Value);

                        WriteObject(uri);
                    }
                    catch
                    {
                        // Skip invalid URIs silently
                        WriteVerbose($"Invalid URI found: {match.Value}");
                    }
                }
            }
        }

        /// <summary>
        /// End processing
        /// </summary>
        protected override void EndProcessing()
        {
            // No cleanup needed
        }
    }
}