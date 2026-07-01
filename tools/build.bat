@echo off
rem build.bat - collect all .c from src and .h from include, then run gcc

setlocal enabledelayedexpansion

set "DEBUG_MODE=0"

:parse_args
if "%~1"=="" goto args_done
if /I "%~1"=="-d" (
    set "DEBUG_MODE=1"
) else (
    echo Unknown option: %~1
    echo Usage: %~nx0 [-d]
    exit /b 1
)
shift
goto parse_args

:args_done

rem --- Build Flags ---
rem Set any of these to an empty string to disable the flag.
set "OTHER_FLAG=-Wall -Wextra"
rem --- End Build Flags ---

if "%DEBUG_MODE%"=="1" (
    set "FLAG_DEBUG=-g -O0"
) else (
    set "FLAG_DEBUG=-O3"
)

set "SRCDIR=src"
set "INCDIR=include"
set "OUTDIR=build"
set "OUTEXE=program.exe"

set "SOURCES="
set "HEADERS="

if not exist "%SRCDIR%" (
    echo Source directory "%SRCDIR%" not found.
    exit /b 1
)
if not exist "%INCDIR%" (
    echo Include directory "%INCDIR%" not found.
    exit /b 1
)

for /r "%SRCDIR%" %%F in (*.c) do (
    set "SOURCES=!SOURCES! "%%~fF""
)

for /r "%INCDIR%" %%H in (*.h) do (
    set "HEADERS=!HEADERS! "%%~fH""
)

if "%SOURCES%"=="" (
    echo No .c files found under "%SRCDIR%".
    exit /b 1
)

if not exist "%OUTDIR%" mkdir "%OUTDIR%"

set "GCC_FLAGS=%OTHER_FLAG% %FLAG_OPTIMIZE%"

if "%DEBUG_MODE%"=="1" (
    echo Build mode: debug
) else (
    echo Build mode: release
)

rem Show the full command
echo Build command: gcc %GCC_FLAGS% -I"%INCDIR%" %SOURCES% -o "%OUTDIR%\%OUTEXE%"

rem Actually compile using the .c files and the include directory
gcc %GCC_FLAGS% -I"%INCDIR%" %SOURCES% -o "%OUTDIR%\%OUTEXE%"
if errorlevel 1 (
    echo Build failed.
    exit /b 1
)

echo Build succeeded: "%OUTDIR%\%OUTEXE%"
endlocal
