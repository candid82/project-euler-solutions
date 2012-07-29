# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
# how many letters would be used?


# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two)
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and"
# when writing out numbers is in compliance with British usage.

d1 = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
d2 = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
d3 = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

def pronounce(n):
    if n < 10: return d1[n - 1]
    if n != 10 and n < 20: return d2[n - 11]
    if n < 100:
        a, b = divmod(n, 10)
        return d3[a - 1] + (" " + d1[b - 1] if b else "")
    if n < 1000:
        a, b = divmod(n, 100)
        return d1[a - 1] + " hundred" + (" and " + pronounce(b) if b else "")
    return "one thousand"

print(len("".join([pronounce(n) for n in range(1, 1001)]).replace(" ", "")))
