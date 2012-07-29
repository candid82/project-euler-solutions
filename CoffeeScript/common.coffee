_ = require "./underscore.js"
{Stream} = require "./stream.js"

exports.primesUnder = (n) ->
    r = []
    s = (false for i in [1..n])
    for i in [2..n - 1]
        if not s[i]
            r.push i
            for j in [i..n - 1] by i
                s[j] = true
    r

exports.int = int = (s) -> parseInt s, 10

exports.merge_with = merge_with = (a, b, f) ->
    r = _.clone a
    for key of b
        if key of r then r[key] = f a[key], b[key] else r[key] = b[key]
    r

exports.max = max = (a, b) -> if a > b then a else b

exports.reverse = reverse = (n) ->
    result = 0
    while n > 0
        digit = n % 10
        result = result * 10 + digit
        n = Math.floor(n / 10)
    result

exports.reducer = reducer = (f) ->
    add: (a) -> @value = if @value == undefined then a else f @value, a

exports.maximizer = maximizer = -> reducer (a, b) -> if a > b then a else b

exports.isPalindrome = isPalindrome = (n) ->
    s = "" + n
    len = s.length
    for i in [0..Math.floor(len / 2)]
        return false if s.charAt(i) != s.charAt(len - i - 1)
    true

exports.count = count = (array) ->
    r = {}
    for i in array
        if i of r then r[i] += 1 else r[i] = 1
    r

exports.last = last = (list) ->
    list[list.length - 1]

exports.plus = plus = (a, b) -> a + b
exports.mul = mul = (a, b) -> a * b

exports.sum = (list) -> _.reduce list, plus, 0

exports.factors = factors = (n) ->
    [r, d, limit] = [[], 2, Math.sqrt n]
    while d <= limit
        if n % d == 0
            r.push d
            n = Math.floor(n / d)
            limit = Math.sqrt n
        else
            d++
    r.push n
    r
