import sympy

def main():
    primes = list()
    n = 10**16
    while len(primes) < 2:
        n += 1
        if sympy.isprime(n):
            primes.append(n)
    print('(p,q)=({},{})'.format(primes[0],primes[1]))


if __name__ == '__main__':
    main()