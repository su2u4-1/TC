@echo off
setlocal enabledelayedexpansion

REM Build the project
call .\tools\build.bat
if errorlevel 1 (
    echo Build failed!
    exit /b 1
)

REM Detect available tests
set "MAX_TEST_INDEX=0"
for /d %%D in (.\test\test*) do (
    set "TEST_NAME=%%~nxD"
    set "TEST_INDEX=!TEST_NAME:test=!"
    set "INVALID_TEST="
    if not defined TEST_INDEX set "INVALID_TEST=1"
    for /f "delims=0123456789" %%A in ("!TEST_INDEX!") do set "INVALID_TEST=1"
    if not defined INVALID_TEST (
        set "TEST_DIR_!TEST_INDEX!=%%~nxD"
        if !TEST_INDEX! gtr !MAX_TEST_INDEX! set "MAX_TEST_INDEX=!TEST_INDEX!"
    )
)

REM Parse command line arguments
set "RUN_ALL=1"
set "CLEAR_SCREEN=0"

if "%~1"=="" goto run_tests

:parse_args
if "%~1"=="" goto run_tests
set "ARG=%~1"
if /I "!ARG!"=="-c" (
    set "CLEAR_SCREEN=1"
) else if "!ARG:~0,1!"=="-" (
    set "TEST_INDEX=!ARG:~1!"
    set "INVALID_TEST="
    if not defined TEST_INDEX set "INVALID_TEST=1"
    for /f "delims=0123456789" %%A in ("!TEST_INDEX!") do set "INVALID_TEST=1"
    if defined INVALID_TEST (
        echo Unknown option: !ARG!
        echo Usage: %~nx0 [-c] [-1] [-2] [-3] ...
        endlocal
        exit /b 1
    )
    set "RUN_ALL=0"
    set "RUN_TEST_!TEST_INDEX!=1"
) else (
    echo Unknown option: !ARG!
    echo Usage: %~nx0 [-c] [-1] [-2] [-3] ...
    endlocal
    exit /b 1
)
shift
goto parse_args

:run_tests

if "%CLEAR_SCREEN%"=="1" cls

REM Run tests
set "HAS_ERROR=0"
echo.
echo ========================================

if "%RUN_ALL%"=="1" (
    if "%MAX_TEST_INDEX%"=="0" (
        echo No tests found.
    ) else (
        echo Running all tests...
        echo ========================================
        for /l %%I in (1,1,%MAX_TEST_INDEX%) do (
            if defined TEST_DIR_%%I (
                set "TEST_NAME=!TEST_DIR_%%I!"
                echo.
                echo [Test %%I]
                .\build\program.exe .\test\!TEST_NAME!\!TEST_NAME!.tc -l -a -s
                if errorlevel 1 (
                    echo ERROR: Test %%I failed!
                    set "HAS_ERROR=1"
                )
            )
        )
    )
) else (
    for /l %%I in (1,1,%MAX_TEST_INDEX%) do (
        if defined RUN_TEST_%%I (
            if defined TEST_DIR_%%I (
                set "TEST_NAME=!TEST_DIR_%%I!"
                echo.
                echo [Test %%I]
                .\build\program.exe .\test\!TEST_NAME!\!TEST_NAME!.tc -l -a -s
                if errorlevel 1 (
                    echo ERROR: Test %%I failed!
                    set "HAS_ERROR=1"
                )
            )
        )
    )
)

echo.
echo ========================================
if "%HAS_ERROR%"=="1" (
    echo Tests completed with errors!
    endlocal
    exit /b 1
) else (
    echo Tests completed!
    endlocal
)
