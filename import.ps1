$wikiUrl = "http://192.168.40.84:8134"  # <--- CHANGE THIS to your Wiki URL
$token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGkiOjEsImdycCI6MSwiaWF0IjoxNzc1MzY4NjQ5LCJleHAiOjE4NzAwNDE0NDksImF1ZCI6InVybjp3aWtpLmpzIiwiaXNzIjoidXJuOndpa2kuanMifQ.m5dqnmrND3rlpTGg5ku7RPUwYr2RA7n1z4JN3531Hn2GFvgDokMDRK6udzciORGWZriMZKVDcDJBQNRKL1jyzWm1JN47JCsxWsJ_a8N0tziAGQQv4SSels-zOVj3TbWBBi1lw17VreFjkDy1kqOPUwHX3IPYMZmUefMgckF2XGJ4pJqDyGerPQOLrEcchLMMqhF4_IcaZ5kg89DH0f638On4-h9sGU6O9nlCV7t_uCZ4z7udpbilEOTlcf-Xfz_n34R9vFaGXan3GhxmdI9_pce34_bHOPei4nmlCHk5kjsRg0owKyevQ67_Z2Gc19L7mbwwN0ZHEW_LRJd7zKv_rw"      # <--- CHANGE THIS to your API Token
$basePath = "C:\Users\alucard\Desktop\QwenCode\CannaGrow"

# 1. Find all markdown files, excluding documentation
$files = Get-ChildItem -Path $basePath -Recurse -Filter *.md | Where-Object {
    $_.FullName -notmatch "README|IMPORT-GUIDE|SITE-MAP|CONFIGURATION|PORTAINER|import.ps1"
}

$success = 0
$fail = 0
$skipped = 0

Write-Host "Starting import of $($files.Count) files..." -ForegroundColor Cyan
Write-Host "--------------------------------------------------"

# 2. Loop through every file and send to Wiki.js
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Build the path (e.g., /strains/indica/og-kush)
    $relativePath = $file.FullName.Replace($basePath, "").TrimStart('\').Replace('\', '/')
    $dir = [System.IO.Path]::GetDirectoryName($relativePath).Replace('\', '/')
    $name = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $pagePath = if ($dir) { "/$dir/$name" } else { "/$name" }
    $pagePath = $pagePath -replace '//', '/'

    # Extract title from YAML frontmatter if possible
    $title = $name
    if ($content -match "title:\s*""([^""]+)""") { $title = $Matches[1] }

    # 3. Create the JSON body safely
    $query = "mutation { pages.create(page: { path: `"$pagePath`", title: `"$title`", content: @content, contentType: `"markdown`", isPublished: true, editor: `"markdown`", description: `"`", tags: [], scriptCss: `` }) { id, path } }"
    
    # Wiki.js uses variables for content to avoid escaping issues
    $body = @{
        query = $query
        variables = @{ content = $content }
    } | ConvertTo-Json -Depth 4 -Compress

    # 4. Send the request
    $headers = @{ "Authorization" = "Bearer $token"; "Content-Type" = "application/json" }
    
    try {
        $response = Invoke-RestMethod -Uri "$wikiUrl/graphql" -Method Post -Headers $headers -Body ([System.Text.Encoding]::UTF8.GetBytes($body))
        
        if ($response.data -and $response.data.pages.create.id) {
            $success++
            Write-Host "[$success] Created: $pagePath" -ForegroundColor Green
        } else {
            # Check if page already exists (error message usually contains "duplicate" or "unique")
            $err = $response.errors[0].message
            if ($err -match "duplicate|unique|already exists") {
                $skipped++
                Write-Host "[SKIP] Exists: $pagePath" -ForegroundColor DarkGray
            } else {
                $fail++
                Write-Host "[FAIL] $pagePath : $err" -ForegroundColor Red
            }
        }
    } catch {
        $fail++
        Write-Host "[ERR] $pagePath : $_" -ForegroundColor Red
    }
}

Write-Host "--------------------------------------------------"
Write-Host "Import Finished!" -ForegroundColor Cyan
Write-Host "Created: $success" -ForegroundColor Green
Write-Host "Skipped: $skipped" -ForegroundColor DarkGray
Write-Host "Failed: $fail" -ForegroundColor Red