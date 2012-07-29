# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

from common import sum_of_proper_divisors, divisors

N = 28123

def is_abundant(n):
    return sum_of_proper_divisors(n) > n

abundant_numbers = [n for n in range (12, N + 1) if is_abundant(n)]
abundant_set = set(abundant_numbers)

def ok(n):
    half = n // 2
    for a in abundant_numbers:
        if a > half: return False
        if n - a in abundant_set: return True
    return False

print(sum(n for n in range(1, N + 1) if not ok(n)))