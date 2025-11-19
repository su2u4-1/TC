from typing import Literal


class Path:
    def __init__(self, path: str, mode: Literal["linux", "windows", "unknown"] = "unknown") -> None:
        self.path = path.replace("\\", "/").strip()
        self.mode = mode
        self.header, self.components = self.path.split("/", 1) if "/" in self.path else ("", self.path)
        self.components, self.file_name = self.components.rsplit("/", 1) if "/" in self.components else ("", self.components)
        self.components = self.components.split("/")
        if self.header == "" and self.path.startswith("/"):
            self.header = "/"
        self.file_name, self.extension = self.file_name.rsplit(".", 1) if "." in self.file_name else (self.file_name, "")
        print(f"header: '{self.header}', components: {self.components}, file_name: '{self.file_name}', extension: '{self.extension}'")

    def normalize(self) -> None:
        normalized_components: list[str] = []
        for component in self.components:
            if component == ".":
                continue
            elif component == "..":
                if len(normalized_components) > 0:
                    normalized_components.pop()
            else:
                normalized_components.append(component)
        self.components = normalized_components
        if self.mode == "windows":
            self.normalize_windows_header()
        elif self.mode == "linux":
            self.normalize_linux_header()
        if len(self.components) > 0 and self.components[0] != "":
            self.path = "/".join([self.header] + self.components + [self.file_name + (f".{self.extension}" if self.extension else "")])
        else:
            self.path = "/".join([self.header, self.file_name + (f".{self.extension}" if self.extension else "")])

    def normalize_windows_header(self) -> None:
        if len(self.header) == 1 and self.header.isalpha():
            self.header = self.header.upper() + ":"
        elif len(self.header) == 2 and self.header[1].isalpha() and not self.header[0].isalpha():
            self.header = self.header[1].upper() + ":"
        elif len(self.header) == 2 and self.header[0].isalpha() and not self.header[1].isalpha():
            self.header = self.header[0].upper() + ":"
        elif self.header == "":
            self.header = "."
        elif self.header == "/":
            self.header = "C:"

    def normalize_linux_header(self) -> None:
        if len(self.header) == 1 and self.header.isalpha():
            self.header = "/" + self.header.lower()
        elif len(self.header) == 2 and self.header[1].isalpha() and not self.header[0].isalpha():
            self.header = "/" + self.header[1].lower()
        elif len(self.header) == 2 and self.header[0].isalpha() and not self.header[1].isalpha():
            self.header = "/" + self.header[0].lower()
        elif self.header == "":
            self.header = "."
        elif self.header == "/":
            self.header = ""

    def change_extension(self, new_extension: str) -> None:
        if new_extension.startswith("."):
            new_extension = new_extension[1:]
        self.extension = new_extension
        self.normalize()

    def change_file_name(self, new_file_name: str, replace_extension: bool = False) -> None:
        if replace_extension and "." in new_file_name:
            new_file_name, new_extension = new_file_name.rsplit(".", 1)
            self.extension = new_extension
        else:
            self.file_name = new_file_name
        self.normalize()


paths = [
    "C:/Users/Example/Documents/file.txt",
    "/home/user/docs/report.pdf",
    "D:\\Projects\\.\\script.py",
    "../relative/../to/file.md",
    "../relative/./to/file.md",
    "./another/relative/path/image.png",
    "/var/log/system",
    "abc",
    "./abc",
    "abc.c",
    "abc.",
    "",
]

for i in paths:
    p = Path(i, mode="windows")
    p2 = Path(i, mode="linux")
    print("original:", i)
    print("initial:", p.path)
    p.normalize()
    print("windows:", p.path)
    p2.normalize()
    print("linux:", p2.path)
    p.change_extension("md")
    print("changed extension (windows):", p.path)
    p2.change_extension("md")
    print("changed extension (linux):", p2.path)
    p.change_file_name("new_file")
    print("changed file name (windows):", p.path)
    p2.change_file_name("new_file")
    print("changed file name (linux):", p2.path)
    print("-----")
