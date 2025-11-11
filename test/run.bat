setlocal

:: Build from the project root
pushd %~dp0..\\
call .\\tools\\build.bat
popd

:: Run the test from the test directory
echo ====================================
pushd %~dp0
echo ## Running Test 1:
..\\build\\program.exe .\\test1\\test1.tc .\\test1\\ -l
popd
echo ====================================
pushd %~dp0
echo ## Running Test 2:
..\\build\\program.exe .\\test2\\test2.tc .\\test2\\ -l
popd
echo ====================================

endlocal
