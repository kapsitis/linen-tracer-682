import operator as op
from functools import reduce

def ncr(n, r):
    r = min(r, n-r)
    numer = reduce(op.mul, range(n, n-r, -1), 1)
    denom = reduce(op.mul, range(1, r+1), 1)
    return numer // denom 
    

N = 54
red = 0
black = 0
green = 0
for i in range(0,N+1):
    cc = ncr(N,i)
    print(cc%3, end =' ')
    if (i+1) % 20 == 0:
        print()
    if cc % 3 == 0:
        red += 1
    elif cc % 3 == 1:
        black += 1
    else:
        green += 1


print('For N={} Pascal Triangle colors ({},{},{})'.format(N,red,black,green))


