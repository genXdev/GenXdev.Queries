// ################################################################################
// Part of PowerShell module : GenXdev.Queries.Text
// Original cmdlet filename  : Get-NextAffirmation.cs
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



using System.Text.Json;
using System.Management.Automation;

namespace GenXdev.Queries.Text
{
    /// <summary>
    /// <para type="synopsis">
    /// Returns a random affirmation text from affirmations.dev API.
    /// </para>
    ///
    /// <para type="description">
    /// Retrieves an affirmation from the affirmations.dev API and optionally speaks it
    /// using text-to-speech.
    /// </para>
    ///
    /// <para type="description">
    /// PARAMETERS
    /// </para>
    ///
    /// <para type="description">
    /// -Speak &lt;SwitchParameter&gt;<br/>
    /// When specified, uses text-to-speech to speak the affirmation out loud.<br/>
    /// - <b>Position</b>: 0<br/>
    /// - <b>Default</b>: false<br/>
    /// </para>
    ///
    /// <example>
    /// <para>Get a random affirmation</para>
    /// <para>This example retrieves a random affirmation from the API.</para>
    /// <code>
    /// Get-NextAffirmation
    /// </code>
    /// </example>
    ///
    /// <example>
    /// <para>Get a random affirmation and speak it</para>
    /// <para>This example retrieves a random affirmation and speaks it using text-to-speech.</para>
    /// <code>
    /// Get-NextAffirmation -Speak
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Get, "NextAffirmation")]
    [Alias("WhatAboutIt")]
    [OutputType(typeof(string))]
    public class GetNextAffirmationCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// When specified, uses text-to-speech to speak the affirmation out loud.
        /// </summary>
        [Parameter(
            Mandatory = false,
            Position = 0,
            HelpMessage = "Use text-to-speech to speak the affirmation"
        )]
        public SwitchParameter Speak { get; set; }

        /// <summary>
        /// Begin processing - initialize API endpoint
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Using API endpoint: https://www.affirmations.dev/");
        }

        /// <summary>
        /// Process record - fetch and process affirmation
        /// </summary>
        protected override void ProcessRecord()
        {
            try
            {
                WriteVerbose("Fetching affirmation from API...");

                using (var client = new HttpClient())
                {
                    client.Timeout = TimeSpan.FromSeconds(2);

                    var response = client.GetStringAsync("https://www.affirmations.dev/").Result;
                    var jsonDoc = JsonDocument.Parse(response);
                    var affirmation = jsonDoc.RootElement.GetProperty("affirmation").GetString();

                    if (Speak)
                    {
                        WriteVerbose("Speaking affirmation using text-to-speech");
                        var speechScript = ScriptBlock.Create("param($affirmation) GenXdev.Console\\Start-TextToSpeech $affirmation");
                        speechScript.Invoke(affirmation);
                    }

                    WriteObject(affirmation);
                }
            }
            catch (Exception ex)
            {
                WriteError(new ErrorRecord(ex, "FailedToRetrieveAffirmation", ErrorCategory.ConnectionError, null));
            }
        }

        /// <summary>
        /// End processing - no cleanup needed
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}