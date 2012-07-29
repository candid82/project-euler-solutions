# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

N = 1000

for a in range(1, N // 3):
    for b in range(a + 1, (N - a) // 2):
        c = N - a - b
        if a * a + b * b == c * c:
            print(a * b * c)
