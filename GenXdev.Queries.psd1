#
# Module manifest for module 'GenXdev.Queries'
@{

    # Script module or binary module file associated with this manifest.
    RootModule           = 'GenXdev.Queries.psm1'

    # Version number of this module.
    ModuleVersion        = '1.94.2025'
    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID                 = '2f62080f-0483-4421-8497-b3d433b65174'

    # Author of this module
    Author               = 'René Vaessen'

    # Company or vendor of this module
    CompanyName          = 'GenXdev'

    # Copyright statement for this module
    Copyright            = 'Copyright 2021-2025 GenXdev'

    # Description of the functionality provided by this module
    Description          = 'A Windows PowerShell module for finding resources and information on the internet'

    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion    = '7.5.0'

    # # Intended for PowerShell Core
    CompatiblePSEditions = 'Core'

    # # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    ClrVersion           = '9.0.1'

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules      = @(@{ModuleName = 'GenXdev.Data'; ModuleVersion = '1.94.2025' }, @{ModuleName = 'GenXdev.Helpers'; ModuleVersion = '1.94.2025' }, @{ModuleName = 'GenXdev.Webbrowser'; ModuleVersion = '1.94.2025' }, @{ModuleName = 'GenXdev.FileSystem'; ModuleVersion = '1.94.2025' })

    # Assemblies that must be loaded prior to importing this module
    RequiredAssemblies   = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    NestedModules        = @("GenXdev.Queries.AI.psm1", "GenXdev.Queries.Webbrowser.psm1", "GenXdev.Queries.Text.psm1", "GenXdev.Queries.Websites.psm1")

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport    = '*' # @("*")

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no Cmdlets to export.
    CmdletsToExport      = '*' # = @("*")

    # Variables to export from this module
    VariablesToExport    = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport      = '*'

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    ModuleList           = @("GenXdev.Queries")

    # List of all files packaged with this module
    FileList             = @(


  ".\\Functions\\GenXdev.Queries\\ConvertTo-Uris.ps1",
  ".\\Functions\\GenXdev.Queries\\Invoke-WebbrowserTabPollingScript.ps1",
  ".\\Functions\\GenXdev.Queries\\Open-AllPossibleQueries.ps1",
  ".\\Functions\\GenXdev.Queries\\Open-AllPossibleTextQueries.ps1",
  ".\\Functions\\GenXdev.Queries.AI\\Open-BingCopilotQuery.ps1",
  ".\\Functions\\GenXdev.Queries.AI\\Open-ChatGPTQuery.ps1",
  ".\\Functions\\GenXdev.Queries.AI\\Open-GithubCopilotQuery.ps1",
  ".\\Functions\\GenXdev.Queries.AI\\Open-GoogleGeminiQuery.ps1",
  ".\\Functions\\GenXdev.Queries.AI\\Open-XGrokQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Text\\Get-NextAffirmations.ps1",
  ".\\Functions\\GenXdev.Queries.Text\\Get-WikipediaSummary.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Clear-YoutubeWatched.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Copy-PDFsFromGoogleQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Get-GoogleSearchResultUrls.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Get-WebLanguageDictionary.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-AllGoogleLinks.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-AllYoutubeVideos.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-BingQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-BuiltWithSiteInfo.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-GithubQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-GoogleQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-GoogleSiteInfo.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-IMDBQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-InstantStreetViewQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-MovieQuote.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-SimularWebSiteInfo.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-StackOverflowQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-WaybackMachineSiteInfo.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-WebsiteAndPerformQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-WhoisHostSiteInfo.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-WikipediaNLQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-WikipediaQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-WolframAlphaQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Webbrowser\\Open-YoutubeQuery.ps1",
  ".\\Functions\\GenXdev.Queries.Websites\\Open-GameOfLife.ps1",
  ".\\Functions\\GenXdev.Queries.Websites\\Open-GenXdevAppCatalog.ps1",
  ".\\Functions\\GenXdev.Queries.Websites\\Open-Timeline.ps1",
  ".\\Functions\\GenXdev.Queries.Websites\\Open-ViralSimulation.ps1",
  ".\\Functions\\GenXdev.Queries.Websites\\Open-Yab.ps1",
  ".\\Functions\\GenXdev.Queries.Websites\\Open-YabAIBattle.ps1",
  ".\\GenXdev.Queries.AI.psm1",
  ".\\GenXdev.Queries.psd1",
  ".\\GenXdev.Queries.psm1",
  ".\\GenXdev.Queries.Text.psm1",
  ".\\GenXdev.Queries.Webbrowser.psm1",
  ".\\GenXdev.Queries.Websites.psm1",
  ".\\Get-GoogleSearchResultUrls.js",
  ".\\LICENSE",
  ".\\license.txt",
  ".\\Open-AllGoogleLinks.js",
  ".\\Open-AllYoutubeVideos.js",
  ".\\powershell.jpg",
  ".\\README.md"


)

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData          = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags                     = 'Google', 'Searchengine', 'GenXdev'

            # A URL to the license for this module.
            LicenseUri               = 'https://raw.githubusercontent.com/genXdev/GenXdev.Queries/main/LICENSE'

            # A URL to the main website for this project.
            ProjectUri               = 'https://github.com/genXdev/GenXdev.Queries'

            # A URL to an icon representing this module.
            IconUri                  = 'https://genxdev.net/favicon.ico'

            # ReleaseNotes of this module
            # ReleaseNotes = ''

            # Prerelease string of this module
            # Prerelease = ''

            # Flag to indicate whether the module requires explicit user acceptance for install/update/save
            RequireLicenseAcceptance = $true

            # External dependent modules of this module
            # ExternalModuleDependencies = @()

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoUri          = 'https://github.com/genXdev/GenXdev.Queries/blob/main/README.md#cmdlet-index'

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''
}

# PrivateData = @{
#     PSData = @{

#       # ...

#       # !! This field is *ancillary* to the more detailed 'RequiredModules' field and
#       # !! must reference the *same modules*, but by *names only*,
#       # !! in order to automatically install other modules
#       # !! *from the same repository* that this module depends on.
#       # !! To be safe, specify even a *single* name as an *array*
#       # !! (While this is not a general requirement in manifests,
#       # !!  it may be necessary here due to a bug.)
#       ExternalModuleDependencies = @('GenXdev.Helpers')
#   }
# }
