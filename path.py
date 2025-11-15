class Path:
    def __init__(self, path: str):
        if path == "":
            path = "./"
        path = path.replace("\\", "/")
        self.path = path
        self.components = self.path.split("/")
        if self.path.endswith("/"):
            self.components.append("")
        if "." in self.components[-1]:
            self.components.extend(self.components.pop().rsplit(".", 1))
        else:
            self.components.append("")
        if self.components[0] == "":
            self.components.pop(0)
            self.components[0] = "/" + self.components[0]
        self.extension = self.components.pop()
        if len(self.extension) > 0 and not self.extension.startswith("."):
            self.extension = "." + self.extension
        self.file_name = self.components.pop()
        self.path = "/".join(self.components + [self.file_name + self.extension])
        print(self.components, self.file_name, self.extension)

    def both(self) -> None:
        for i in range(len(self.components)):
            if self.components[i] == ".":
                self.components[i] = ""
            elif self.components[i] == ".." and i > 0:
                self.components[i - 1] = ""
                self.components[i] = ""
        while "" in self.components:
            self.components.remove("")
        self.path = "/".join(self.components[1:] + [self.file_name + self.extension])

    def windows(self) -> None:
        if len(self.components) <= 0:
            return
        if len(self.components[0]) == 2 and self.components[0][0] == "/" and self.components[0][1].isalpha():
            self.components[0] = self.components[0][1].upper() + ":"
        elif len(self.components[0]) == 2 and self.components[0][0].isalpha() and self.components[0][1] == ":":
            self.components[0] = self.components[0][0].upper() + ":"
        self.both()
        self.path = self.components[0] + "/" + self.path

    def linux(self) -> None:
        if len(self.components) <= 0:
            return
        if len(self.components[0]) == 2 and self.components[0][0].isalpha() and self.components[0][1] == ":":
            self.components[0] = "/" + self.components[0][0].lower()
        elif len(self.components[0]) == 2 and self.components[0][0] == "/" and self.components[0][1].isalpha():
            self.components[0] = "/" + self.components[0][1].lower()
        self.both()
        self.path = self.components[0] + "/" + self.path

    def change_extension(self, new_extension: str) -> None:
        if not new_extension.startswith(".") and len(new_extension) > 0:
            self.extension = "." + new_extension
        self.both()
        if len(self.components) <= 0:
            return
        self.path = self.components[0] + "/" + self.path

    def change_file_name(self, new_file_name: str) -> None:
        self.file_name = new_file_name
        self.both()
        if len(self.components) <= 0:
            return
        self.path = self.components[0] + "/" + self.path


paths = [
    "C:/Users/Example/Documents/file.txt",
    "/home/user/docs/report.pdf",
    "D:\\Projects\\.\\script.py",
    "../relative/../to/file.md",
    "./another/relative/path/image.png",
    "/var/log/system",
    "abc",
    "./abc",
    "abc.c",
    "abc.",
    "",
]

for i in paths:
    p = Path(i)
    p2 = Path(i)
    print("original:", i)
    print("initial:", p.path)
    p.windows()
    print("windows:", p.path)
    p2.linux()
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
