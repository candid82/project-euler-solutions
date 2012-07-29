# Problem 5
# 30 November 2001

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

{count, factors, merge_with, max} = require "./common.js"
{product} = require "./array.js"
{reduce} = require "./underscore.js"

factorize = (n) -> count factors n

merge_with_max = (a, b) -> merge_with a, b, max

t = reduce (factorize x for x in [2..20]), merge_with_max, {}

console.log product (Math.pow k, t[k] for k of t)
