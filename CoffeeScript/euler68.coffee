e = require "./euler"
_ = (require "./underscore")._

trios = (numbers, middle, last, n) ->
    if numbers.length == 1 then return if numbers[0] + middle + last == n then [[numbers[0], middle, last]] else []
    e.flatten ([a, middle, b] for a in numbers when (a + b + middle == n) and (a != b) for b in numbers)

chains = (numbers, middle, last, n) ->
    if numbers.length == 1 then return ([t] for t in trios(numbers, middle, last, n))
    e.flatten ([t].concat c for c in chains(_.without(numbers, t[0], t[2]), t[2], last, n) for t in trios(numbers, middle, last, n))

toString = (c) -> _.flatten(canonic c).join ""

canonic = (c) ->
    mini = 0
    min = 100 
    for i in [0...c.length]
        if c[i][0] < min
            min = c[i][0]
            mini = i
    return c[mini...c.length].concat c[0...mini]


N = [1,2,3,4,5,6,7,8,9,10]
r = (toString c for c in chains _.without(N, i), i, i, n for i in N for n in [11..25])

console.log (s for s in _.flatten(r) when s.length == 16)

