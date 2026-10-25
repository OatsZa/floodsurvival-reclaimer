param(
    # The readable script (scripts\zombie-survival.rvt).
    [Parameter(Mandatory = $true)][string]$Source,
    # Where the short-name copy goes.
    [Parameter(Mandatory = $true)][string]$Out,
    # Optional: a Markdown table of which short name is which (docs\name-key.md).
    [string]$Key,
    # The build's version, for the key's heading.
    [string]$Version
)
# The mode stores the script's source text, and that text counts toward the
# 64 KiB. This writes a copy with every alias, function, enum and enum member
# renamed to 1-2 letters, plus short aliases for the longest built-ins
# (current_player...), declared on line 1 in place of the comment. Strings and
# comments are left alone and every line keeps its number, so errors still
# point at the right line of the readable script.
# Proof: the copy is turned back into long names and must match the source
# exactly, or nothing is written.
$ErrorActionPreference = 'Stop'

# Built-ins worth an alias: long and used often.
$builtins = 'current_player', 'current_object', 'script_widget', 'all_players', 'no_object', 'script_option', 'script_traits'
# Words a new name must never be, on top of every name the script already uses.
$keywords = 'if then end for each do alt altif not and or on function alias declare enum with label randomly in is as to of at by it no go up so me we be my ok'.Split(' ')

$text = [IO.File]::ReadAllText($Source)
if ($text.Contains("`r")) { throw 'The script has Windows line endings: build.ps1 fixes that first.' }
$lines = $text.Split("`n")
if (-not $lines[0].StartsWith('--')) { throw 'Line 1 must be a comment: the built-in aliases go there.' }

# One token rule for everything: a string, a comment, or a name with an
# optional .member after it.
$tokenRx = [regex]'"[^"\n]*"|--.*|([A-Za-z_][A-Za-z0-9_]*)(?:\.([A-Za-z_][A-Za-z0-9_]*))?'

# The names to rename.
$names = [System.Collections.Specialized.OrderedDictionary]::new([StringComparer]::Ordinal)
$enums = [hashtable]::new([StringComparer]::Ordinal)
$enum = $null
foreach ($line in $lines) {
    if ($enum) {
        if ($line -eq 'end') { $enum = $null; continue }
        if ($line -match '^([A-Za-z_]\w*)( = .*)?$') { $enums[$enum] += , $Matches[1] }
        continue
    }
    if ($line -match '^enum ([A-Za-z_]\w*)$') { $enum = $Matches[1]; $enums[$enum] = @(); $names[$enum] = 0 }
    elseif ($line -match '^alias ([A-Za-z_]\w*) = ') { $names[$Matches[1]] = 0 }
    elseif ($line -match '^function ([A-Za-z_]\w*)\(') { $names[$Matches[1]] = 0 }
}
foreach ($b in $builtins) { $names[$b] = 0 }

# Count uses, and collect every other word so no new name can clash with it.
$members = [hashtable]::new([StringComparer]::Ordinal)
foreach ($e in $enums.Keys) { foreach ($m in $enums[$e]) { $members["$e.$m"] = 1 } }
$taken = New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::OrdinalIgnoreCase)
foreach ($k in $keywords) { [void]$taken.Add($k) }
foreach ($line in $lines) {
    foreach ($m in $tokenRx.Matches($line)) {
        if (-not $m.Groups[1].Success) { continue }
        $a = $m.Groups[1].Value; $b = $m.Groups[2].Value
        if ($m.Groups[2].Success -and $enums.ContainsKey($a)) {
            $names[$a]++
            if ($members.ContainsKey("$a.$b")) { $members["$a.$b"]++ } else { throw "Unknown enum member $a.$b" }
            continue
        }
        foreach ($w in @($a) + @(if ($m.Groups[2].Success) { $b })) {
            if ($names.Contains($w)) { $names[$w]++ } else { [void]$taken.Add($w) }
        }
    }
}

# Hand out the shortest free names, most used first. Every name is unique,
# members included, and none matches another word, whatever the case.
$pool = [System.Collections.Generic.List[string]]::new()
$letters = 'abcdefghijklmnopqrstuvwxyz'.ToCharArray()
foreach ($c in $letters) { $pool.Add([string]$c) }
foreach ($c in $letters) { foreach ($d in $letters + '0123456789'.ToCharArray()) { $pool.Add("$c$d") } }
$next = 0
function NewName {
    while ($taken.Contains($script:pool[$script:next])) { $script:next++ }
    $n = $script:pool[$script:next]; $script:next++; [void]$taken.Add($n); return $n
}
$all = @()
foreach ($k in $names.Keys) { $all += [pscustomobject]@{ Key = $k; Uses = $names[$k]; Member = $false } }
foreach ($k in $members.Keys) { $all += [pscustomobject]@{ Key = $k; Uses = $members[$k]; Member = $true } }
$map = [hashtable]::new([StringComparer]::Ordinal); $memberMap = [hashtable]::new([StringComparer]::Ordinal)
foreach ($x in ($all | Sort-Object -Property @{ Expression = { $_.Uses * $_.Key.Length }; Descending = $true }, Key)) {
    if ($x.Member) { $memberMap[$x.Key] = NewName } else { $map[$x.Key] = NewName }
}

function Convert-Lines($inLines, $nameMap, $membersOf, $enumMap) {
    # $membersOf: "Enum.member" (input spelling) -> output member name.
    $out = New-Object string[] $inLines.Length
    $enumIn = $null
    for ($i = 0; $i -lt $inLines.Length; $i++) {
        $line = $inLines[$i]
        if ($enumIn) {
            if ($line -eq 'end') { $enumIn = $null; $out[$i] = $line; continue }
            if ($line -match '^([A-Za-z_]\w*)( = .*)?$') { $out[$i] = $membersOf["$enumIn.$($Matches[1])"] + $Matches[2]; continue }
        }
        if ($line -match '^enum ([A-Za-z_]\w*)$') { $enumIn = $Matches[1] }
        $out[$i] = $tokenRx.Replace($line, {
            param($m)
            if (-not $m.Groups[1].Success) { return $m.Value }
            $a = $m.Groups[1].Value
            if ($m.Groups[2].Success -and $enumMap.ContainsKey($a)) {
                return $nameMap[$a] + '.' + $membersOf["$a.$($m.Groups[2].Value)"]
            }
            $r = if ($nameMap.ContainsKey($a)) { $nameMap[$a] } else { $a }
            if ($m.Groups[2].Success) {
                $b = $m.Groups[2].Value
                $r += '.' + $(if ($nameMap.ContainsKey($b)) { $nameMap[$b] } else { $b })
            }
            return $r
        })
    }
    return $out
}

# Short copy. Line 1 becomes the built-in aliases.
$short = Convert-Lines $lines $map $memberMap $enums
$short[0] = ($builtins | ForEach-Object { "alias $($map[$_]) = $_" }) -join ' '

# Proof: back to long names, line 1 restored, must equal the source.
$back = [hashtable]::new([StringComparer]::Ordinal); foreach ($k in $map.Keys) { $back[$map[$k]] = $k }
$backEnums = [hashtable]::new([StringComparer]::Ordinal); foreach ($e in $enums.Keys) { $backEnums[$map[$e]] = 1 }
$backMembers = [hashtable]::new([StringComparer]::Ordinal)
foreach ($k in $memberMap.Keys) { $e, $m = $k.Split('.'); $backMembers["$($map[$e]).$($memberMap[$k])"] = $m }
$check = $short.Clone()
$check[0] = 'alias'
$restored = Convert-Lines $check $back $backMembers $backEnums
$restored[0] = $lines[0]
if (($restored -join "`n") -cne $text) {
    for ($i = 0; $i -lt $lines.Length; $i++) {
        if ($restored[$i] -cne $lines[$i]) { throw "Shrink check failed at line $($i + 1): '$($lines[$i])' came back as '$($restored[$i])'" }
    }
    throw 'Shrink check failed.'
}

[IO.File]::WriteAllText($Out, ($short -join "`n"), (New-Object Text.UTF8Encoding $false))

if ($Key) {
    $slots = @{}; $kinds = [hashtable]::new([StringComparer]::Ordinal)
    foreach ($line in $lines) {
        if ($line -cmatch '^alias ([A-Za-z_]\w*) = (.+)$') { $kinds[$Matches[1]] = 'alias'; $slots[$Matches[1]] = $Matches[2] }
        elseif ($line -cmatch '^function ([A-Za-z_]\w*)\(') { $kinds[$Matches[1]] = 'function' }
    }
    $md = @(
        "# Name key$(if ($Version) { " (v$Version)" })",
        '',
        'The mode file''s script uses short names to save space: the mode stores the script''s source text, and that counts toward its 64 KiB. `tools/build.ps1` makes the short copy with `tools/shrink.ps1` from the readable `scripts/zombie-survival.rvt`, which is the file to read and edit. What each part of it does is in [how-the-script-works.md](how-the-script-works.md).',
        '',
        'Every build rewrites this table. The most-used names get the shortest letters, so a short name can mean something else in another version: use the key of the same version as the mode file.',
        '',
        '## Built-ins (aliased on line 1)',
        '',
        '| Short | Built-in |',
        '| --- | --- |'
    )
    $md += $builtins | ForEach-Object { "| ``$($map[$_])`` | ``$_`` |" }
    $md += '', '## Variables', '', '| Short | Name | Slot |', '| --- | --- | --- |'
    $md += $kinds.Keys | Where-Object { $kinds[$_] -eq 'alias' } | Sort-Object { $slots[$_] -replace '\[(\d)\]', '[0$1]' }, { $_ } | ForEach-Object { "| ``$($map[$_])`` | ``$_`` | ``$($slots[$_])`` |" }
    $md += '', '## Functions', '', '| Short | Name |', '| --- | --- |'
    $md += $kinds.Keys | Where-Object { $kinds[$_] -eq 'function' } | Sort-Object | ForEach-Object { "| ``$($map[$_])()`` | ``$_()`` |" }
    $md += '', '## Enums', '', "Used as ``Enum.member``: for example ``Item.shotgun`` is ``$($map['Item']).$($memberMap['Item.shotgun'])`` in the short copy.",'', '| Short | Enum | Members (short = name) |', '| --- | --- | --- |'
    foreach ($e in ($enums.Keys | Sort-Object)) {
        $list = ($enums[$e] | ForEach-Object { "``$($memberMap["$e.$_"])`` = $_" }) -join ', '
        $md += "| ``$($map[$e])`` | ``$e`` | $list |"
    }
    [IO.File]::WriteAllText($Key, (($md -join "`n") + "`n"), (New-Object Text.UTF8Encoding $false))
}
"Short names: {0:N1} KiB -> {1:N1} KiB of source ({2} names)" -f ($text.Length / 1024), ((($short -join "`n").Length) / 1024), ($map.Count + $memberMap.Count)
