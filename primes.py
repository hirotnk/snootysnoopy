from itertools import count, islice, takewhile
from math import sqrt


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


def is_prime2(candidate):
    if candidate == 2:
        return True
    if candidate % 2 == 0:
        return False
    half_val = int(sqrt(candidate) + 1)
    for x in range(3, half_val, 2):
        if candidate % x == 0:
            return False
    return True


def prime_gen(start, n):
    primes_after_start = \
        (candidate
         for candidate in count(start)
         if is_prime2(candidate)
         )
    return islice(primes_after_start, n)
