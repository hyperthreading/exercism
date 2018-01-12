def is_isogram(string):
    existence = dict()
    for char in string:
        if is_ignored(char):
            continue
        if not is_alphabet(char):
            raise Exception("Such character is not allowed", char)

        char = char.lower()

        if not existence.get(char, False):
            existence[char] = True
        else:
            return False

    return True

def is_ignored(char):
    if char == " " or char == "-":
        return True

    return False

def is_alphabet(char):
    if ord('a') <= ord(char.lower()) <= ord('z'):
        return True

    return False
