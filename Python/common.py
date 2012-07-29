from math import sqrt
from collections import Counter
from copy import deepcopy
from operator import mul
from functools import reduce


def product(seq):
    return reduce(mul, seq)


def is_prime(n):
    return sum(1 for i in divisors(n)) <= 2

def fib():
    a, b = 0, 1
    yield a
    while True:
        yield b
        a, b = b, a + b

def fac(n):
    r = 1
    for i in range(2, n + 1): r *= i
    return r

def factors(n):
    d = 2
    limit = sqrt(n)
    while d <= limit:
        if n % d == 0:
            yield d
            n = n // d
            limit = sqrt(n)
        else:
            d += 1
    yield n


def merge_with_max(a, b):
    r = deepcopy(a)
    for k, v in iter(b.items()):
        if k in r:
            if v > r[k]:
                r[k] = v
        else:
            r[k] = v
    return r


def factorize(n):
    return dict(Counter(factors(n)))


def is_palindrome(n):
    s = str(n)
    return s == s[::-1]


def all(f, seq):
    for s in seq:
        if not f(s):
            return False
    return True


def take(n, seq):
    seq = iter(seq)
    for i in range(n):
        yield next(seq)


def primes():
    i = 2
    p = []
    while True:
        if all(lambda x: i % x != 0, p):
            yield i
            p.append(i)
        i += 1


def primes_below(n):
    s = [False] * n
    for i in range(2, n):
        if not s[i]:
            yield i
            for j in range(i, n, i):
                s[j] = True


def triangle_numbers():
    i, n = 1, 0
    while True:
        n += i
        yield n
        i += 1


def count(seq):
    c = 0
    for s in seq:
        c += 1
    return c


def divisors(n):
    if n == 1:
        yield 1
        return
    limit = sqrt(n)
    for i in range(1, int(limit) if int(limit) == limit else int(limit) + 1):
        a, b = divmod(n, i)
        if b == 0:
            yield i
            yield a
    if limit == int(limit): yield int(limit)


def sum_of_proper_divisors(n):
    return sum(divisors(n)) - n


def number_of_divisors(n):
    return sum(1 for i in divisors(n))


def max_by(f, seq):
    seq = iter(seq)
    maxk = next(seq)
    maxv = f(maxk)
    for k in seq:
        v = f(k)
        if v > maxv:
            maxk = k
            maxv = v
    return maxk, maxv
