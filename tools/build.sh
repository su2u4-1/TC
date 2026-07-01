#!/bin/bash
# build.sh - collect all .c from src and .h from include, then run gcc

DEBUG_MODE=0

while [ $# -gt 0 ]; do
    case "$1" in
        -d)
            DEBUG_MODE=1
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 [-d]"
            exit 1
            ;;
    esac
    shift
done

OTHER_FLAG="-Wall -Wextra"

if [ "$DEBUG_MODE" -eq 1 ]; then
    FLAG_DEBUG="-g -O0"
else
    FLAG_DEBUG="-O3"
fi

SRCDIR="src"
INCDIR="include"
OUTDIR="build"
OUTEXE="program"

if [ ! -d "$SRCDIR" ]; then
    echo "Source directory \"$SRCDIR\" not found."
    exit 1
fi
if [ ! -d "$INCDIR" ]; then
    echo "Include directory \"$INCDIR\" not found."
    exit 1
fi

SOURCES=()
HEADERS=()

while IFS= read -r -d '' source_file; do
    SOURCES+=("$source_file")
done < <(find "$SRCDIR" -type f -name "*.c" -print0)

while IFS= read -r -d '' header_file; do
    HEADERS+=("$header_file")
done < <(find "$INCDIR" -type f -name "*.h" -print0)

if [ "${#SOURCES[@]}" -eq 0 ]; then
    echo "No .c files found under \"$SRCDIR\"."
    exit 1
fi

mkdir -p "$OUTDIR"

if [ "$DEBUG_MODE" -eq 1 ]; then
    echo "Build mode: debug"
else
    echo "Build mode: release"
fi

GCC_FLAGS="$OTHER_FLAG"

echo "Build command: gcc $GCC_FLAGS -I\"$INCDIR\" ${SOURCES[*]} -o \"$OUTDIR/$OUTEXE\""

gcc $GCC_FLAGS -I"$INCDIR" "${SOURCES[@]}" -o "$OUTDIR/$OUTEXE"
if [ $? -ne 0 ]; then
    echo "Build failed."
    exit 1
fi

echo "Build succeeded: \"$OUTDIR/$OUTEXE\""
