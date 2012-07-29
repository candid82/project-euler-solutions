log = console.log
_ = require("./underscore")._

isprime = (n) ->
    if n % 2 == 0 then return false
    for i in [3..Math.floor Math.sqrt n]
        if n % i == 0 then return false
    return true
    
isnextprime = (n, primes) ->
    t = Math.sqrt(n)
    for i in primes
        if i > t then return true
        if n % i == 0 then return false
    return true

primes = (n) ->
    p = []
    i = 2
    while p.length < n
        if isnextprime i, p
            p.push i
        i++
    return p

triangle_numbers = (n) -> i * (i + 1) / 2 for i in [1..n]
square_numbers = (n) -> i * i for i in [1..n]
pentagonal_numbers = (n) -> i * (3 * i - 1) / 2 for i in [1..n]
hexagonal_numbers = (n) -> i * (2 * i - 1) for i in [1..n]
heptagonal_numbers = (n) -> i * (5 * i - 3) / 2 for i in [1..n]
octagonal_numbers = (n) -> i * (3 * i - 2) for i in [1..n]

Array.prototype.compare = (m) ->
    return false if m.length != this.length
    for i in [0...this.length] then if m[i] != this[i] then return false
    return true

permutations = (p) ->
    if p.length == 1 then [p] else ([p[i]].concat r for r in permutations p[...i].concat p[i + 1..] for i in [0...p.length]).reduce ((a, b) -> a.concat b), []
    
ispermutation = (a, b) ->
    (c for c in a).sort().compare (c for c in b).sort()
    
totient = (n) ->
    if n == 1 then return 1
    return Math.round(n * _.reduce(((1 - 1 / i) for i of factors n), ((a, b) -> a * b), 1))
        
factors = (n) ->
    if n == 1 then return {"1": 1}
    k = Math.floor Math.sqrt n
    i = 2
    r = {}
    while i <= k
        if n % i == 0
            r[i] = if r[i]? then r[i] + 1 else 1
            n = Math.floor n / i
            k = Math.floor Math.sqrt n
            i = 2
        else
            i++
    r[n] = if r[n] != undefined then r[n] + 1 else 1
    return r
                
flatten = (m) -> _.reduce m, ((a, b) -> a.concat b), []

exports.flatten = flatten
exports.factors = factors
exports.totient = totient
exports.isprime = isprime
exports.primes = primes
exports.triangle_numbers = triangle_numbers
exports.square_numbers = square_numbers
exports.pentagonal_numbers = pentagonal_numbers
exports.hexagonal_numbers = hexagonal_numbers
exports.heptagonal_numbers = heptagonal_numbers
exports.octagonal_numbers = octagonal_numbers
exports.permutations = permutations
exports.ispermutation = ispermutation

