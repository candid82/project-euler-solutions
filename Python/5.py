# Problem 5
# 30 November 2001

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

from common import factorize, merge_with_max, product
from functools import reduce

t = reduce(merge_with_max, (factorize(x) for x in range(2, 21)))

print(product(k ** v for k, v in t.items()))
