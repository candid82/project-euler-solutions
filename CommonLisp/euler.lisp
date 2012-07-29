
;#1
(let ((s 0))
  (dotimes (i 100000000)
    (when (or
	   (zerop (mod i 3))
	   (zerop (mod i 5)))
      (incf s i)))
  s)

;#2
(do ((s 0) (a 1 b) (b 1 (+ a b))) ((> b 4000000) s)
  (when (zerop (mod b 2))
    (incf s b)))

;#3
(do ((target 600851475143) (i 2 (1+ i))) ((> i (floor target i)) target)
  (multiple-value-bind (d r) (floor target i)
    (when (zerop r)
      (setf target d)
      (format t "~a~%" i)
      (do () ((/= (mod target i) 0) nil)
	(setf target (floor target i))
	))))

;#4
(do ((i 999 (1- i)))
    ((< i 100) nil)
  (let* ((s (write-to-string i)) (target (parse-integer (format nil "~a~a" s (reverse s)))))
    (when (test target) (format t "~a~%" target))))

(defun test (n)
  (do ((i 100 (1+ i)))
      ((> i 999) nil)
    (multiple-value-bind (d r) (floor n i)
      (when (< d 100) (return-from test nil))
      (when (and (zerop r) (< d 1000)) (return-from test (list d i))))))

;#5
(* 11 13 17 19 2 2 2 2 3 3 5 7)

;#6
(let* ((n  (* 50 (+ 1 100))) (m (* n n)) (s 0))
  (dotimes (i 100)
    (incf s (* (1+ i) (1+ i))))
  (- m s))

;#7
(let* ((N 10001) (primes (make-array N :fill-pointer 0 :element-type 'integer)))
  (do ((i 2 (1+ i))) ((= N (length primes)) (elt primes (1- N)))
    (when (every #'(lambda (x) (/= 0 (mod i x))) primes) (vector-push i primes))))

;#8
(let* ((input (remove #\Newline "73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450")) (digits (map 'vector #'(lambda (x) (parse-integer (string x))) input)))
  (do ((i 4 (+ i 1))
       (max 0))
      ((>= i (length digits)) max)
    (let ((k (* (elt digits i) (elt digits (- i 1)) (elt digits (- i 2)) (elt digits (- i 3)) (elt digits (- i 4)))))
      (when (< max k)
	(setf max k)))))

;#9
(do ((a 3 (1+ a))) ((> a 1000) nil)
  (do ((b (1+ a) (1+ b))) ((> b (* 1/2 (- 1000 a))) nil)
    (let ((c (- 1000 a b)))
      (when (= (+ (* a a) (* b b)) (* c c))
	(format t "~a ~a ~a ~a" a b c (* a b c))))))

;#10
(defun is-prime (x primes)
  (loop for i being the elements of primes
       while (<= (* i i) x)
       never (zerop (mod x i))))

(format t "~a" (let* ((N 100000) (M 2000000) (p 0) (s 0) (primes (make-array N :fill-pointer 0 :element-type 'integer)))
		 (do ((i 2 (1+ i))) ((>= p M) (- s p))
		   (when (is-prime i primes)
		     (vector-push i primes)
		     (setf p i)
		     (incf s i)))))

;#11
(let ((d (list 08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48)) (m (make-array '(20 20))) (max 0))
  (dotimes (i 20)
    (dotimes (j 20)
      (setf (aref m i j) (car d))
      (setf d (cdr d))))
  (dotimes (i 20)
    (dotimes (j 20)
      (let ((h 0) (v 0) (n1 0) (n2 0))
	(when (< j 17)
	  (setf h (* (aref m i j)(aref m i (+ j 1))(aref m i (+ j 2))(aref m i (+ j 3)))))
	(when (< i 17)
	  (setf h (* (aref m i j)(aref m (+ i 1) j)(aref m (+ i 2) j)(aref m (+ i 3) j))))
	(when (and (< i 17) (< j 17))
	  (setf n1 (* (aref m i j)(aref m (+ i 1) (+ j 1))(aref m (+ i 2) (+ j 2))(aref m (+ i 3) (+ j 3)))))
	(when (and (> i 2) (< j 17))
	  (setf n2 (* (aref m i j)(aref m (- i 1) (+ j 1))(aref m (- i 2) (+ j 2))(aref m (- i 3) (+ j 3)))))
	(setf max (max max h v n1 n2)))))
  max)

;#12
(defun divisors (n)
  (loop for i from 1
       while (< (* i i) n)
     when (zerop (mod n i)) sum 2 into r
     finally (return  (if (= (* i i) n)
			  (1+ r)
			  r))))

(loop for i from 1
     for s = i then (+ i s)
   while (<= (divisors s) 500)
     finally (return s))

;#13
(let ((d (list 37107287533902102798797998220837590246510135740250
46376937677490009712648124896970078050417018260538
74324986199524741059474233309513058123726617309629
91942213363574161572522430563301811072406154908250
23067588207539346171171980310421047513778063246676
89261670696623633820136378418383684178734361726757
28112879812849979408065481931592621691275889832738
44274228917432520321923589422876796487670272189318
47451445736001306439091167216856844588711603153276
70386486105843025439939619828917593665686757934951
62176457141856560629502157223196586755079324193331
64906352462741904929101432445813822663347944758178
92575867718337217661963751590579239728245598838407
58203565325359399008402633568948830189458628227828
80181199384826282014278194139940567587151170094390
35398664372827112653829987240784473053190104293586
86515506006295864861532075273371959191420517255829
71693888707715466499115593487603532921714970056938
54370070576826684624621495650076471787294438377604
53282654108756828443191190634694037855217779295145
36123272525000296071075082563815656710885258350721
45876576172410976447339110607218265236877223636045
17423706905851860660448207621209813287860733969412
81142660418086830619328460811191061556940512689692
51934325451728388641918047049293215058642563049483
62467221648435076201727918039944693004732956340691
15732444386908125794514089057706229429197107928209
55037687525678773091862540744969844508330393682126
18336384825330154686196124348767681297534375946515
80386287592878490201521685554828717201219257766954
78182833757993103614740356856449095527097864797581
16726320100436897842553539920931837441497806860984
48403098129077791799088218795327364475675590848030
87086987551392711854517078544161852424320693150332
59959406895756536782107074926966537676326235447210
69793950679652694742597709739166693763042633987085
41052684708299085211399427365734116182760315001271
65378607361501080857009149939512557028198746004375
35829035317434717326932123578154982629742552737307
94953759765105305946966067683156574377167401875275
88902802571733229619176668713819931811048770190271
25267680276078003013678680992525463401061632866526
36270218540497705585629946580636237993140746255962
24074486908231174977792365466257246923322810917141
91430288197103288597806669760892938638285025333403
34413065578016127815921815005561868836468420090470
23053081172816430487623791969842487255036638784583
11487696932154902810424020138335124462181441773470
63783299490636259666498587618221225225512486764533
67720186971698544312419572409913959008952310058822
95548255300263520781532296796249481641953868218774
76085327132285723110424803456124867697064507995236
37774242535411291684276865538926205024910326572967
23701913275725675285653248258265463092207058596522
29798860272258331913126375147341994889534765745501
18495701454879288984856827726077713721403798879715
38298203783031473527721580348144513491373226651381
34829543829199918180278916522431027392251122869539
40957953066405232632538044100059654939159879593635
29746152185502371307642255121183693803580388584903
41698116222072977186158236678424689157993532961922
62467957194401269043877107275048102390895523597457
23189706772547915061505504953922979530901129967519
86188088225875314529584099251203829009407770775672
11306739708304724483816533873502340845647058077308
82959174767140363198008187129011875491310547126581
97623331044818386269515456334926366572897563400500
42846280183517070527831839425882145521227251250327
55121603546981200581762165212827652751691296897789
32238195734329339946437501907836945765883352399886
75506164965184775180738168837861091527357929701337
62177842752192623401942399639168044983993173312731
32924185707147349566916674687634660915035914677504
99518671430235219628894890102423325116913619626622
73267460800591547471830798392868535206946944540724
76841822524674417161514036427982273348055556214818
97142617910342598647204516893989422179826088076852
87783646182799346313767754307809363333018982642090
10848802521674670883215120185883543223812876952786
71329612474782464538636993009049310363619763878039
62184073572399794223406235393808339651327408011116
66627891981488087797941876876144230030984490851411
60661826293682836764744779239180335110989069790714
85786944089552990653640447425576083659976645795096
66024396409905389607120198219976047599490197230297
64913982680032973156037120041377903785566085089252
16730939319872750275468906903707539413042652315011
94809377245048795150954100921645863754710598436791
78639167021187492431995700641917969777599028300699
15368713711936614952811305876380278410754449733078
40789923115535562561142322423255033685442488917353
44889911501440648020369068063960672322193204149535
41503128880339536053299340368006977710650566631954
81234880673210146739058568557934581403627822703280
82616570773948327592232845941706525094512325230608
22918802058777319719839450180888072429661980811197
77158542502016545090413245809786882778948721859617
72107838435069186155435662884062257473692284509516
20849603980134001723930671666823555245252804609722
53503534226472524250874054075591789781264330331690)))
  (format t "~a" (apply #'+ d)))

;#14
(defun next (n)
  (if (evenp n)
      (/ n 2)
      (1+ (* 3 n))))

(defun chain-size (n)
  (if (= n 1)
      1
      (1+ (chain-size (next n)))))

(loop with max = 0 with maxi = 0
   for i from 1 to 1000000
     for c = (chain-size i)
   when (< max c) do (setf max c) (setf maxi i)
     finally (return maxi))

;#15
( print (let* ((n 21) (m (make-array (list n n))))
	  (dotimes (i n)
	    (dotimes (j n)
	      (if (or (= i 0) (= j 0))
		  (setf (aref m i j) 1)
		  (setf (aref m i j) (+ (aref m (1- i) j) (aref m i (1- j)))))))
	  m))

;#16
(loop for c across (write-to-string (expt 2 1000))
   sum (parse-integer (string c)))

;#17
(format t "~r" 900)

;#18
(let* ((n 100) (m (make-array (list n n))) (i 0))
  (each-file-line line "input.txt"
    (loop for x in (split-by-one-space line)
	 for j from 0 do (setf (aref m i j) (parse-integer x)))
    (incf i))
  (loop for i from 1 below n do
       (loop
	  for j upto i
	  when (zerop j) do (incf (aref m i j) (aref m (1- i) j))
	  else when (= i j) do (incf (aref m i j) (aref m (1- i) (1- j)))
	  else do (incf (aref m i j)
			(max (aref m (1- i) j)
			     (aref m (1- i) (1- j))))))
  (apply #'max (loop for i below n collect (aref m (1- n) i))))

;#19
(defun day-of-week (day month year)
    "Returns the day of the week as an integer.
Monday is 0."
    (nth-value
     6
     (decode-universal-time
      (encode-universal-time 0 0 0 day month year 0)
      0)))
(loop for year from 1901 to 2000 sum
     (loop for month from 1 to 12 count (= 6 (day-of-week 1 month
							 year))))

;#21
(loop with n = 10000
   for i from 2 below n
     for j =  (sum-of-divisors i)
   when (and (/= i j) (< j n) ( = (sum-of-divisors j) i)) sum i)

;#22
(defun score (word)
  (loop for x across word sum (- (char-code x) 64)))

(each-file-line line "input.txt"
  (return (loop for word in (sort (split (remove #\" line) #\,) #'string<)
	     for i from 1 sum (* i (score word)))))

;#23
(defun is-abundant (n)
  (> (sum-of-divisors n) n))

(loop with abundant-numbers =  (loop for i from 12 to 28111 if (is-abundant i)
		   collect i)
     with sums = (make-array 28124 :initial-element nil)
     initially (loop for c on abundant-numbers do
		    (loop for k on c
			 for s = (+ (car c) (car k))
			 while (<= s 28123) do (setf (aref sums s) t)))
   for i from 1 to 28123
   unless (aref sums i) sum i)

;#24

(defparameter *i* 1)

(block outer
  (labels ((generate-permutations (s r)
    (if r
	(dolist (x r)
	  (let ((new-s (copy-seq s)))
	    (push x new-s)
	    (generate-permutations new-s  (remove x r))))
	(if (= *i* 1000000)
	  (return-from outer (reverse s))
	  (incf *i*)))))
     (generate-permutations nil (list 0 1 2 3 4 5 6 7 8 9))))

;#26
(defun strip-zeros (s)
  (loop for i from (1- (length s)) downto 0
     while (char= #\0 (char s i))
     finally (return (subseq s 0 (1+ i)))))

(strip-zeros "fsdf00sdfsdfgh000")

(loop for d from 2 below 1000
     for s = (strip-zeros (format nil "~,20f" (/ 1.0 d)))
   if (> (length s) 11) collect s)

(/ 1.0 7.0)

(* 7.0 0.14285715)

;#27
(defun f (a b n)
  (+ (* n n) (* a n) b))

(defun number-of-primes (a b)
  (loop for n from 0
     for k = (f a b n)
     while (and (> k 1) (prime-p k)) sum 1))

(loop with m = 999 with max = 0 with max-product = 0
   for a from (* -1 m) to m do 
     (loop for b from (* -1 m) to m
	for n = (number-of-primes a b) 
	do (when (> n max)
	     (setf max-product (* a b))
	     (setf max n)))
     finally (return max-product))

;#28
(loop for i from 1 to 1000
     for d1 from 2 by 2
     for d2 = 4 then (if (oddp i) (+ d2 4) d2)
   for x1 = 3 then (+ x1 d1)
     for x2 = 5 then (+ x2 d2)
   sum (+ x2 x1))

;#29
(length (remove-duplicates (loop for a from 2 to 100 append
				(loop for b from 2 to 100 collect (expt a b)))))

;#30
(defun sum-of-digits (n)
  (loop for x across (write-to-string n)
     for k = (parse-integer (string x))
       sum (expt k 5)))

(loop for x from 2 to 200000
     if (= x (sum-of-digits x)) sum x)

;#32
(defun pandigital-p (a b)
  (let ((str (format nil "~a~a~a" a b (* a b))))
    (if (/= 9 (length str))
	nil
	(loop with s = (list #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9) for c
	   across str
	   while (find c s) do (setf s (delete c s))
	   finally (return (null s))))))

(apply #'+  (remove-duplicates (loop for a from 1 to 9999 append
				    (loop for b from (1+ a) to 9999
				       if (pandigital-p a b) collect (
				    * a b)))))

;#33
(time (reduce #'*  (loop for a from 11 to 98
		      for a1 = (floor a 10) for a2 = (mod a 10) append
		      (loop for b from (1+ a) to 99
			 for b1 = (floor b 10) for b2 = (mod b 10) for d = (/ a b)
			 when (or (and (= a1 b1) (plusp b2) (= d (/ a2 b2)))
				  (and (= a1 b2) (= d (/ a2 b1)))
				  (and (= a2 b1) (plusp b2) (= d (/ a1 b2)))
				  (and (= a2 b2) (plusp b2) (= d (/ a1
								    b1))))
			 collect d))))

;#34
(defun sum-of-facs (n)
  (loop for d in (digits n) sum (fac d)))

(loop for n from 10 to 9999999
     for s = (sum-of-facs n)
     if (= s n) sum n)

;#35
(defun circular-prime-p (n)
  (loop with d = (number->digits n)
       for i from 1 below (length d)
     for r = (rotate d) then (rotate r)
       always (prime-p (digits->number r))))

(loop for n across (primes-below 1000000)
   count (circular-prime-p n))

;#36
(loop for i from 1 below 1000000 by 2
   if (and (palindrome-p i "d") (palindrome-p i "b")) sum i)

;#37
(with-each-prime prime i
    (print prime)
    (when (> i 10) (return)))

(reduce #'+ (append
	     (loop with pd = (list 2 3 5 7)
		for d1 in pd append
		(loop for d2 in pd
		   for n = (digits->number (list d2 d1))
		   if (prime-p n) collect n))

	     (loop with pd = (list 2 3 5 7)
		for d1 in pd append
		(loop for d3 in pd append
		     (loop for d2 upto 9
			for n = (digits->number (list d3 d2 d1))
			for n1 = (digits->number (list d3 d2))
			for n2 = (digits->number (list d2 d1))
			if (and (prime-p n) (prime-p n1) (prime-p n2)) collect
			n)))

	     (loop with pd = (list 2 3 5 7)
		for d1 in pd append
		(loop for d4 in pd append
		     (loop for d2 upto 9 append
			  (loop for d3 upto 9 
			     for n = (digits->number (list d4 d3 d2 d1))
			     for n1 = (digits->number (list d4 d3 d2))
			     for n2 = (digits->number (list d4 d3))
			     for n3 = (digits->number (list d3 d2 d1))
			     for n4 = (digits->number (list d2 d1))
			     if (and (prime-p n) (prime-p n1) (prime-p n2)
				     (prime-p n3) (prime-p n4)) collect n))))

	     (loop with pd = (list 2 3 5 7)
		for d1 in pd append
		(loop for d6 in pd append
		     (loop for d2 upto 9 append
			  (loop for d3 upto 9 append
			       (loop for d4 upto 9 append
				    (loop for d5 upto 9
				       for n = (digits->number (list d6 d5 d4 d3 d2 d1))
				       for n1 = (digits->number (list d6 d5 d4 d3 d2))
				       for n2 = (digits->number (list d6 d5 d4 d3))
				       for n3 = (digits->number (list d6 d5 d4))
				       for n4 = (digits->number (list d6 d5))
				       for n5 = (digits->number (list d5 d4 d3 d2 d1))
				       for n6 = (digits->number (list d4 d3 d2 d1))
				       for n7 = (digits->number (list d3 d2 d1))
				       for n8 = (digits->number (list d2 d1))
				       if (and (prime-p n) (prime-p n1) (prime-p n2)
					       (prime-p n3) (prime-p n4) (prime-p n5)
					       (prime-p n6) (prime-p n7) (prime-p
									  n8))
		collect n))))))))

;#38
(loop for s in (loop for i from 1 to 9999 append
		    (loop for n from 1
		       for d = (* i n)
		       for s = (write-to-string d) then (concatenate 'string s
								     (write-to-string d))
		       for len = (length s)
		       while (<= len 9)
		       if (and (= len 9) (string= (sort (copy-seq s) #'char<) "123456789"))
		       collect s)) maximize (parse-integer s))

;#39
(loop with n = 1000
   with res = (make-array (1+ n) :initial-element 0)
     with max = 0
     with maxp = 0
   for a from 1 below N do
     (loop for b from a below (- N a)
	for c = (sqrt (+ (* a a) (* b b)))
	for p = (floor (+ a b c))
	if (and (= (floor c) c) (<= p n)) do
	  (incf (aref res p))
	  (when (< max (aref res p))
	    (setf max (aref res p))
	    (setf maxp p)))
   finally (return maxp))

;#41
(loop for p in (permutations (list 1 2 3 4 5 6 7))
   for i = (digits->number p)
   if (prime-p i) maximize i)

(with-call/cc )

;#46

(defun test (n)
  (loop for p across (primes-below n)
     for i = (sqrt (/ (- n p) 2))
       never (= i (floor i))))

(loop for n from 9 by 2
   if (and (not (prime-p n)) (test n)) do (return n))

;#47
(loop for n from 1
   if (and (= 4 (length (remove-duplicates (factors n))))
	   (= 4 (length (remove-duplicates (factors (+ 1 n)))))
	   (= 4 (length (remove-duplicates (factors (+ 2 n)))))
	   (= 4 (length (remove-duplicates (factors (+ 3 n))))))
     do (return n))

;#48
(print (loop for n from 1 to 1000 sum (expt n n)))

;#49
(loop with primes = (remove-if-not #'(lambda (x) (>= x 1000))
				   (primes-below 10000))
     with len = (length primes)
   for i1 upto (- len 3)
   for p1 = (aref primes i1) do
     (loop for i2 from (1+ i1) to  (- len 2)
	  for p2 = (aref primes i2)
	for p3 = (+ p2 (- p2 p1))
	if (and (perm-p (str p1) (str p2))
		(perm-p (str p2) (str p3))
		(find p3 primes)) do
	  (format t "~a ~a ~a~%" p1 p2 p3)))

;#50
(loop with primes = (primes-below 1000000)
     with len = (length primes)
     with maxi = 0
     with maxs = 0
     for start from 0 to (- len 2) do
     (loop for i from start to (- len 1)
	sum (aref primes i) into s
	while (< s 1000000)
	if (and (< maxi (- i start))
		(prime-p s)) do
	  (setf maxi (- i start))
	  (setf maxs s))
     finally (return maxs))

;#52
(loop for i from 1
     for i1 = (str i)
     for i2 = (str (* i 2))
     for i3 = (str (* i 3))
     for i4 = (str (* i 4))
     for i5 = (str (* i 5))
     for i6 = (str (* i 6))
   if (perm-p i1 i2 i3 i4 i5 i6)
     do (return i))

;#53
(loop for n from 1 to 100 sum
     (loop for r from 1 to n
	count (> (ncr n r) 1000000)))

;#97
(mod (1+ (* 28433 (expt 2 7830457))) 10000000000)

;#56
(loop for a from 2 below 100 maximize
     (loop for b from 2 below 100
	  for n = (expt a b)
	  for d = (number->digits n)
	  for s = (reduce #'+ d)
	  maximize s))

;#55
(defun lychrel-p (n)
  (loop for i from 1 below 50
       for m = (+ n (reverse-number n)) then (+ m (reverse-number m))
       never (palindrome-p m "d")))

(loop for n from 10 below 10000 count (lychrel-p n))

;#63
(loop for n from 1 to 95 sum
     (loop for i from 1
	  for h = (expt i n)
	for d = (length (str h))
	while (<= d n)
	  count (= d n)))

;#92
(defun next (n)
  (loop for d in (number->digits n) sum (* d d)))

(defun 89-p (n)
  (loop for i = (next n) then (next i)
       if (= i 1) do (return nil)
       if (= i 89) do (return t)))

(loop for i from 1 below 10000000 count (89-p i))

;#57
(defun expansion (n)
  (if (= n 1)
      1/2
      (/ 1 (+ 2 (expansion (1- n))))))

(loop for i from 1 to 1000
   for e = (1+ (expansion i))
   for n = (str (numerator e))
   for d = (str (denominator e))
     count (> (length n) (length d)))

;#58
(loop with prime-count = 8
   with total-count = 13
     with last = 49
   for layer from 5
     for d = 8 then (+ 2 d)
   while (>= (/ prime-count total-count) 0.1) do
     (dotimes (i 4)
       (incf last d)
       (incf total-count)
       (when (prime-p last) (incf prime-count)))
   finally (return (1- (* 2 (1- layer)))))

;#69
(loop with max = (maxer) for n from 2 to 10000 do
     (funcall max (/ n (totient n)) n)
     finally (return (funcall max 0 0)))

;#99
(let ((d (loop for line in (read-file "base_exp.txt")
	      for list = (split line #\,)
	      for base = (num (first list))
	      for exp = (num (second list))
	      for i from 1 to 10
	      collect (expt base exp))))
  d)
