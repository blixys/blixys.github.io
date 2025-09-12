# Recursively replace favicon link lines in HTML files
$old = '<link rel="icon" type="image/x-icon" href="images/favicon.ico" />'
$new = @'
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="icon" type="image/x-icon" href="/favicon.ico">
<link rel="manifest" href="/site.webmanifest">
'@

Get-ChildItem -Recurse -Include *.html | ForEach-Object {
    $path = $_.FullName
    $content = Get-Content $path -Raw
    if ($content -like "*$old*") {
        $updated = $content -replace [regex]::Escape($old), $new
        Set-Content -Path $path -Value $updated -Encoding UTF8
        Write-Host "Updated $path"
    }
}
