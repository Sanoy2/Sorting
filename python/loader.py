def print_content(path: str):
    file = open(path, "r")
    content = file.read()
    file.close()
    print(content)


def load_to_array(path:str) -> []:
    result = []
    line = ""
    number = 0
    file = open(path, "r")
    for line in file:
        number = int(line)
        result.append(number)

    file.close()
    return result

