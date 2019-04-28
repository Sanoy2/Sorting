import sys

import loader

def main():

    number_of_ints = int(sys.argv[1])
    number_of_files = int(sys.argv[2])
    directory_with_files = sys.argv[3]
    sort_on = sys.argv[4].lower() == 'true'

    # print("number_of_ints: " + number_of_ints.__str__())
    # print("number_of_files: " + number_of_files.__str__())
    # print("directory_with_files: " + directory_with_files)
    # print("sort_on: " + sort_on.__str__())

    i = 0
    arr = []
    path = ""
    while(i < number_of_files):
        path = "{0}{1}/{2}.txt".format(directory_with_files, number_of_ints, i)
        arr = loader.load_to_array(path)
        i = i + 1
        if(sort_on):
            arr.sort()

if __name__ == "__main__":
    main()