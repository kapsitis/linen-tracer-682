from functools import reduce

def main():
    astes = [0] # ievieto skaitli, ja ir aste attiecīgā garumā
    for i in range(8095,8101):
        fact = reduce (lambda a,b: a*b, range(1,i+1), 1)
        factS = '{}'.format(fact)
        factLen = len(factS)
        trailZero = 0
        for j in range(1,factLen): 
            if factS[factLen-j] != '0': 
                break
            trailZero += 1
        if astes[-1] != trailZero:
            astes.append(trailZero)
        #print('Factorial {}! ends with {} zeroes'.format(i,trailZero))
    print(astes)
    print('{}'.format(len(astes)))
	


if __name__ == '__main__':
    main()