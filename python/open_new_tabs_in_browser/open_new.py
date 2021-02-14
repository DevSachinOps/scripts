import webbrowser
from time import sleep
import sys

def usage():
    print(' \n Please pass the parameter in proper way ! \
           \n usage open_new.py <URL> <REFRESH_TIME_IN_SECONDS> \n \
          ')
    exit()


def input_validation():
    try:
        if (len(sys.argv) == 3) and isinstance(sys.argv[1], str) and isinstance(int(sys.argv[2]), int):
            return True
        else:
            return False
    except:
        usage()

def main(url, time_to_refresh):
    while True:
        print("Refreshing in", time_to_refresh, "seconds")
        webbrowser.open(url, new=0)
        sleep(int(time_to_refresh))


if __name__ == "__main__":
    input_validation()
    main(sys.argv[1], sys.argv[2])