@echo off
REM ********************************************
REM extract_rom.bat
REM Automates dumping selected partitions and full flash
REM via MTKClient (https://github.com/bkerler/mtkclient)
REM ********************************************

:: 1) Make sure this script lives in your MTKClient root folder
cd /d "%~dp0"

echo.
echo [*] ================================================
echo [*] MTKClient ROM Extraction Script
echo [*] ================================================
echo.

:: 2) Reminder to enter BROM mode
echo [*] Please power off your device, then hold VOL+UP + VOL+DOWN + POWER
echo [*] while plugging in USB to enter BROM mode.
echo.
pause

:: 3) Create an output directory if it doesn't exist
if not exist out (
    echo [*] Creating output directory: .\out\
    mkdir out
    echo.
)

:: 4) Dump key partitions (this will wipe userdata!)
echo [*] Dumping metadata, userdata, and md_udc partitions...
echo     (⚠️ userdata WILL be wiped)
python mtk.py r metadata,userdata,md_udc metadata.img,userdata.img,md_udc.img
if errorlevel 1 (
    echo [!] Error dumping key partitions. Exiting.
    pause
    exit /b 1
)
echo.

:: 5) Dump *all* partitions into “out/”
echo [*] Dumping all partitions into .\out\…
python mtk.py rl out
if errorlevel 1 (
    echo [!] Error dumping all partitions. Exiting.
    pause
    exit /b 1
)
echo.

echo [*] Extraction complete!
echo [*] - Key images are in %CD%
echo [*] - Full partition dumps are in %CD%\out\
echo.

pause
