e = require "/Users/roman/Documents/euler/cs/euler"
log = console.log
	
triangle = (i for i in e.triangle_numbers(1000) when i >= 1000 and i <= 9999)
square = (i for i in e.square_numbers(1000) when i >= 1000 and i <= 9999)
pentagonal = (i for i in e.pentagonal_numbers(1000) when i >= 1000 and i <= 9999)
hexagonal = (i for i in e.hexagonal_numbers(1000) when i >= 1000 and i <= 9999)
heptagonal = (i for i in e.heptagonal_numbers(1000) when i >= 1000 and i <= 9999)
octagonal = (i for i in e.octagonal_numbers(1000) when i >= 1000 and i <= 9999)

p = [triangle, pentagonal, square, hexagonal, heptagonal, octagonal]

cycles = (a, b) ->
	("" + a)[-2..] == ("" + b)[..1]
	
findCycle = (p) ->
	for p0 in p[0] then for p1 in p[1] when cycles p0, p1
		for p2 in p[2] when cycles p1, p2
			for p3 in p[3] when cycles p2, p3
				for p4 in p[4] when cycles p3, p4
					for p5 in p[5] when (cycles p4, p5) and (cycles p5, p0)
						return [p0, p1, p2, p3, p4, p5]
	return null
								
for pm in e.permutations p
	r = findCycle pm
	(log r.reduce (a, b) -> a + b) if r
	
