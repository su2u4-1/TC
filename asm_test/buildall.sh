#!/bin/bash

rm -rf asm_test/fake_std 2>/dev/null
mkdir -p asm_test/fake_std

HEADERS=(assert.h stddef.h stdio.h stdlib.h string.h direct.h unistd.h)

for h in "${HEADERS[@]}"; do
    name="${h%.h}"
    cat > "asm_test/fake_std/$h" <<EOF
#ifndef FAKE_${name}
#define FAKE_${name}
static int Fake_${name} = 0;
#endif
EOF
done

echo "Fake headers created."

gcc -Wall -E -P -nostdinc -I"include" -I"asm_test/fake_std" "src/compiler.c" -o "./asm_test/i/compiler.i"
gcc -Wall -E -P -nostdinc -I"include" -I"asm_test/fake_std" "src/create.c" -o "./asm_test/i/create.i"
gcc -Wall -E -P -nostdinc -I"include" -I"asm_test/fake_std" "src/file.c" -o "./asm_test/i/file.i"
gcc -Wall -E -P -nostdinc -I"include" -I"asm_test/fake_std" "src/helper.c" -o "./asm_test/i/helper.i"
gcc -Wall -E -P -nostdinc -I"include" -I"asm_test/fake_std" "src/lexer.c" -o "./asm_test/i/lexer.i"
gcc -Wall -E -P -nostdinc -I"include" -I"asm_test/fake_std" "src/lib.c" -o "./asm_test/i/lib.i"
gcc -Wall -E -P -nostdinc -I"include" -I"asm_test/fake_std" "src/main.c" -o "./asm_test/i/main.i"
gcc -Wall -E -P -nostdinc -I"include" -I"asm_test/fake_std" "src/output.c" -o "./asm_test/i/output.i"
gcc -Wall -E -P -nostdinc -I"include" -I"asm_test/fake_std" "src/parser.c" -o "./asm_test/i/parser.i"

for f in asm_test/i/*.i; do
    echo "Restoring $f ..."
    
    for h in "${HEADERS[@]}"; do
        name="${h%.h}"
        sed -i "s/static int Fake_${name} = 0;/#include <$h>/g" "$f"
    done
done

echo "All .i files restored."

rm -rf asm_test/fake_std

gcc -Wall -S -O0 -I"include" "src/compiler.c" -o "./asm_test/wsl/O0/s/compiler.s"
gcc -Wall -S -O0 -I"include" "src/create.c" -o "./asm_test/wsl/O0/s/create.s"
gcc -Wall -S -O0 -I"include" "src/file.c" -o "./asm_test/wsl/O0/s/file.s"
gcc -Wall -S -O0 -I"include" "src/helper.c" -o "./asm_test/wsl/O0/s/helper.s"
gcc -Wall -S -O0 -I"include" "src/lexer.c" -o "./asm_test/wsl/O0/s/lexer.s"
gcc -Wall -S -O0 -I"include" "src/lib.c" -o "./asm_test/wsl/O0/s/lib.s"
gcc -Wall -S -O0 -I"include" "src/main.c" -o "./asm_test/wsl/O0/s/main.s"
gcc -Wall -S -O0 -I"include" "src/output.c" -o "./asm_test/wsl/O0/s/output.s"
gcc -Wall -S -O0 -I"include" "src/parser.c" -o "./asm_test/wsl/O0/s/parser.s"
echo ".s files created for O0."
gcc -Wall -S -O0 -fverbose-asm -I"include" "src/compiler.c" -o "./asm_test/wsl/O0/commentS/compiler.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "src/create.c" -o "./asm_test/wsl/O0/commentS/create.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "src/file.c" -o "./asm_test/wsl/O0/commentS/file.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "src/helper.c" -o "./asm_test/wsl/O0/commentS/helper.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "src/lexer.c" -o "./asm_test/wsl/O0/commentS/lexer.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "src/lib.c" -o "./asm_test/wsl/O0/commentS/lib.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "src/main.c" -o "./asm_test/wsl/O0/commentS/main.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "src/output.c" -o "./asm_test/wsl/O0/commentS/output.S"
gcc -Wall -S -O0 -fverbose-asm -I"include" "src/parser.c" -o "./asm_test/wsl/O0/commentS/parser.S"
echo ".S files with comments created for O0."

gcc -Wall -S -O1 -I"include" "src/compiler.c" -o "./asm_test/wsl/O1/s/compiler.s"
gcc -Wall -S -O1 -I"include" "src/create.c" -o "./asm_test/wsl/O1/s/create.s"
gcc -Wall -S -O1 -I"include" "src/file.c" -o "./asm_test/wsl/O1/s/file.s"
gcc -Wall -S -O1 -I"include" "src/helper.c" -o "./asm_test/wsl/O1/s/helper.s"
gcc -Wall -S -O1 -I"include" "src/lexer.c" -o "./asm_test/wsl/O1/s/lexer.s"
gcc -Wall -S -O1 -I"include" "src/lib.c" -o "./asm_test/wsl/O1/s/lib.s"
gcc -Wall -S -O1 -I"include" "src/main.c" -o "./asm_test/wsl/O1/s/main.s"
gcc -Wall -S -O1 -I"include" "src/output.c" -o "./asm_test/wsl/O1/s/output.s"
gcc -Wall -S -O1 -I"include" "src/parser.c" -o "./asm_test/wsl/O1/s/parser.s"
echo ".s files created for O1."
gcc -Wall -S -O1 -fverbose-asm -I"include" "src/compiler.c" -o "./asm_test/wsl/O1/commentS/compiler.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "src/create.c" -o "./asm_test/wsl/O1/commentS/create.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "src/file.c" -o "./asm_test/wsl/O1/commentS/file.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "src/helper.c" -o "./asm_test/wsl/O1/commentS/helper.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "src/lexer.c" -o "./asm_test/wsl/O1/commentS/lexer.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "src/lib.c" -o "./asm_test/wsl/O1/commentS/lib.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "src/main.c" -o "./asm_test/wsl/O1/commentS/main.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "src/output.c" -o "./asm_test/wsl/O1/commentS/output.S"
gcc -Wall -S -O1 -fverbose-asm -I"include" "src/parser.c" -o "./asm_test/wsl/O1/commentS/parser.S"
echo ".S files with comments created for O1."

gcc -Wall -S -O2 -I"include" "src/compiler.c" -o "./asm_test/wsl/O2/s/compiler.s"
gcc -Wall -S -O2 -I"include" "src/create.c" -o "./asm_test/wsl/O2/s/create.s"
gcc -Wall -S -O2 -I"include" "src/file.c" -o "./asm_test/wsl/O2/s/file.s"
gcc -Wall -S -O2 -I"include" "src/helper.c" -o "./asm_test/wsl/O2/s/helper.s"
gcc -Wall -S -O2 -I"include" "src/lexer.c" -o "./asm_test/wsl/O2/s/lexer.s"
gcc -Wall -S -O2 -I"include" "src/lib.c" -o "./asm_test/wsl/O2/s/lib.s"
gcc -Wall -S -O2 -I"include" "src/main.c" -o "./asm_test/wsl/O2/s/main.s"
gcc -Wall -S -O2 -I"include" "src/output.c" -o "./asm_test/wsl/O2/s/output.s"
gcc -Wall -S -O2 -I"include" "src/parser.c" -o "./asm_test/wsl/O2/s/parser.s"
echo ".s files created for O2."
gcc -Wall -S -O2 -fverbose-asm -I"include" "src/compiler.c" -o "./asm_test/wsl/O2/commentS/compiler.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "src/create.c" -o "./asm_test/wsl/O2/commentS/create.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "src/file.c" -o "./asm_test/wsl/O2/commentS/file.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "src/helper.c" -o "./asm_test/wsl/O2/commentS/helper.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "src/lexer.c" -o "./asm_test/wsl/O2/commentS/lexer.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "src/lib.c" -o "./asm_test/wsl/O2/commentS/lib.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "src/main.c" -o "./asm_test/wsl/O2/commentS/main.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "src/output.c" -o "./asm_test/wsl/O2/commentS/output.S"
gcc -Wall -S -O2 -fverbose-asm -I"include" "src/parser.c" -o "./asm_test/wsl/O2/commentS/parser.S"
echo ".S files with comments created for O2."

gcc -Wall -S -O3 -I"include" "src/compiler.c" -o "./asm_test/wsl/O3/s/compiler.s"
gcc -Wall -S -O3 -I"include" "src/create.c" -o "./asm_test/wsl/O3/s/create.s"
gcc -Wall -S -O3 -I"include" "src/file.c" -o "./asm_test/wsl/O3/s/file.s"
gcc -Wall -S -O3 -I"include" "src/helper.c" -o "./asm_test/wsl/O3/s/helper.s"
gcc -Wall -S -O3 -I"include" "src/lexer.c" -o "./asm_test/wsl/O3/s/lexer.s"
gcc -Wall -S -O3 -I"include" "src/lib.c" -o "./asm_test/wsl/O3/s/lib.s"
gcc -Wall -S -O3 -I"include" "src/main.c" -o "./asm_test/wsl/O3/s/main.s"
gcc -Wall -S -O3 -I"include" "src/output.c" -o "./asm_test/wsl/O3/s/output.s"
gcc -Wall -S -O3 -I"include" "src/parser.c" -o "./asm_test/wsl/O3/s/parser.s"
echo ".s files created for O3."
gcc -Wall -S -O3 -fverbose-asm -I"include" "src/compiler.c" -o "./asm_test/wsl/O3/commentS/compiler.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "src/create.c" -o "./asm_test/wsl/O3/commentS/create.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "src/file.c" -o "./asm_test/wsl/O3/commentS/file.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "src/helper.c" -o "./asm_test/wsl/O3/commentS/helper.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "src/lexer.c" -o "./asm_test/wsl/O3/commentS/lexer.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "src/lib.c" -o "./asm_test/wsl/O3/commentS/lib.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "src/main.c" -o "./asm_test/wsl/O3/commentS/main.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "src/output.c" -o "./asm_test/wsl/O3/commentS/output.S"
gcc -Wall -S -O3 -fverbose-asm -I"include" "src/parser.c" -o "./asm_test/wsl/O3/commentS/parser.S"
echo ".S files with comments created for O3."

gcc -Wall -S -Os -I"include" "src/compiler.c" -o "./asm_test/wsl/Os/s/compiler.s"
gcc -Wall -S -Os -I"include" "src/create.c" -o "./asm_test/wsl/Os/s/create.s"
gcc -Wall -S -Os -I"include" "src/file.c" -o "./asm_test/wsl/Os/s/file.s"
gcc -Wall -S -Os -I"include" "src/helper.c" -o "./asm_test/wsl/Os/s/helper.s"
gcc -Wall -S -Os -I"include" "src/lexer.c" -o "./asm_test/wsl/Os/s/lexer.s"
gcc -Wall -S -Os -I"include" "src/lib.c" -o "./asm_test/wsl/Os/s/lib.s"
gcc -Wall -S -Os -I"include" "src/main.c" -o "./asm_test/wsl/Os/s/main.s"
gcc -Wall -S -Os -I"include" "src/output.c" -o "./asm_test/wsl/Os/s/output.s"
gcc -Wall -S -Os -I"include" "src/parser.c" -o "./asm_test/wsl/Os/s/parser.s"
echo ".s files created for Os."
gcc -Wall -S -Os -fverbose-asm -I"include" "src/compiler.c" -o "./asm_test/wsl/Os/commentS/compiler.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "src/create.c" -o "./asm_test/wsl/Os/commentS/create.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "src/file.c" -o "./asm_test/wsl/Os/commentS/file.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "src/helper.c" -o "./asm_test/wsl/Os/commentS/helper.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "src/lexer.c" -o "./asm_test/wsl/Os/commentS/lexer.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "src/lib.c" -o "./asm_test/wsl/Os/commentS/lib.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "src/main.c" -o "./asm_test/wsl/Os/commentS/main.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "src/output.c" -o "./asm_test/wsl/Os/commentS/output.S"
gcc -Wall -S -Os -fverbose-asm -I"include" "src/parser.c" -o "./asm_test/wsl/Os/commentS/parser.S"
echo ".S files with comments created for Os."

for O in O0 O1 O2 O3 Os; do
    for F in asm_test/wsl/$O/commentS/*.S; do
        sed -i 's/#/;/g' "$F"
    done
done
echo "All .S files comments replaced with ';'."
