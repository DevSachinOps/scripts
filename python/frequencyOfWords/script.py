# -------------------------------------------------------------------------------
# List with proper indentation
# Name: Sachin Sharma
# Python Version: 3.5.6
# -------------------------------------------------------------------------------

import re


def read_file():
    with open("document.txt") as file:
        data = file.read()
        return data


def create_dict(lines):
    content = {}
    raw = re.split('; |\. | |, |\n|\.\n|\.', lines)
    for con in raw:
        if con != '':
            if con not in content:
                content[con] = 1
            else:
                content[con] += 1
    return content


def display(word_dict):
    print('{0:29} {1:29}'.format("Word", "Frequency"))
    for word in word_dict:
        print('{0:15} {1:15d}'.format(word.lower(), word_dict[word]))


def main():
    lines = read_file()
    word_dict = create_dict(lines)
    display(word_dict)


main()
