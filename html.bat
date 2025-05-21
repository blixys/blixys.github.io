@echo off
setlocal enabledelayedexpansion

for %%f in (*.html) do (
    if /I not "%%f"=="index.html" (
        set "filename=%%~nf"
        mkdir "!filename!" 2>nul
        move "%%f" "!filename!\index.html"
    )
)

echo Done. You can now access pages like /artwork/ instead of artwork.html
pause
