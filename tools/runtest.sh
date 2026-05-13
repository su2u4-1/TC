#!/bin/bash

# Build the project
bash ./tools/build.sh
if [ $? -ne 0 ]; then
    echo "Build failed!"
    exit 1
fi

# Detect available tests
MAX_TEST_INDEX=0
TEST_NAMES=()
for test_path in ./test/test*; do
    [ -d "$test_path" ] || continue

    test_name=${test_path##*/}
    test_index=${test_name#test}
    if [[ ! $test_index =~ ^[0-9]+$ ]]; then
        continue
    fi

    TEST_NAMES[$test_index]="$test_name"
    if (( test_index > MAX_TEST_INDEX )); then
        MAX_TEST_INDEX=$test_index
    fi
done

# Parse command line arguments
RUN_ALL=1
CLEAR_SCREEN=0
SELECTED_TESTS=()

if [ $# -eq 0 ]; then
    RUN_ALL=1
else
    for arg in "$@"; do
        case $arg in
            -c)
                CLEAR_SCREEN=1
                ;;
            -[0-9]*)
                test_index=${arg#-}
                if [[ ! $test_index =~ ^[0-9]+$ ]]; then
                    echo "Unknown option: $arg"
                    echo "Usage: $0 [-c] [-1] [-2] [-3] ..."
                    exit 1
                fi

                RUN_ALL=0
                SELECTED_TESTS[$test_index]=1
                ;;
            *)
                echo "Unknown option: $arg"
                echo "Usage: $0 [-c] [-1] [-2] [-3] ..."
                echo "  -c    Clear screen before running tests"
                echo "  -N    Run testN"
                echo "  (no options: run all tests)"
                exit 1
                ;;
        esac
    done
fi

if [ $CLEAR_SCREEN -eq 1 ]; then
    clear
fi

# Run tests
HAS_ERROR=0
echo ""
echo "========================================"
if [ $RUN_ALL -eq 1 ]; then
    if [ $MAX_TEST_INDEX -eq 0 ]; then
        echo "No tests found."
    else
        echo "Running all tests..."
        echo "========================================"
    fi
fi

for ((i=1; i<=MAX_TEST_INDEX; i++)); do
    test_name=${TEST_NAMES[$i]}
    if [ -z "$test_name" ]; then
        continue
    fi

    should_run=0
    if [ $RUN_ALL -eq 1 ] || [ -n "${SELECTED_TESTS[$i]}" ]; then
        should_run=1
    fi

    if [ $should_run -eq 1 ]; then
        echo ""
        echo "[Test $i]"
        ./build/program "./test/$test_name/$test_name.tc" -l -a -s
        if [ $? -ne 0 ]; then
            echo "ERROR: Test $i failed!"
            HAS_ERROR=1
        fi
    fi
done

echo ""
echo "========================================"
if [ $HAS_ERROR -eq 1 ]; then
    echo "Tests completed with errors!"
    exit 1
else
    echo "Tests completed!"
fi
