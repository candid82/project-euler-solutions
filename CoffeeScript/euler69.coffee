e = require "./euler"
_ = (require "./underscore")._

max = 0
maxi = 1
for i in [1..1000000]
	m = i / e.totient i
	if m > max
		max = m
		maxi = i

console.log max, maxi
