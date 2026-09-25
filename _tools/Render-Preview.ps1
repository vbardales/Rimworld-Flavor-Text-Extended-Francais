param(
    [string]$Chrome = 'C:/Program Files/Google/Chrome/Application/chrome.exe',
    [switch]$BackgroundOnly
)
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot
$palette = Get-Content (Join-Path $root 'Art/preview-palette.json') -Raw -Encoding UTF8 | ConvertFrom-Json
$css = ':root {'
foreach ($key in @('veil','inkPrimary','inkSecondary','accent','badgeInk')) {
    $color=$palette.$key
    if($color -notmatch '^#[0-9A-Fa-f]{6}$'){throw "Invalid palette value: $key"}
    $css += "--${key}:$color;"
}
$css += '}'
$template = Get-Content (Join-Path $root 'Art/preview-template.html') -Raw -Encoding UTF8
$html = $template.Replace('/* PALETTE */',$css)
$outputHtml = Join-Path $root 'Art/preview.html'
if($BackgroundOnly) {
    $html=$html.Replace('</style>','.copy,.version { visibility:hidden; }</style>')
    $outputHtml=Join-Path $root '.build/preview-background.html'
    $imageUri=([uri](Join-Path $root 'Art/Preview-source.png')).AbsoluteUri
    $html=$html.Replace('src="Preview-source.png"','src="'+$imageUri+'"')
}
[IO.File]::WriteAllText($outputHtml,$html,[Text.UTF8Encoding]::new($false))
if(-not(Test-Path $Chrome)){throw "Chrome not found: $Chrome"}
$output=Join-Path $root ('.build/preview-render-'+[guid]::NewGuid().ToString('N')+'.png')
$profile=Join-Path $root '.build/preview-profile'
$uri=([uri]$outputHtml).AbsoluteUri
$arguments='--headless --disable-gpu --hide-scrollbars --no-first-run --no-default-browser-check --allow-file-access-from-files --force-device-scale-factor=1 --window-size=896,504 --virtual-time-budget=2000 "--user-data-dir='+$profile+'" "--screenshot='+$output+'" "'+$uri+'"'
$process=Start-Process -FilePath $Chrome -ArgumentList $arguments -WindowStyle Hidden -Wait -PassThru -RedirectStandardError (Join-Path $root '.build/preview-render.stderr.txt')
if($process.ExitCode -ne 0 -or -not(Test-Path $output)){throw 'Preview render failed; inspect .build/preview-render.stderr.txt.'}
$destination=if($BackgroundOnly){Join-Path $root '.build/preview-background.png'}else{Join-Path $root 'Mod/About/Preview.png'}
Copy-Item -LiteralPath $output -Destination $destination
Write-Output "Rendered $output"
