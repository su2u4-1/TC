setlocal

:: Build from the project root
pushd %~dp0..\\..\\
call .\\tools\\build.bat
popd

echo ====================================

:: Run the test from the test directory
pushd %~dp0
echo ## Running Test 1:
..\\..\\build\\program.exe test1.tc . -l
popd

echo ====================================

endlocal
