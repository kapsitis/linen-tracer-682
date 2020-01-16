import math 

def primeFactors(n): 
    result = list()      
    # Print the number of two's that divide n 
    while n % 2 == 0: 
        result.append(2) 
        n = n // 2
          
    # n must be odd at this point 
    # so a skip of 2 ( i = i + 2) can be used 
    for i in range(3,int(math.sqrt(n))+1,2): 
          
        # while i divides n , print i ad divide n 
        while n % i== 0: 
            result.append(i)
            n = n // i 
              
    # Condition if n is a prime 
    # number greater than 2 
    if n > 2: 
        result.append(n)
    return result

def f(n,verbose):
    result = n**4 + n**2 + 1
    if verbose:
        print('f({}) = {}'.format(n,result))
    return result

def largestDiv(n,verbose):
    m = f(n,verbose)
    all_factors = primeFactors(m)
    if verbose:
        print('all_factors for f({}) = {}'.format(n,all_factors))
    return all_factors[-1]

def main():
    print('Dummy')
    murr = list()
    prev = -1
    
    largestDiv(3,True)
    largestDiv(4,True)

    largestDiv(6,True)
    largestDiv(7,True)

    largestDiv(8,True)
    largestDiv(9,True)
    
    for n in range(1,100):
        curr = largestDiv(n,False)
        if curr == prev:
            print('Found n = {}.{}'.format(n,curr))
        murr.append(curr)
        prev = curr                
    #print('murr = {}'.format(murr))

     

if __name__ == '__main__':
    main()