e = require "/Users/roman/Documents/euler/cs/euler"
log = console.log

fit = (a, b) -> (e.isprime parseInt("" + a + b)) and (e.isprime parseInt("" + b + a))

N = 1060

p = e.primes N + 1

f = () ->
	for i1 in [0..N]
	    p1 = p[i1]
	    for i2 in [i1 + 1..N]
	        p2 = p[i2]
	        if not (fit p1, p2) then continue
	        for i3 in [i2 + 1..N]
	            p3 = p[i3]
	            if not ((fit p1, p3) and (fit p2, p3)) then continue
	            for i4 in [i3 + 1..N]
	                p4 = p[i4]
	                if not ((fit p1, p4) and (fit p2, p4) and (fit p3, p4)) then continue
	                for i5 in [i4 + 1..N]
	                    p5 = p[i5]
	                    if not ((fit p1, p5) and (fit p2, p5) and (fit p3, p5) and (fit p4, p5)) then continue
	                    log p1, p2, p3, p4, p5
	                    return

f()