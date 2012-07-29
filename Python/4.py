# Problem 4
# 16 November 2001

# A palindromic number reads the same both ways. The largest palindrome made from
# the product of two 2-digit numbers is 9009 = 91  99.

# Find the largest palindrome made from the product of two 3-digit numbers.

from common import is_palindrome

products = (a * b for a in range(100, 1000) for b in range(100, 1000))

print(max(x for x in products if is_palindrome(x)))
