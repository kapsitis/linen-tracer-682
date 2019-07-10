import math

def fact(n): 
    if n==0:
        return 1
    else:
        return n*fact(n-1)

def is_prime(p): 
    if p <= 1:
        return False
    if p == 2 or p == 3:
        return True
    if p == 4:
        return False 
    result = True
    for k in range(2,math.floor(math.sqrt(p))+1):
        if p % k == 0:
            result = False
            break
    return result
 

# Return the largest power of p that divides n!
def lagr(n,p):
    result = 0
    c = math.floor(n // p)
    while c > 0:
        result = result + c
        c = c // p
    return result


# Return the product of all the numbers [m+1,n]
def prod_all(m,n):
    result = 1
    for k in list(range(m+1,n+1)):
        result = result*k
    return result

# Return list of tuples [(p1,k1),(p2,k2)...] 
def factorize(m): 
    result = list()
    c = m
    p = 2
    k = 0
    while c > 1:
        if c % p == 0:
            c = c // p
            k = k + 1
#            print('    c is %d' % c)
        else: 
            if k>0:
                result.append((p,k))
            p = p + 1
            k = 0
    if k > 0:
        result.append((p,k))
    return result

# Return factorial n! factorization as prime powers
def fact_factorial(n):
    if n == 2:
        return [(2,1)]
    plist = list()
    result = list()
    for p in range(2,n+1):
        if is_prime(p): 
            plist.append(p)
    for pp in plist:
        k = lagr(n,pp)
        result.append((pp,k))
    return result

# Multiply/merge two lists of prime factors [(p1,k1),...]
def mul_merge(l1,l2):
    result = list()
    ll1 = list()
    for elt in l1:
        ll1.append(elt[0])
    ll2 = list()
    for elt in l2:
        ll2.append(elt[0])
    ll = list(set(ll1).union(set(ll2)))
    ll.sort()
    for elt in ll: 
        e1 = lookup(l1,elt)
        e2 = lookup(l2,elt)
        result.append((elt,e1+e2))
    return result   
    
## Given list [(p1,k1),(p2,k2),...]
## find the value for the relevant pair (p,k) and return k
def lookup(lst, p):
#    print(' called lookup(%s,%s)' % (lst,p))
    result = 0
    for pp in lst:
        if p==pp[0]:
            result = pp[1]
            break
    return result
          

# Return smallest prime where l1 is not divisible by l2 (or 0, if they are divisible)
def smallest_witness(l1,l2):
    result = 0
    for pp in l2: 
        p = pp[0]
        k = pp[1]
        ll1 = lookup(l1,p)
        if ll1 < k:
            result = p
            break
    return result


def main():
#    a = 2
#    b = 2
#    a_list = fact_factorial(a)
#    print('a_list is %s' % a_list)
#    b_list = fact_factorial(b)
#    mul_merge(a_list,b_list)
    for a in range(1,10):
        for b in range(1,a+1):
            a_list = fact_factorial(a)
            b_list = fact_factorial(b)
            c_list = mul_merge(a_list,b_list)
            d = prod_all(a,b)+1
            d_list = factorize(d)
            ww = smallest_witness(c_list,d_list)
            print('(%d,%d)-%d ' % (a,b,ww), end='')
        print('')
            



if __name__ == '__main__':
    main()



