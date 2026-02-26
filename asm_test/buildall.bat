@echo off

rmdir /s /q build\fake_std 2>nul
mkdir build\fake_std

set HEADERS=assert.h stddef.h stdio.h stdlib.h string.h direct.h unistd.h

for %%h in (%HEADERS%) do (
    (
        echo #ifndef FAKE_%%~nh
        echo #define FAKE_%%~nh
        echo static int Fake_%%~nh = 0;
        echo #endif
    ) > build\fake_std/%%h
)

echo Fake headers created.

gcc -Wall -E -P -nostdinc -I"include" -I"build/fake_std" "D:\TC\src\compiler.c" -o "./build/i/compiler.i"
gcc -Wall -E -P -nostdinc -I"include" -I"build/fake_std" "D:\TC\src\create.c" -o "./build/i/create.i"
gcc -Wall -E -P -nostdinc -I"include" -I"build/fake_std" "D:\TC\src\file.c" -o "./build/i/file.i"
gcc -Wall -E -P -nostdinc -I"include" -I"build/fake_std" "D:\TC\src\helper.c" -o "./build/i/helper.i"
gcc -Wall -E -P -nostdinc -I"include" -I"build/fake_std" "D:\TC\src\lexer.c" -o "./build/i/lexer.i"
gcc -Wall -E -P -nostdinc -I"include" -I"build/fake_std" "D:\TC\src\lib.c" -o "./build/i/lib.i"
gcc -Wall -E -P -nostdinc -I"include" -I"build/fake_std" "D:\TC\src\main.c" -o "./build/i/main.i"
gcc -Wall -E -P -nostdinc -I"include" -I"build/fake_std" "D:\TC\src\output.c" -o "./build/i/output.i"
gcc -Wall -E -P -nostdinc -I"include" -I"build/fake_std" "D:\TC\src\parser.c" -o "./build/i/parser.i"

for %%f in (build\i\*.i) do (
    echo Restoring %%f ...

    for %%h in (%HEADERS%) do (
        powershell -Command "(Get-Content '%%f') -replace 'static int Fake_%%~nh = 0;', '#include <%%h>' | Set-Content '%%f'"
    )
)

echo All .i files restored.

rmdir /s /q build\fake_std

gcc -Wall -S -O0 -I"include" "D:\TC\src\compiler.c" -o "./build/O0/s/compiler.s"
gcc -Wall -S -O0 -I"include" "D:\TC\src\create.c" -o "./build/O0/s/create.s"
gcc -Wall -S -O0 -I"include" "D:\TC\src\file.c" -o "./build/O0/s/file.s"
gcc -Wall -S -O0 -I"include" "D:\TC\src\helper.c" -o "./build/O0/s/helper.s"
gcc -Wall -S -O0 -I"include" "D:\TC\src\lexer.c" -o "./build/O0/s/lexer.s"
gcc -Wall -S -O0 -I"include" "D:\TC\src\lib.c" -o "./build/O0/s/lib.s"
gcc -Wall -S -O0 -I"include" "D:\TC\src\main.c" -o "./build/O0/s/main.s"
gcc -Wall -S -O0 -I"include" "D:\TC\src\output.c" -o "./build/O0/s/output.s"
gcc -Wall -S -O0 -I"include" "D:\TC\src\parser.c" -o "./build/O0/s/parser.s"
echo .s files created for O0.
gcc -Wall -S -O0 -fverbose-asm -I"include" "D:\TC\src\compiler.c" -o "./build/O0/commentS/compiler.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "D:\TC\src\create.c" -o "./build/O0/commentS/create.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "D:\TC\src\file.c" -o "./build/O0/commentS/file.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "D:\TC\src\helper.c" -o "./build/O0/commentS/helper.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "D:\TC\src\lexer.c" -o "./build/O0/commentS/lexer.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "D:\TC\src\lib.c" -o "./build/O0/commentS/lib.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "D:\TC\src\main.c" -o "./build/O0/commentS/main.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "D:\TC\src\output.c" -o "./build/O0/commentS/output.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "D:\TC\src\parser.c" -o "./build/O0/commentS/parser.S"
echo .S files with comments created for O0.

gcc -Wall -S -O1 -I"include" "D:\TC\src\compiler.c" -o "./build/O1/s/compiler.s"
gcc -Wall -S -O1 -I"include" "D:\TC\src\create.c" -o "./build/O1/s/create.s"
gcc -Wall -S -O1 -I"include" "D:\TC\src\file.c" -o "./build/O1/s/file.s"
gcc -Wall -S -O1 -I"include" "D:\TC\src\helper.c" -o "./build/O1/s/helper.s"
gcc -Wall -S -O1 -I"include" "D:\TC\src\lexer.c" -o "./build/O1/s/lexer.s"
gcc -Wall -S -O1 -I"include" "D:\TC\src\lib.c" -o "./build/O1/s/lib.s"
gcc -Wall -S -O1 -I"include" "D:\TC\src\main.c" -o "./build/O1/s/main.s"
gcc -Wall -S -O1 -I"include" "D:\TC\src\output.c" -o "./build/O1/s/output.s"
gcc -Wall -S -O1 -I"include" "D:\TC\src\parser.c" -o "./build/O1/s/parser.s"
echo .s files created for O1.
gcc -Wall -S -O1 -fverbose-asm -I"include" "D:\TC\src\compiler.c" -o "./build/O1/commentS/compiler.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "D:\TC\src\create.c" -o "./build/O1/commentS/create.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "D:\TC\src\file.c" -o "./build/O1/commentS/file.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "D:\TC\src\helper.c" -o "./build/O1/commentS/helper.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "D:\TC\src\lexer.c" -o "./build/O1/commentS/lexer.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "D:\TC\src\lib.c" -o "./build/O1/commentS/lib.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "D:\TC\src\main.c" -o "./build/O1/commentS/main.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "D:\TC\src\output.c" -o "./build/O1/commentS/output.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "D:\TC\src\parser.c" -o "./build/O1/commentS/parser.S"
echo .S files with comments created for O1.

gcc -Wall -S -O2 -I"include" "D:\TC\src\compiler.c" -o "./build/O2/s/compiler.s"
gcc -Wall -S -O2 -I"include" "D:\TC\src\create.c" -o "./build/O2/s/create.s"
gcc -Wall -S -O2 -I"include" "D:\TC\src\file.c" -o "./build/O2/s/file.s"
gcc -Wall -S -O2 -I"include" "D:\TC\src\helper.c" -o "./build/O2/s/helper.s"
gcc -Wall -S -O2 -I"include" "D:\TC\src\lexer.c" -o "./build/O2/s/lexer.s"
gcc -Wall -S -O2 -I"include" "D:\TC\src\lib.c" -o "./build/O2/s/lib.s"
gcc -Wall -S -O2 -I"include" "D:\TC\src\main.c" -o "./build/O2/s/main.s"
gcc -Wall -S -O2 -I"include" "D:\TC\src\output.c" -o "./build/O2/s/output.s"
gcc -Wall -S -O2 -I"include" "D:\TC\src\parser.c" -o "./build/O2/s/parser.s"
echo .s files created for O2.
gcc -Wall -S -O2 -fverbose-asm -I"include" "D:\TC\src\compiler.c" -o "./build/O2/commentS/compiler.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "D:\TC\src\create.c" -o "./build/O2/commentS/create.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "D:\TC\src\file.c" -o "./build/O2/commentS/file.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "D:\TC\src\helper.c" -o "./build/O2/commentS/helper.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "D:\TC\src\lexer.c" -o "./build/O2/commentS/lexer.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "D:\TC\src\lib.c" -o "./build/O2/commentS/lib.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "D:\TC\src\main.c" -o "./build/O2/commentS/main.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "D:\TC\src\output.c" -o "./build/O2/commentS/output.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "D:\TC\src\parser.c" -o "./build/O2/commentS/parser.S"
echo .S files with comments created for O2.

gcc -Wall -S -O3 -I"include" "D:\TC\src\compiler.c" -o "./build/O3/s/compiler.s"
gcc -Wall -S -O3 -I"include" "D:\TC\src\create.c" -o "./build/O3/s/create.s"
gcc -Wall -S -O3 -I"include" "D:\TC\src\file.c" -o "./build/O3/s/file.s"
gcc -Wall -S -O3 -I"include" "D:\TC\src\helper.c" -o "./build/O3/s/helper.s"
gcc -Wall -S -O3 -I"include" "D:\TC\src\lexer.c" -o "./build/O3/s/lexer.s"
gcc -Wall -S -O3 -I"include" "D:\TC\src\lib.c" -o "./build/O3/s/lib.s"
gcc -Wall -S -O3 -I"include" "D:\TC\src\main.c" -o "./build/O3/s/main.s"
gcc -Wall -S -O3 -I"include" "D:\TC\src\output.c" -o "./build/O3/s/output.s"
gcc -Wall -S -O3 -I"include" "D:\TC\src\parser.c" -o "./build/O3/s/parser.s"
echo .s files created for O3.
gcc -Wall -S -O3 -fverbose-asm -I"include" "D:\TC\src\compiler.c" -o "./build/O3/commentS/compiler.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "D:\TC\src\create.c" -o "./build/O3/commentS/create.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "D:\TC\src\file.c" -o "./build/O3/commentS/file.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "D:\TC\src\helper.c" -o "./build/O3/commentS/helper.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "D:\TC\src\lexer.c" -o "./build/O3/commentS/lexer.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "D:\TC\src\lib.c" -o "./build/O3/commentS/lib.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "D:\TC\src\main.c" -o "./build/O3/commentS/main.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "D:\TC\src\output.c" -o "./build/O3/commentS/output.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "D:\TC\src\parser.c" -o "./build/O3/commentS/parser.S"
echo .S files with comments created for O3.

gcc -Wall -S -Os -I"include" "D:\TC\src\compiler.c" -o "./build/Os/s/compiler.s"
gcc -Wall -S -Os -I"include" "D:\TC\src\create.c" -o "./build/Os/s/create.s"
gcc -Wall -S -Os -I"include" "D:\TC\src\file.c" -o "./build/Os/s/file.s"
gcc -Wall -S -Os -I"include" "D:\TC\src\helper.c" -o "./build/Os/s/helper.s"
gcc -Wall -S -Os -I"include" "D:\TC\src\lexer.c" -o "./build/Os/s/lexer.s"
gcc -Wall -S -Os -I"include" "D:\TC\src\lib.c" -o "./build/Os/s/lib.s"
gcc -Wall -S -Os -I"include" "D:\TC\src\main.c" -o "./build/Os/s/main.s"
gcc -Wall -S -Os -I"include" "D:\TC\src\output.c" -o "./build/Os/s/output.s"
gcc -Wall -S -Os -I"include" "D:\TC\src\parser.c" -o "./build/Os/s/parser.s"
echo .s files created for Os.
gcc -Wall -S -Os -fverbose-asm -I"include" "D:\TC\src\compiler.c" -o "./build/Os/commentS/compiler.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "D:\TC\src\create.c" -o "./build/Os/commentS/create.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "D:\TC\src\file.c" -o "./build/Os/commentS/file.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "D:\TC\src\helper.c" -o "./build/Os/commentS/helper.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "D:\TC\src\lexer.c" -o "./build/Os/commentS/lexer.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "D:\TC\src\lib.c" -o "./build/Os/commentS/lib.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "D:\TC\src\main.c" -o "./build/Os/commentS/main.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "D:\TC\src\output.c" -o "./build/Os/commentS/output.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "D:\TC\src\parser.c" -o "./build/Os/commentS/parser.S"
echo .S files with comments created for Os.

for %%O in (O0 O1 O2 O3 Os) do (
    for /r %%F in (%%O\commentS\*.S) do (
        powershell -Command "(Get-Content '%%F') -replace '#',';' | Set-Content '%%F'"
    )
)
echo All .S files comments replaced with ';'.
