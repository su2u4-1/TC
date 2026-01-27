@echo off
rem build.bat - collect all .c from src and .h from include, then run gcc

setlocal enabledelayedexpansion

rem --- Build Flags ---
rem Set any of these to an empty string to disable the flag.
set "FLAG_DEBUG=-g"
set "FLAG_OPTIMIZE=-O2"
set "FLAG_WALL=-Wall"
set "FLAG_WEXTRA=-Wextra"
rem --- End Build Flags ---

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

set "GCC_FLAGS=%FLAG_WALL% %FLAG_WEXTRA% %FLAG_OPTIMIZE% %FLAG_DEBUG%"

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
