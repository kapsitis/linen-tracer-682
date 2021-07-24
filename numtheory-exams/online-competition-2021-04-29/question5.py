def main():
    total = 0
    for i in range(1,2022):
        s = '{0:b}'.format(i)
        d0 = s.count('0')
        d1 = s.count('1')
        if d1 > d0:
            total = total + 1
    print('total = {}'.format(total))


if __name__ == '__main__':
    main()