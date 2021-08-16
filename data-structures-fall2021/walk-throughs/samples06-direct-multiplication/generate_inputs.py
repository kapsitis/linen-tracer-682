import random

def main():
    N = 1024
    m = 997
    with open('input03.txt', 'w') as the_file:
        the_file.write('{}\n'.format(N))
        the_file.write('{}\n'.format(m))
        for i in range(0, N):
            line = random.choices(range(0, m), k=N)
            strLine = list(map(lambda x: str(x), line))
            the_file.write(' '.join(strLine))
            the_file.write('\n')
        the_file.write('\n')
        for i in range(0, N):
            line = random.choices(range(0, m), k=N)
            strLine = list(map(lambda x: str(x), line))
            the_file.write(' '.join(strLine))
            the_file.write('\n')





if __name__ == '__main__':
    main()