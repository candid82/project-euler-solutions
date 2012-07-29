# Euler published the remarkable quadratic formula:

# n² + n + 41

# It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

# Using computers, the incredible formula  n²  79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, 79 and 1601, is 126479.

# Considering quadratics of the form:

# n² + an + b, where |a|  1000 and |b|  1000

# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.

from itertools import takewhile, count
from common import is_prime

def get_f(a, b):
    return lambda n: n * n + a * n + b

maxa = maxb = max = 0

for a in range(-999, 1000):
    for b in range(-999, 1000):
        f = get_f(a, b)
        m = sum(1 for i in takewhile(lambda x: x > 0 and is_prime(x), (f(n) for n in count())))
        if m > max:
            max = m
            maxa = a
            maxb = b

print(max, maxa, maxb, maxa * maxb)
