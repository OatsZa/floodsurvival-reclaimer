param(
    # The short-name copy from shrink.ps1.
    [Parameter(Mandatory = $true)][string]$Source,
    # Where the packed copy goes.
    [Parameter(Mandatory = $true)][string]$Out
)
# The mode stores the script's source as a JSON string, where every line
# break costs two characters (\n), and every space counts too. This writes a
# copy with only the spaces the script needs: between two words or numbers,
# between two operators (so "= -1" can't become "=-1"), next to a text, and
# one where a line break was. Texts keep every space inside them.
# Proof: the copy must split into exactly the same tokens, in the same order,
# as the source, or nothing is written. build.ps1 also checks that
# megalo-check reads it the same.
$ErrorActionPreference = 'Stop'

$text = [IO.File]::ReadAllText($Source)
if ($text.Contains("`r")) { throw 'The script has Windows line endings.' }

# A text, a comment, a word or number, a run of operator characters, or one
# other character.
$tokenRx = [regex]'"[^"\n]*"|--[^\n]*|[A-Za-z_0-9]+|[=!<>+\-*/&|^~%]+|\S'
function Get-Kind($s) {
    if ($s.StartsWith('"')) { 'text' }
    elseif ($s.StartsWith('--')) { 'comment' }
    elseif ($s -match '^[A-Za-z_0-9]') { 'word' }
    elseif ($s -match '^[=!<>+\-*/&|^~%]') { 'op' }
    else { 'mark' }
}

$tokens = $tokenRx.Matches($text)
foreach ($t in $tokens) { if ((Get-Kind $t.Value) -eq 'comment') { throw 'pack.ps1 needs a script without comments (a comment would swallow the rest of the line).' } }

$sb = New-Object Text.StringBuilder
$prev = $null; $prevEnd = 0
foreach ($t in $tokens) {
    $kind = Get-Kind $t.Value
    if ($prev) {
        $gap = $text.Substring($prevEnd, $t.Index - $prevEnd)
        $space = ($prev -eq $kind -and ($kind -eq 'word' -or $kind -eq 'op')) -or $prev -eq 'text' -or $kind -eq 'text' -or $gap.Contains("`n")
        if ($space) { [void]$sb.Append(' ') }
    }
    [void]$sb.Append($t.Value)
    $prev = $kind; $prevEnd = $t.Index + $t.Length
}
$packed = $sb.ToString()

# Proof: the same tokens, in the same order.
$a = @($tokenRx.Matches($text) | ForEach-Object Value)
$b = @($tokenRx.Matches($packed) | ForEach-Object Value)
if ($a.Count -ne $b.Count) { throw "Pack check failed: $($a.Count) tokens became $($b.Count)." }
for ($i = 0; $i -lt $a.Count; $i++) {
    if ($a[$i] -cne $b[$i]) { throw "Pack check failed at token ${i}: '$($a[$i])' came back as '$($b[$i])'" }
}

[IO.File]::WriteAllText($Out, $packed, (New-Object Text.UTF8Encoding $false))
"Packed: {0:N1} KiB -> {1:N1} KiB of source" -f ($text.Length / 1024), ($packed.Length / 1024)
