import math
# https://betterprogramming.pub/advanced-sorting-in-python-using-lambdas-and-custom-functions-410b5780fb07

def main():
    tenFactorial = 1*2*3*4*5*6*7*8*9*10
    fixes = {'11':0, '13':0, '17':0, '19':0, '23':0, '29':0, '31':0, '37':0, '41':0, '43':0, '47':0, 
             '53':0, '59':0, '61':0, '67':0, '71':0, '73':0, '79':0, '83':0, '89':0, '97':0}
    subTotals = {'1':0, '11':0, '13':0, '17':0, '19':0, '23':0, '29':0, '31':0, '37':0, '41':0, '43':0, '47':0, 
             '53':0, '59':0, '61':0, '67':0, '71':0, '73':0, '79':0, '83':0, '89':0, '97':0}
    
    total = 0
    for ii in range(1,101):
        total = total + math.gcd(tenFactorial,ii)
        for key in fixes:
            if ii % int(key) == 0:
                fixes[key] = fixes[key] + ((ii // int(key)) - ii)
            else:
                subTotals['1'] += 
    print(total)
    uu = 0
    for key in fixes:
        uu = uu + fixes[key]
        print('{}.{}'.format(key, fixes[key]))
    print('uu = {}'.format(uu))

if __name__=='__main__':
    main()
