# Problem 4
# 16 November 2001

# A palindromic number reads the same both ways. The largest palindrome made from
# the product of two 2-digit numbers is 9009 = 91  99.

# Find the largest palindrome made from the product of two 3-digit numbers.

{isPalindrome, mul} = require "./common.js"
{Stream} = require "./stream.js"

range = Stream.range 100, 999
products = range.crossJoin mul, range
console.log products.filter(isPalindrome).max()
