# A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

# 1/2 =   0.5
# 1/3 =   0.(3)
# 1/4 =   0.25
# 1/5 =   0.2
# 1/6 =   0.1(6)
# 1/7 =   0.(142857)
# 1/8 =   0.125
# 1/9 =   0.(1)
# 1/10    =   0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

# Find the value of d  1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

from common import max_by
from decimal import *

getcontext().prec = 2000

def is_cycle(target, string, start):
    length = len(target)
    limit = len(string)
    for i in range(start, limit, length):
        if i + length > limit: return True
        t = string[i:i + length]
        if t != target: return False
    return True

def find_cycle(string):
    for start in range(len(string)):
        for i in range(start + 1, (len(string) - start) // 2 + 1):
            target = string[start:i]
            if is_cycle(target, string, start): return target
    return None

def cycle_len(n):
    cycle = find_cycle(str(Decimal(1) / Decimal(n))[2:])
    r = len(cycle) if cycle else 0
    return r

print(max_by(cycle_len, range(2, 1000)))


