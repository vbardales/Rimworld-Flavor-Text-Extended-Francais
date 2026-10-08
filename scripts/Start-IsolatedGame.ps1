param(
    [ValidateSet('French','English')][string]$Language = 'French',
    [string]$GameDirectory = 'C:/Program Files (x86)/Steam/steamapps/common/RimWorld',
    [switch]$Headless
)
$ErrorActionPreference = 'Stop'
if (Get-Process RimWorldWin64 -ErrorAction SilentlyContinue) {
    throw 'Close the existing RimWorld process before starting an isolated test.'
}
$root = Split-Path $PSScriptRoot
$run = Join-Path $root ('.build/game-tests/' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '-' + $Language)
New-Item -ItemType Directory -Path (Join-Path $run 'Config') -Force | Out-Null
@'
<ModsConfigData>
  <version>1.6.4871 rev591</version>
  <activeMods>
    <li>brrainz.harmony</li><li>ludeon.rimworld</li><li>hekmo.flavortext</li>
    <li>nelim.flavortextextended</li><li>nelim.flavortextextended.fr</li>
  </activeMods>
  <knownExpansions>
    <li>ludeon.rimworld</li><li>ludeon.rimworld.royalty</li><li>ludeon.rimworld.ideology</li>
    <li>ludeon.rimworld.biotech</li><li>ludeon.rimworld.anomaly</li><li>ludeon.rimworld.odyssey</li>
  </knownExpansions>
</ModsConfigData>
'@ | Set-Content (Join-Path $run 'Config/ModsConfig.xml') -Encoding utf8
"<PrefsData><langFolderName>$Language</langFolderName><devMode>True</devMode></PrefsData>" |
    Set-Content (Join-Path $run 'Config/Prefs.xml') -Encoding utf8
$arguments = @('-savedatafolder="' + $run + '"', '-logFile', '"' + (Join-Path $run 'Player.log') + '"')
if ($Headless) { $arguments += @('-batchmode', '-nographics') }
$oldAppId = $env:SteamAppId
try {
    $env:SteamAppId = '294100'
    $options = @{ FilePath = (Join-Path $GameDirectory 'RimWorldWin64.exe');
        WorkingDirectory = $GameDirectory; ArgumentList = $arguments; PassThru = $true }
    if ($Headless) { $options.WindowStyle = 'Hidden' }
    $process = Start-Process @options
    [pscustomobject]@{ProcessId=$process.Id; Language=$Language; Directory=$run;
        Headless=[bool]$Headless; Started=(Get-Date -Format o)} |
        ConvertTo-Json | Set-Content (Join-Path $run 'run.json')
    Write-Output "Started PID $($process.Id); isolated data and log: $run"
    Write-Output 'Launch is not a test pass. Check the actual active dependencies, language and errors in the log.'
} finally { $env:SteamAppId = $oldAppId }
