# Problem 2
# 19 October 2001

# Each new term in the Fibonacci sequence is generated by adding the previous two terms.
# By starting with 1 and 2, the first 10 terms will be:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# By considering the terms in the Fibonacci sequence whose values do not exceed four million,
# find the sum of the even-valued terms.

from common import fib
from itertools import takewhile
print(sum(takewhile(lambda x: x <= 4000000, (x for x in fib() if x % 2 == 0))))
