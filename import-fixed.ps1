$wikiUrl = "http://192.168.40.84:8134"  # <--- CHANGE THIS to your Wiki URL
$token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGkiOjEsImdycCI6MSwiaWF0IjoxNzc1MzY4NjQ5LCJleHAiOjE4NzAwNDE0NDksImF1ZCI6InVybjp3aWtpLmpzIiwiaXNzIjoidXJuOndpa2kuanMifQ.m5dqnmrND3rlpTGg5ku7RPUwYr2RA7n1z4JN3531Hn2GFvgDokMDRK6udzciORGWZriMZKVDcDJBQNRKL1jyzWm1JN47JCsxWsJ_a8N0tziAGQQv4SSels-zOVj3TbWBBi1lw17VreFjkDy1kqOPUwHX3IPYMZmUefMgckF2XGJ4pJqDyGerPQOLrEcchLMMqhF4_IcaZ5kg89DH0f638On4-h9sGU6O9nlCV7t_uCZ4z7udpbilEOTlcf-Xfz_n34R9vFaGXan3GhxmdI9_pce34_bHOPei4nmlCHk5kjsRg0owKyevQ67_Z2Gc19L7mbwwN0ZHEW_LRJd7zKv_rw"      # <--- CHANGE THIS to your API Token
$basePath = "C:\Users\alucard\Desktop\QwenCode\CannaGrow"

Write-Host "Skipping connection test - starting import directly..." -ForegroundColor Cyan

# 1. FIND FILES
$files = Get-ChildItem -Path $basePath -Recurse -Filter *.md | Where-Object {
    $_.FullName -notmatch "README|IMPORT-GUIDE|SITE-MAP|CONFIGURATION|PORTAINER|import.ps1|import-fixed.ps1"
}

$success = 0
$fail = 0

Write-Host "--------------------------------------------------"
Write-Host "Starting import of $($files.Count) files..." -ForegroundColor Cyan

# 2. LOOP AND IMPORT
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Build path
    $relativePath = $file.FullName.Replace($basePath, "").TrimStart('\').Replace('\', '/')
    $dir = [System.IO.Path]::GetDirectoryName($relativePath).Replace('\', '/')
    $name = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $pagePath = if ($dir) { "/$dir/$name" } else { "/$name" }
    $pagePath = $pagePath -replace '//', '/'

    # Extract title
    $title = $name
    if ($content -match "title:\s*""([^""]+)""") { $title = $Matches[1] }

    # 3. ESCAPE CONTENT FOR JSON
    $escapedContent = $content -replace '\\', '\\\\' -replace '"', '\"' -replace "`n", '\n' -replace "`r", '\r' -replace "`t", '\t'

    # 4. BUILD QUERY
    $query = "mutation { pages.create(page: { path: `"$pagePath`", title: `"$title`", content: `"$escapedContent`", contentType: `"markdown`", isPublished: true, editor: `"markdown`" }) { id } }"
    
    $body = @{ query = $query } | ConvertTo-Json -Compress

    # 5. HEADERS
    $headers = @{ "Authorization" = "Bearer $token"; "Content-Type" = "application/json" }

    # 6. SEND REQUEST
    try {
        $response = Invoke-RestMethod -Uri "$wikiUrl/graphql" -Method Post -Headers $headers -Body ([System.Text.Encoding]::UTF8.GetBytes($body))
        
        if ($response.data -and $response.data.pages.create.id) {
            $success++
            # Show progress every 10 files
            if ($success % 10 -eq 0) { Write-Host "  ... $success created" -ForegroundColor DarkGray }
        } else {
            $fail++
            $err = $response.errors[0].message
            # Only print error if it's not "already exists"
            if ($err -notmatch "already exists|unique|duplicate") {
                Write-Host "  [FAIL] $pagePath : $err" -ForegroundColor Red
            }
        }
    } catch {
        $fail++
        Write-Host "  [ERR] $pagePath : $_" -ForegroundColor Red
        # If the first few fail with connection errors, warn the user
        if ($success -eq 0 -and $fail -gt 3) {
            Write-Host "  ** Connection failed. Check URL and Token. Aborting." -ForegroundColor Red
            break
        }
    }
}

Write-Host "--------------------------------------------------"
Write-Host "Import Finished!" -ForegroundColor Cyan
Write-Host "Created: $success" -ForegroundColor Green
Write-Host "Failed/Skipped: $fail" -ForegroundColor DarkGray
