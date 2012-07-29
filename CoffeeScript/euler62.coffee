e = require "/Users/roman/Documents/euler/cs/euler"

N = 12
min = Math.ceil Math.pow (Math.pow 10, (N - 1)), (1 / 3)
max = Math.floor Math.pow ((Math.pow 10, N) - 1), (1 / 3)

sorted_digits = (n) ->
	(c for c in ("" + n)).sort().join ""
	
h = {}
for i in [min..max]
	cube = i * i * i
	n = sorted_digits cube
	if h[n] == undefined then h[n] = [1, cube] else h[n][0]++
	
console.log key, value for key, value of h when value[0] == 5
					

	