from itertools import count

def primes(n):
    return [
        x for x in range(1, n)
        if is_prime(x)
    ]


def factor(n):
    return [
        x for x in range(1,n)
        if n % x == 0
    ]

def is_prime(n):
    return factor(n) == [1]
