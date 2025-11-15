# TC (Test Compiler)

TC is a simple compiler project created for the purpose of learning the principles of compilers. It includes a basic lexer, a parser, and is designed with an extensible structure.

## Prerequisites

Before you begin, ensure that `gcc` is installed in your development environment. You can check this by running the following command in your terminal or command prompt:

```bash
gcc --version
```

If it is not installed, please install it according to your operating system.

## Notes

*   This project is primarily developed using the C17 (GNU17) standard.
*   I do not have a macOS device, so it has not been tested on macOS. It has also not yet been tested in a Linux environment.

## How to Build

This project is compiled using `gcc`.

### Windows

In a Windows environment, you can build the project by directly running the `build.bat` batch file located in the `tools` folder:

```batch
.\tools\build.bat
```

Upon successful compilation, an executable file named `program.exe` will be generated in the `build` folder.

### Linux / macOS

On Linux or macOS, please execute the `build.sh` script found in the `tools` folder:

```bash
./tools/build.sh
```

Similarly, a successful compilation will produce an executable file named `program` in the `build` folder.

## How to Test

The `test` folder contains several test cases. You can automatically run all tests by executing the `run.bat` script located in the root directory.

```batch
.\test\run.bat
```

This script will first build the project and then use the compiled program to execute the various test cases in the `test` folder, comparing the output against expected results.

## Usage

You can run the compiled program directly, specifying the source code file you wish to compile.

```
Usage: <executable_file> <source_file> [output_path] [options]
```

**Parameters:**

*   `<executable_file>`: The compiled executable (`build/program.exe` or `build/program`).
*   `<source_file>`: The TC source file you want to compile (e.g., `test/test1/test1.tc`).
*   `[output_path]`: (Optional) The directory where output files will be saved. If not specified, it defaults to the current directory.
*   `[options]`: (Optional) Compilation flags.

**Available Options:**

*   `-o`: Output the compiled result (not yet implemented).
*   `-a`: Output the Abstract Syntax Tree (AST) to `output_path/file_name.ast`.
*   `-l`: Output the lexer result to `output_path/file_name.lex`.
*   `-s`: Output the symbol table to `output_path/file_name.sym`.
*   `-h`: Display this help information.

**Example:**

```bash
# Perform lexical analysis and save the output to the test/test1/ directory
./build/program.exe ./test/test1/test1.tc ./test/test1/ -l
```

## File Structure

```
tc/
├── build/              # Build output directory
|   ├── program.exe     # Compiled executable
├── include/            # Header files
├── src/                # Source code
|   ├── tc_err.c        # Error handling
|   ├── tc_file.c       # Path handling
|   ├── tc_lexer.c      # Lexer
|   ├── tc_lib.c        # Global data and standard library
|   ├── tc_main.c       # Main function and entry point
|   ├── tc_mem.c        # Memory management
|   ├── tc_parser.c     # Parser
|   └── tc_type.c       # Type collections
├── test/               # Test cases
|   ├── test1/          # Test case directory
|   |   ├── test1.tc    # Test source code
|   |   └── test1.lex   # Expected lexer output
|   ...                 # More test case directories
|   └── run.bat         # Test runner script, runs all tests
├── tools/
|   ├── build.sh        # Build script for Linux/macOS
|   └── build.bat       # Build script for Windows
├── .gitignore          # Git ignore file
├── grammar.ebnf        # Grammar file in EBNF format
└── README.md           # This file
```

---

# TC (Test Compiler)

TC 是一個為了學習編譯器原理而建立的簡易編譯器專案。它包含了一個基本的詞法分析器、語法分析器，並設計了可擴充的結構。

## 環境需求

在開始之前，請確保您的開發環境中已安裝 `gcc`。您可以透過在終端機或命令提示字元中執行以下指令來檢查：

```bash
gcc --version
```

如果未安裝，請根據您的作業系統進行安裝。

## 注意事項

*   本專案主要使用 C17 (GNU17) 標準進行開發。
*   我沒有 macOS 設備，所以沒有測試過它是否能在 macOS 上運作。目前也尚未在 Linux 環境下進行測試。

## 如何建置

本專案使用 `gcc` 進行編譯。

### Windows

在 Windows 環境下，您可以直接執行 `tools` 資料夾中的 `build.bat` 批次檔來建置專案：

```batch
.\tools\build.bat
```

編譯成功後，會在 `build` 資料夾下產生 `program.exe` 執行檔。

### Linux / macOS

在 Linux 或 macOS 環境下，請執行 `tools` 資料夾中的 `build.sh` 指令碼：

```bash
./tools/build.sh
```

同樣地，編譯成功後會在 `build` 資料夾下產生 `program` 執行檔。

## 如何測試

專案的 `test` 資料夾中包含了一些測試案例。您可以透過執行根目錄下的 `run.bat` 來自動執行所有測試。

```batch
.\test\run.bat
```

此指令碼會先自動建置專案，然後用編譯好的程式去執行 `test` 資料夾中的各個測試案例，並比對輸出結果。

## 使用方法

您可以直接執行編譯好的程式，並指定要編譯的原始碼檔案。

```
Usage: <executable_file> <source_file> [output_path] [options]
```

**參數說明:**

*   `<executable_file>`: 編譯後產生的執行檔 (`build/program.exe` 或 `build/program`)。
*   `<source_file>`: 您要編譯的 TC 原始碼檔案 (例如 `test/test1/test1.tc`)。
*   `[output_path]`: (可選) 指定輸出檔案的存放路徑。如果未指定，預設為當前目錄。
*   `[options]`: (可選) 編譯選項。

**可用選項:**

*   `-o`: 輸出編譯結果 (目前未實作)。
*   `-a`: 將 AST (抽象語法樹) 輸出到 `output_path/file_name.ast`。
*   `-l`: 將詞法分析結果輸出到 `output_path/file_name.lex`。
*   `-s`: 將符號表輸出到 `output_path/file_name.sym`。
*   `-h`: 顯示說明資訊。

**範例:**

```bash
# 執行詞法分析並將結果輸出到 test/test1/ 資料夾
./build/program.exe ./test/test1/test1.tc ./test/test1/ -l
```

## 檔案結構

```
tc/
├── build/              # 建置輸出目錄
|   ├── program.exe     # 編譯後的執行檔
├── include/            # 標頭檔
├── src/                # 原始碼
|   ├── tc_err.c        # 錯誤處理
|   ├── tc_file.c       # 路徑處理
|   ├── tc_lexer.c      # 詞法分析器
|   ├── tc_lib.c        # 全域資料與標準函式庫
|   ├── tc_main.c       # 主函式與進入點
|   ├── tc_mem.c        # 記憶體管理
|   ├── tc_parser.c     # 語法分析器
|   └── tc_type.c       # 型別集合
├── test/               # 測試案例
|   ├── test1/          # 測試案例目錄
|   |   ├── test1.tc    # 測試原始碼
|   |   └── test1.lex   # 預期的詞法分析器輸出
|   ...                 # 更多測試案例目錄
|   └── run.bat         # 測試執行腳本，執行所有測試
├── tools/
|   ├── build.sh        # Linux/macOS 建置腳本
|   └── build.bat       # Windows 建置腳本
├── .gitignore          # Git 忽略檔案
├── grammar.ebnf        # EBNF 格式的文法檔案
└── README.md           # 本檔案
```
