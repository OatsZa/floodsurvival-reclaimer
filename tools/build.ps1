param(
    # The version number in the mode's name and file, e.g. 0.21.
    [Parameter(Mandatory = $true)][string]$Version,
    # The Project Reclaimer client. It must match the version everyone plays.
    [string]$Exe = "$env:USERPROFILE\OneDrive\Desktop\Halo\project-reclaimer-client-v0.9.18.exe",
    # Also copy the build into the game's Game Modes folder (test subfolder).
    [switch]$Install
)
# Builds modes\zombie-survival-v<Version>.json from scripts\: megalo-check,
# mode-compile, mode-check, then a size report. Older builds in modes\ are
# removed, so the repo keeps one version.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$rvt = Join-Path $root 'scripts\zombie-survival.rvt'
$template = Join-Path $root 'scripts\zombie-survival-template.json'
$out = Join-Path $root "modes\zombie-survival-v$Version.json"

"Client: $(& $Exe --version)"
if (Test-Path $out) { throw "$out already exists: pick a new version number." }

& $Exe megalo-check $rvt
if ($LASTEXITCODE -ne 0) { throw 'megalo-check failed.' }
& $Exe mode-compile $rvt --template $template --output $out --name "Zombie Survival v$Version"
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
