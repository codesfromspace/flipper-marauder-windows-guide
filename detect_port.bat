@echo off
setlocal

echo Serial devices currently visible to Windows:
powershell.exe -NoProfile -Command "$ports = Get-CimInstance Win32_PnPEntity | Where-Object { $_.Name -match '\(COM[0-9]+\)' } | Select-Object -ExpandProperty Name; if ($ports) { $ports } else { Write-Output 'No COM port was found. Check the USB cable, driver, and BOOT mode.'; exit 1 }"
if errorlevel 1 (
    echo.
    echo You can also check Device Manager ^> Ports (COM ^& LPT).
    exit /b 1
)
exit /b 0
