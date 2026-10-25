param(
    # The version number in the mode's name and file, e.g. 0.21.
    [Parameter(Mandatory = $true)][string]$Version,
    # The Project Reclaimer client. It must match the version everyone plays.
    [string]$Exe = "$env:USERPROFILE\OneDrive\Desktop\Halo\project-reclaimer-client-v0.9.18.exe",
    # Also copy the build into the game's Game Modes folder (test subfolder).
    [switch]$Install
)
# Builds modes\zombie-survival-v<Version>.json from scripts\: megalo-check,
# a short-name copy (shrink.ps1), mode-compile, mode-check, then a size report. Older builds in modes\ are
# removed, so the repo keeps one version.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$rvt = Join-Path $root 'scripts\zombie-survival.rvt'
$template = Join-Path $root 'scripts\zombie-survival-template.json'
$out = Join-Path $root "modes\zombie-survival-v$Version.json"

"Client: $(& $Exe --version)"
if (Test-Path $out) { throw "$out already exists: pick a new version number." }

# The source is stored inside the mode and counts toward the 64 KiB, and a
# Windows line ending costs 2 more characters per line there: keep it LF.
$source = [IO.File]::ReadAllText($rvt)
if ($source.Contains("`r")) {
    [IO.File]::WriteAllText($rvt, $source.Replace("`r", ''), (New-Object Text.UTF8Encoding $false))
    'Line endings in the script changed to LF (saves space in the mode).'
}

$check = & $Exe megalo-check $rvt 2>&1 | Out-String
if ($LASTEXITCODE -ne 0) { $check; throw 'megalo-check failed.' }
($check -split "`n")[0]

# The mode gets a short-name copy (tools\shrink.ps1), which proves it turns
# back into this script exactly. It must also pass megalo-check with the same
# output, so the game sees the same script with shorter names.
$short = Join-Path $env:TEMP 'zombie-survival-short.rvt'
& (Join-Path $PSScriptRoot 'shrink.ps1') -Source $rvt -Out $short -Key (Join-Path $root 'docs\name-key.md') -Version $Version
$shortCheck = & $Exe megalo-check $short 2>&1 | Out-String
if ($LASTEXITCODE -ne 0 -or $shortCheck -cne $check) { throw "The short-name copy checks differently:`n$shortCheck" }
& $Exe mode-compile $short --template $template --output $out --name "Zombie Survival v$Version"
if ($LASTEXITCODE -ne 0 -or -not (Test-Path $out)) { throw 'mode-compile failed.' }
& $Exe mode-check $out
if ($LASTEXITCODE -ne 0) { throw 'mode-check failed.' }

# Size: the script part of a mode must stay under 64 KiB.
$mode = Get-Content $out -Raw | ConvertFrom-Json
$kib = ($mode.script | ConvertTo-Json -Depth 20 -Compress).Length / 1024
"Size: {0:N1} KiB of 64" -f $kib

# One version in the repo: drop older builds.
Get-ChildItem (Join-Path $root 'modes') -Filter 'zombie-survival-v*.json' |
    Where-Object { $_.FullName -ne $out } | Remove-Item

if ($Install) {
    $dest = "$env:USERPROFILE\Documents\My Games\Project Reclaimer\Game Modes\test"
    New-Item -ItemType Directory -Force $dest | Out-Null
    Get-ChildItem $dest -Filter 'zombie-survival-v*.json' | Remove-Item
    Copy-Item $out $dest
    "Installed: $dest\$(Split-Path $out -Leaf) (Host Game -> Game Type -> Refresh -> Slayer)"
}
