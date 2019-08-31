import math


def main():
    x = int(1)
    max_x = int(50)
    max_y = int(50)
    while x <= max_x: 
        #print("Processing x=%d" % x)
        y = x
        while (y <= max_y): 
            exp3 = 7*x*x - 13*x*y + 7*y*y
            root3 = math.floor(exp3 ** (1. / 3))
            dd = (exp3 - root3**3) % 9
            print('%3d ' % dd,end='')
            y = y+1
        x = x+1
        print('')

if __name__ == '__main__':
   main()


