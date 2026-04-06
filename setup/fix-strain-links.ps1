$files = Get-ChildItem -Path 'C:\Users\alucard\Desktop\QwenCode\CannaGrow' -Recurse -Filter '*.md'
$count = 0
foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    $new = $content
    $new = $new -replace '\]\(/strains/indica/zkittlez\)', '](/strains/hybrid/zkittlez)'
    $new = $new -replace '\]\(/strains/hybrid/tahoe-og\)', '](/strains/indica/tahoe-og)'
    $new = $new -replace '\]\(/strains/hybrid/tahoe-og-sour-diesel\)', '](/strains/hybrid/tahoe-og-x-sour-diesel)'
    $new = $new -replace '\]\(/strains/hybrid/sunset-sherbet\)', '](/strains/indica/sunset-sherbet)'
    $new = $new -replace '\]\(/strains/hybrid/northern-lights-5\)', '](/strains/hybrid/northen-lights-5)'
    $new = $new -replace '\]\(/strains/indica/snowlander\)', '](/strains/indica/snow-lander)'
    $new = $new -replace '\]\(/strains/hybrid/mimosa\)', '](/strains/hybrid/mimosa-eva)'
    $new = $new -replace '\]\(/strains/hybrid/mints\)', '](/strains/hybrid/kush-mints)'
    $new = $new -replace '\]\(/strains/indica/gods-gift\)', '](/strains/indica/god-s-gift)'
    $new = $new -replace '\]\(/strains/indica/mendo-purp\)', '](/strains/indica/mendo-purge)'
    $new = $new -replace '\]\(/strains/indica/sherbert\)', '](/strains/indica/sherbet)'
    $new = $new -replace '\]\(/strains/sativa/bubba-kush-haze\)', '](/strains/sativa/bubba-kush-x-haze)'
    $new = $new -replace '\]\(/strains/sativa/northern-lights-5-haze\)', '](/strains/sativa/northern-lights-haze)'
    $new = $new -replace '\]\(/strains/indica/garlic-cookies\)', '](/strains/indica/garlic-cookie)'
    $new = $new -replace '\]\(/strains/indica/blue-dream-og\)', '](/strains/indica/blue-dream-x-og)'
    $new = $new -replace '\]\(/strains/indica/critical-mass\)', '](/strains/hybrid/cbd-critical-mass)'
    $new = $new -replace '\]\(/strains/hybrid/skunk-1\)', '](/strains/sativa/skunk-1)'
    $new = $new -replace '\]\(/strains/hybrid/runtz\)', '](/strains/indica/runtz)'
    $new = $new -replace '\]\(/strains/indica/cherry-pie\)', '](/strains/hybrid/cherry-pie)'
    if ($new -ne $content) {
        Set-Content $f.FullName -Value $new -NoNewline
        $count++
        Write-Host ('Updated: ' + $f.FullName)
    }
}
Write-Host ('Done. Updated ' + $count + ' files.') -ForegroundColor Green
