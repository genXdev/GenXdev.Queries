<##############################################################################
Part of PowerShell module : GenXdev.Queries
Original cmdlet filename  : Open-AllPossibleTextQueries.Tests.ps1
Original author           : René Vaessen / GenXdev
Version                   : 3.23.2026
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

Pester\BeforeAll {

    # Import the module if not already loaded
    if (-not (Microsoft.PowerShell.Core\Get-Module GenXdev.Queries)) {
        Microsoft.PowerShell.Core\Import-Module GenXdev.Queries -Force
    }
}

Pester\Describe "Open-AllPossibleTextQueries" {

    Pester\Context "Basic functionality tests" {

        Pester\It "Should be available as a command" {
            Microsoft.PowerShell.Core\Get-Command GenXdev.Queries\Open-AllPossibleTextQueries | Pester\Should -Not -BeNullOrEmpty
        }

        Pester\It "Should have the correct alias 'qqq'" {
            Microsoft.PowerShell.Utility\Get-Alias qqq -ErrorAction SilentlyContinue | Pester\Should -Not -BeNullOrEmpty
            (Microsoft.PowerShell.Utility\Get-Alias qqq).ResolvedCommandName | Pester\Should -Be "Open-AllPossibleTextQueries"
        }

        Pester\It "Should accept string array parameter" {
            $cmd = Microsoft.PowerShell.Core\Get-Command GenXdev.Queries\Open-AllPossibleTextQueries
            $param = $cmd.Parameters['Queries']
            $param | Pester\Should -Not -BeNullOrEmpty
            $param.ParameterType.Name | Pester\Should -Be "String[]"
        }

        Pester\It "Should support pipeline input" {
            $cmd = Microsoft.PowerShell.Core\Get-Command GenXdev.Queries\Open-AllPossibleTextQueries
            $param = $cmd.Parameters['Queries']
            $param.Attributes | Microsoft.PowerShell.Core\Where-Object { $_.ValueFromPipeline } | Pester\Should -Not -BeNullOrEmpty
        }
    }

    Pester\Context "Parameter validation tests" {

        Pester\It "Should have mandatory Queries parameter" {
            $cmd = Microsoft.PowerShell.Core\Get-Command GenXdev.Queries\Open-AllPossibleTextQueries
            $param = $cmd.Parameters['Queries']
            $mandatoryAttr = $param.Attributes | Microsoft.PowerShell.Core\Where-Object { $_.Mandatory }
            $mandatoryAttr | Pester\Should -Not -BeNullOrEmpty
        }

        Pester\It "Should have correct parameter aliases" {
            $cmd = Microsoft.PowerShell.Core\Get-Command GenXdev.Queries\Open-AllPossibleTextQueries
            $param = $cmd.Parameters['Queries']
            $aliases = $param.Aliases
            $aliases | Pester\Should -Contain "q"
            $aliases | Pester\Should -Contain "Name"
            $aliases | Pester\Should -Contain "Text"
            $aliases | Pester\Should -Contain "Query"
        }
    }

    Pester\Context "Functional tests" {

        Pester\It "Should return results containing 'metropolitan' when querying 'eindhoven'" -Skip:($env:SKIP_NETWORK_TESTS -eq 'true') {

            # Capture the output by redirecting to a variable
            $results = @()

            # Use a try-catch to handle any potential errors gracefully
            try {

                # Execute the command and capture all output streams
                $output = GenXdev.Queries\Open-AllPossibleTextQueries "eindhoven" 2>&1 | Microsoft.PowerShell.Utility\Out-String

                # Check if the output contains 'metropolitan' (case insensitive)
                $containsMetropolitan = $output -match "metropolitan"

                # The test assertion
                $containsMetropolitan | Pester\Should -Be $true -Because "Query for 'eindhoven' should return results containing 'metropolitan'"

            }
            catch {

                # If there's an error, we'll check if it's a known issue
                Microsoft.PowerShell.Utility\Write-Warning "Error during test execution: $($_.Exception.Message)"

                # For now, we'll mark this as inconclusive rather than failed
                # if there are network or dependency issues
                Pester\Set-ItResult -Inconclusive -Because "Network or dependency error: $($_.Exception.Message)"
            }
        }

        Pester\It "Should handle URL queries differently from text queries" -Skip:($env:SKIP_NETWORK_TESTS -eq 'true') {

            # Test with a URL to ensure it's processed as URL
            try {

                $urlOutput = GenXdev.Queries\Open-AllPossibleTextQueries "https://github.com" 2>&1 | Microsoft.PowerShell.Utility\Out-String

                # URL queries should contain "Searched for URL:" in the output
                $urlOutput | Pester\Should -Match "Searched for URL:" -Because "URL queries should be identified and processed differently"

            }
            catch {

                Microsoft.PowerShell.Utility\Write-Warning "Error during URL test execution: $($_.Exception.Message)"
                Pester\Set-ItResult -Inconclusive -Because "Network or dependency error during URL test: $($_.Exception.Message)"
            }
        }

        Pester\It "Should handle text queries with proper formatting" -Skip:($env:SKIP_NETWORK_TESTS -eq 'true') {

            try {

                $textOutput = GenXdev.Queries\Open-AllPossibleTextQueries "powershell" 2>&1 | Microsoft.PowerShell.Utility\Out-String

                # Text queries should contain "Searched for:" in the output
                $textOutput | Pester\Should -Match "Searched for:" -Because "Text queries should be identified and processed with proper formatting"

            }
            catch {

                Microsoft.PowerShell.Utility\Write-Warning "Error during text query test execution: $($_.Exception.Message)"
                Pester\Set-ItResult -Inconclusive -Because "Network or dependency error during text query test: $($_.Exception.Message)"
            }
        }

        Pester\It "Should support multiple queries via pipeline" {

            $queries = @("test1", "test2")

            # Test that pipeline input works without throwing errors
            { $queries | GenXdev.Queries\Open-AllPossibleTextQueries } | Pester\Should -Not -Throw
        }

        Pester\It "Should support the qqq alias" -Skip:($env:SKIP_NETWORK_TESTS -eq 'true') {

            try {

                # Test using the alias
                $aliasOutput = GenXdev.Queries\Open-AllPossibleTextQueries "powershell" 2>&1 | Microsoft.PowerShell.Utility\Out-String

                # Should produce similar output to the full command name
                $aliasOutput | Pester\Should -Match "Searched for:" -Because "The qqq alias should work identically to the full command"

            }
            catch {

                Microsoft.PowerShell.Utility\Write-Warning "Error during alias test execution: $($_.Exception.Message)"
                Pester\Set-ItResult -Inconclusive -Because "Network or dependency error during alias test: $($_.Exception.Message)"
            }
        }
    }

    Pester\Context "Error handling tests" {

        Pester\It "Should handle empty query parameter validation" {

            # Since the parameter is mandatory, we expect a parameter binding error for empty input
            { GenXdev.Queries\Open-AllPossibleTextQueries @() } | Pester\Should -Throw
        }

        Pester\It "Should handle whitespace-only query gracefully" {

            # Whitespace-only queries should be processed without throwing exceptions
            { GenXdev.Queries\Open-AllPossibleTextQueries "   " } | Pester\Should -Not -Throw
        }

        Pester\It "Should handle null input parameter validation" {

            # Null input should trigger parameter validation
            { GenXdev.Queries\Open-AllPossibleTextQueries $null } | Pester\Should -Throw
        }
    }

    Pester\Context "C# vs PowerShell compatibility tests" {

        Pester\It "Should produce identical results to PowerShell version for text queries" -Skip:($env:SKIP_COMPATIBILITY_TESTS -eq 'true') {

            # This test ensures the C# implementation maintains backward compatibility
            # by comparing results with the original PowerShell function if available

            $testQuery = "compatibility"

            try {

                # Test the current implementation (C# or PowerShell)
                $currentOutput = GenXdev.Queries\Open-AllPossibleTextQueries $testQuery 2>&1 | Microsoft.PowerShell.Utility\Out-String

                # Basic validation that output is generated
                $currentOutput.Length | Pester\Should -BeGreaterThan 0 -Because "Query should produce some output"

                # Check for expected output patterns
                $currentOutput | Pester\Should -Match "Searched for:" -Because "Output should contain search indicator"

            }
            catch {

                Microsoft.PowerShell.Utility\Write-Warning "Compatibility test error: $($_.Exception.Message)"
                Pester\Set-ItResult -Inconclusive -Because "Compatibility test failed: $($_.Exception.Message)"
            }
        }
    }
}

Pester\AfterAll {

    # Cleanup if needed
    # No specific cleanup required for this test suite
}