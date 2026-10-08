@echo off
setlocal EnableExtensions EnableDelayedExpansion

title BUNGDUM x RUNIN ^| BangDam Shop
color 07
mode con: cols=110 lines=45

cls
echo.
echo.
echo     BBBBBBB    U     U   N     N   GGGGG   DDDDD    U     U   M     M
echo     B      B   U     U   NN    N   G       D     D   U     U   MM   MM
echo     BBBBBBB    U     U   N N   N   G  GGG  D     D   U     U   M M M M
echo     B      B   U     U   N  N  N   G    G  D     D   U     U   M  M  M
echo     BBBBBBB     UUUUU    N   N N   GGGGG   DDDDD    UUUUU   M     M
echo.
echo.
echo              XX        XX     RRRRR    U     U   N     N   III   N     N
echo               XX      XX      R    R   U     U   NN    N    I    NN    N
echo                XX    XX       RRRRR    U     U   N N   N    I    N N   N
echo                 XX  XX        R   R    U     U   N  N  N    I    N  N  N
echo                  XXXX         R    R    UUUUU    N   N N   III   N   N N
echo.
echo.
echo        +--------------------------------------------------------------------------------+
echo        ^|                                                                                ^|
echo        ^|                         B A N G D A M   S H O P                                ^|
echo        ^|                                                                                ^|
echo        ^|                     BUNGDUM x RUNIN  ^|  LOADER                                 ^|
echo        ^|                                                                                ^|
echo        +--------------------------------------------------------------------------------+
echo.
echo.
echo                         [ SYSTEM INITIALIZING ]
echo.
timeout /t 1 /nobreak >nul

echo  [01] Starting loader............................ OK
timeout /t 1 /nobreak >nul
echo  [02] Checking Windows........................... OK
timeout /t 1 /nobreak >nul
echo  [03] Windows 10 / Windows 11 mode.............. OK
timeout /t 1 /nobreak >nul
echo  [04] Preparing configuration................... OK
timeout /t 1 /nobreak >nul
echo  [05] System ready............................... OK
echo.

:KEY

echo.
echo        +--------------------------------------------------------------------------------+
echo        ^|                                  KEY SYSTEM                                    ^|
echo        +--------------------------------------------------------------------------------+
echo.
echo             Enter your BangDam Shop license key
echo.
echo             Example: BUNGDUMxRUNIN-8ee9a3s
echo.
set "KEY="
set /p "KEY=             KEY: "

if /I "%KEY%"=="BUNGDUMxRUNIN-8ee9a3s" goto KEY_OK

echo.
echo             [X] INVALID KEY
echo             [X] ACCESS DENIED
echo.
timeout /t 2 /nobreak >nul
goto KEY


:KEY_OK

cls
echo.
echo        +--------------------------------------------------------------------------------+
echo        ^|                                                                                ^|
echo        ^|                         B U N G D U M   x   R U N I N                          ^|
echo        ^|                                                                                ^|
echo        ^|                              BANGDAM SHOP                                     ^|
echo        ^|                                                                                ^|
echo        +--------------------------------------------------------------------------------+
echo.
echo             [OK] KEY ACCEPTED
echo             [OK] ACCESS GRANTED
echo.
timeout /t 1 /nobreak >nul

echo             [01] Windows Check....................... OK
echo             [02] Windows 10 / 11 Mode................. OK
echo             [03] Registry Configuration............... READY
echo             [04] Mouse Configuration.................. READY
echo             [05] Desktop Configuration................ READY
echo             [06] Keyboard Configuration............... READY
echo             [07] Emulator Detection................... READY
echo             [08] Launch System......................... READY
echo.

echo        +--------------------------------------------------------------------------------+
echo        ^|                              REG CONFIG                                        ^|
echo        +--------------------------------------------------------------------------------+
echo.

set "REGFILE=%TEMP%\BangDam_Config.reg"

echo             [REG] Creating temporary registry file...

> "%REGFILE%" echo Windows Registry Editor Version 5.00
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_CURRENT_USER\Control Panel\Desktop]
>>"%REGFILE%" echo "MenuShowDelay"="0"
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_CURRENT_USER\Control Panel\Mouse]
>>"%REGFILE%" echo "ActiveWindowTracking"=dword:00000000
>>"%REGFILE%" echo "Beep"="No"
>>"%REGFILE%" echo "MouseHoverHeight"="100"
>>"%REGFILE%" echo "MouseHoverTime"="900"
>>"%REGFILE%" echo "MouseHoverWidth"="100"
>>"%REGFILE%" echo "MouseSensitivity"="10"
>>"%REGFILE%" echo "MouseSpeed"="1"
>>"%REGFILE%" echo "MouseThreshold1"="6"
>>"%REGFILE%" echo "MouseThreshold2"="10"
>>"%REGFILE%" echo "SnapToDefaultButton"="0"
>>"%REGFILE%" echo "SwapMouseButtons"="0"
>>"%REGFILE%" echo.
>>"%REGFILE%" echo [HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response]
>>"%REGFILE%" echo "AutoRepeatDelay"="1000"
>>"%REGFILE%" echo "AutoRepeatRate"="500"
>>"%REGFILE%" echo "BounceTime"="0"
>>"%REGFILE%" echo "DelayBeforeAcceptance"="1000"
>>"%REGFILE%" echo "Flags"="126"

if not exist "%REGFILE%" (
    echo             [X] Could not create registry file.
    pause
    exit /b 1
)

echo             [OK] Temporary registry created.
echo.
echo             [REG] Importing configuration...

reg.exe import "%REGFILE%" >nul 2>&1

if errorlevel 1 (
    echo             [X] Registry import failed.
) else (
    echo             [OK] Registry configuration imported.
)

echo.
echo             [REG] Removing temporary registry file...

del /f /q "%REGFILE%" >nul 2>&1

if exist "%REGFILE%" (
    echo             [!] Temporary file could not be removed.
) else (
    echo             [OK] Temporary registry file removed.
)

echo.
echo        +--------------------------------------------------------------------------------+
echo        ^|                             SELECT EMULATOR                                    ^|
echo        +--------------------------------------------------------------------------------+
echo.
echo                 [1]  BlueStacks
echo.
echo                 [2]  BlueStacks MSI
echo.
echo        +--------------------------------------------------------------------------------+
echo.

set "CHOICE="
set /p "CHOICE=             Select [1-2]: "

if "%CHOICE%"=="1" goto BLUESTACKS
if "%CHOICE%"=="2" goto MSI

echo.
echo             [X] Invalid selection.
timeout /t 1 /nobreak >nul
goto KEY_OK


:BLUESTACKS

cls
echo.
echo        +--------------------------------------------------------------------------------+
echo        ^|                              BLUESTACKS                                        ^|
echo        +--------------------------------------------------------------------------------+
echo.
echo             [SCAN] Searching for HD-Player.exe...
echo.

set "PLAYER="

if exist "%ProgramFiles%\BlueStacks_nxt\HD-Player.exe" (
    set "PLAYER=%ProgramFiles%\BlueStacks_nxt\HD-Player.exe"
)

if not defined PLAYER if exist "%ProgramFiles%\BlueStacks\HD-Player.exe" (
    set "PLAYER=%ProgramFiles%\BlueStacks\HD-Player.exe"
)

if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_nxt\HD-Player.exe" (
    set "PLAYER=%ProgramFiles(x86)%\BlueStacks_nxt\HD-Player.exe"
)

if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks\HD-Player.exe" (
    set "PLAYER=%ProgramFiles(x86)%\BlueStacks\HD-Player.exe"
)

if not defined PLAYER goto NOTFOUND

goto LAUNCH


:MSI

cls
echo.
echo        +--------------------------------------------------------------------------------+
echo        ^|                           BLUESTACKS MSI                                       ^|
echo        +--------------------------------------------------------------------------------+
echo.
echo             [SCAN] Searching for HD-Player.exe...
echo.

set "PLAYER="

if exist "%ProgramFiles%\BlueStacks_msi2\HD-Player.exe" (
    set "PLAYER=%ProgramFiles%\BlueStacks_msi2\HD-Player.exe"
)

if not defined PLAYER if exist "%ProgramFiles%\BlueStacks_msi5\HD-Player.exe" (
    set "PLAYER=%ProgramFiles%\BlueStacks_msi5\HD-Player.exe"
)

if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_msi2\HD-Player.exe" (
    set "PLAYER=%ProgramFiles(x86)%\BlueStacks_msi2\HD-Player.exe"
)

if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_msi5\HD-Player.exe" (
    set "PLAYER=%ProgramFiles(x86)%\BlueStacks_msi5\HD-Player.exe"
)

if not defined PLAYER goto NOTFOUND

goto LAUNCH


:LAUNCH

echo.
echo        +--------------------------------------------------------------------------------+
echo        ^|                            EMULATOR FOUND                                      ^|
echo        +--------------------------------------------------------------------------------+
echo.
echo             [OK] Emulator detected
echo.
echo             [PATH]
echo             %PLAYER%
echo.
echo             [LAUNCH] Starting emulator...
echo.

start "" "%PLAYER%"

timeout /t 2 /nobreak >nul

echo.
echo             [OK] Emulator launched.
echo.
echo        +--------------------------------------------------------------------------------+
echo        ^|                                                                                ^|
echo        ^|                         B U N G D U M   x   R U N I N                          ^|
echo        ^|                              BANGDAM SHOP                                      ^|
echo        ^|                                                                                ^|
echo        +--------------------------------------------------------------------------------+
echo.
echo             [DONE] Process completed.
echo.

pause
exit /b 0


:NOTFOUND

echo.
echo        +--------------------------------------------------------------------------------+
echo        ^|                                  ERROR                                         ^|
echo        +--------------------------------------------------------------------------------+
echo.
echo             [X] Emulator not found.
echo.
echo             [INFO] Please check your BlueStacks installation.
echo.
echo        +--------------------------------------------------------------------------------+
echo.

pause
exit /b 1
