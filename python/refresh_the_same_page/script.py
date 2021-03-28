from time import sleep
import sys
import random
from selenium import webdriver

def usage():
    print(' \n Please pass the parameter in proper way ! \
          \n This will pick random time in between of given time and then refresh \n \
           \n usage open_new.py <URL> <START_TIME_IN_SECONDS>  <END_TIME_IN_SECONDS> \n \
          ')
    exit()


def input_validation():
    try:
        if (len(sys.argv) == 4) and isinstance(sys.argv[1], str) and isinstance(int(sys.argv[2]), int) and isinstance(int(sys.argv[3]), int):
            return True
        else:
            return False
    except:
        usage()

def main(url, start_time, end_time):
    driver = webdriver.Chrome()
    driver.get(url)
    while True:
        refresh_time = int(random.randrange(start_time, end_time))
        print("Refreshing in", refresh_time, "seconds")
        sleep(refresh_time)
        driver.refresh()


if __name__ == "__main__":
    input_validation()
    main(sys.argv[1], int(sys.argv[2]), int(sys.argv[3]))




