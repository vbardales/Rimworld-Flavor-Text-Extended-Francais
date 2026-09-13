$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot
# Exercise the installed artifact's decision code without running a Unity player.
$null = [Reflection.Assembly]::LoadFrom((Join-Path $root 'Mod/Assemblies/FlavorTextExtendedFR.dll'))
$script:called = 0
$success = [Func[bool]] { $script:called++; return $true }
foreach ($language in @('English', 'German', '', $null, 'FrenchCustom', 'fr')) {
    if (-not [FlavorTextExtendedFR.FrenchLanguage]::Apply($language, $success)) { throw "Skip failed: $language" }
}
if ($script:called -ne 0) { throw 'Non-French language executed the patch.' }
foreach ($language in @('French', 'french', 'FRENCH')) {
    if (-not [FlavorTextExtendedFR.FrenchLanguage]::Apply($language, $success)) { throw "French failed: $language" }
}
if ($script:called -ne 3) { throw 'French payload was not invoked exactly once per call.' }
$failure = [Func[bool]] { return $false }
if ([FlavorTextExtendedFR.FrenchLanguage]::Apply('French', $failure)) { throw 'Payload failure was swallowed.' }
if (-not [FlavorTextExtendedFR.FrenchLanguage]::Apply('English', $failure)) { throw 'Skipped failure leaked.' }
$throws = [Func[bool]] { throw 'payload exception' }
$caught = $false
try { [FlavorTextExtendedFR.FrenchLanguage]::Apply('French', $throws) | Out-Null } catch { $caught = $true }
if (-not $caught) { throw 'Payload exception was swallowed.' }
Write-Output 'PASS: language isolation, case handling, single invocation, failure and exception propagation.'
