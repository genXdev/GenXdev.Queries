// ################################################################################
// Part of PowerShell module : GenXdev.Queries.Webbrowser
// Original cmdlet filename  : Clear-YoutubeWatched.cs
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



using System.Management.Automation;

namespace GenXdev.Queries.Webbrowser
{

    /// <summary>
    /// <para type="synopsis">
    /// Clears the YouTube watch history from the browser's local storage.
    /// </para>
    ///
    /// <para type="description">
    /// This function selects a YouTube tab in the browser and clears the watch history
    /// by resetting the local storage value for watched videos of the
    /// Open-AllYoutubeVideos -> qvideos cmdlet. It requires an open
    /// YouTube tab in the browser.
    /// </para>
    ///
    /// <example>
    /// <para>Clears the watch history of the Open-AllYoutubeVideos -> qvideos cmdlet, in the currently open YouTube tab.</para>
    /// <code>
    /// Clear-YoutubeWatched
    /// </code>
    /// </example>
    /// </summary>
    [Cmdlet(VerbsCommon.Clear, "YoutubeWatched")]
    [OutputType(typeof(void))]
    public class ClearYoutubeWatchedCommand : PSGenXdevCmdlet
    {
        /// <summary>
        /// Begin processing - initialization logic
        /// </summary>
        protected override void BeginProcessing()
        {
            WriteVerbose("Searching for an open YouTube browser tab...");
        }

        /// <summary>
        /// Process record - main cmdlet logic
        /// </summary>
        protected override void ProcessRecord()
        {
            try
            {
                // Call PowerShell cmdlet to select YouTube tab
                InvokeCommand.InvokeScript("GenXdev.Webbrowser\\Select-WebbrowserTab -Name '*youtube*'");

                // Retrieve the chromeSession variable from PowerShell session state
                var chromeSessionVar = SessionState.PSVariable.Get("chromeSession");

                // Check if chromeSession is null or not a PSCustomObject (equivalent to -isnot [PSCustomObject])
                var psObj = chromeSessionVar?.Value as PSObject;
                if (psObj == null || !psObj.TypeNames.Contains("System.Management.Automation.PSCustomObject"))
                {
                    throw new Exception("No active YouTube tab found in browser");
                }

                WriteVerbose("Clearing YouTube watch history from local storage...");

                // Call PowerShell cmdlet to clear local storage
                InvokeCommand.InvokeScript("GenXdev.Webbrowser\\Invoke-WebbrowserEvaluation -Script \"localStorage['oaytvDone'] = '[]'\"");

                WriteVerbose("YouTube watch history cleared successfully");
            }
            catch (Exception e)
            {
                // Replicate the original PowerShell error handling by throwing with the same message format
                throw new Exception($"Failed to clear YouTube watch history: {e.Message}");
            }
        }

        /// <summary>
        /// End processing - cleanup logic (empty as in original)
        /// </summary>
        protected override void EndProcessing()
        {
        }
    }
}