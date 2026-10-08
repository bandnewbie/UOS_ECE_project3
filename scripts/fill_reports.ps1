$lab = 3
$root = "C:\UOS_ECE_project$lab"; $repo = "https://github.com/bandnewbie/UOS_ECE_project$lab"
Set-Location $root
$hash = (git rev-parse HEAD).Trim()
$commitUrl = "[$($hash.Substring(0,7))]($repo/commit/$hash)"
$today = Get-Date -Format "yyyy-MM-dd"
$utf8 = New-Object System.Text.UTF8Encoding($false)
$img = @('.png','.jpg','.jpeg','.gif','.webp')
function Get-Links($dir, $rel, $empty) {
  if (-not (Test-Path $dir)) { return $empty }
  $files = Get-ChildItem $dir -File | Where-Object { $_.Name -notlike '.git*' } | Sort-Object Name
  if (-not $files) { return $empty }
  $lines = foreach ($f in $files) { $p = "$rel/$($f.Name)"
    if ($img -contains $f.Extension.ToLower()) { "![$($f.BaseName)](<$p>)`n" } else { "- [$($f.Name)](<$p>)" } }
  return ($lines -join "`n")
}
Get-ChildItem "$root\reports\post\[12]*.md" | ForEach-Object {
  $n = $_.Name.Substring(0,2); $ev = "$root\evidence\$n"; $rel = "../../evidence/$n"
  $t = [IO.File]::ReadAllText($_.FullName, $utf8)
  $t = $t.Replace("{{VIVADO_$n}}", (Get-Links "$ev\vivado" "$rel/vivado" "(파일 없음)"))
  $t = $t.Replace("{{VSCODE_$n}}", (Get-Links "$ev\vscode" "$rel/vscode" "(파일 없음)"))
  $t = $t.Replace("{{VIDEOS_$n}}", (Get-Links "$ev\board\videos" "$rel/board/videos" "(파일 없음)"))
  $t = $t.Replace("{{PHOTOS_$n}}", (Get-Links "$ev\board\photos" "$rel/board/photos" "시연 대상이 아니어서 사진 없음 (영상으로 기록)"))
  $bit = Get-ChildItem "$root\lab*_${n}_*\vivado" -Recurse -Filter *.bit -ErrorAction SilentlyContinue | Where-Object { $_.FullName -like "*impl_1*" } | Select-Object -First 1
  if ($bit) { $bpath = $bit.FullName.Substring($root.Length + 1).Replace('\','/'); $size = "{0:N0}" -f $bit.Length; $sha = (Get-FileHash $bit.FullName -Algorithm SHA256).Hash.ToLower() }
  else { $bpath = "조원 PC에서 생성 (저장소 미포함)"; $size = "-"; $sha = "조원 PC 보관" }
  $t = $t.Replace("{{COMMIT_URL}}", $commitUrl).Replace("{{DATE}}", $today)
  $t = $t.Replace("{{BIT_PATH_$n}}", $bpath).Replace("{{BIT_SIZE_$n}}", $size).Replace("{{BIT_SHA_$n}}", $sha)
  [IO.File]::WriteAllText($_.FullName, $t, $utf8)
  "{0}  완료 (남은 빈칸 {1}개)" -f $_.Name, ([regex]::Matches($t, '\{\{[A-Z_0-9]+\}\}')).Count
}
"commit: $hash"
