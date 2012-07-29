(defun str (n)
  (write-to-string n))

(defun num (s)
  (parse-integer s))

(defun vec (&optional (size 100) (init-elt nil))
  (make-array size :fill-pointer 0 :adjustable
	      t :initial-element init-elt))

(defun rotate (list)
  (append (last list) (butlast list)))

(defun next-prime-p (x primes)
  (loop with s = (floor (sqrt x))
     for i across primes
     while (<= i s)
     never (zerop (mod x i))))

(defun primes-below (n)
  (let ((primes (vec (floor n 2))))
    (loop for i from 2 below n if (next-prime-p i primes) do
  (vector-push-extend i primes)
	 finally (return primes))))

(defun prime-p (n)
  (loop with s = (floor (sqrt n))
     for i from 2 to s never (zerop (mod n i))))

(defun pandigital9-p (n)
  (string= (sort (str n) #'char<) "123456789"))

(defun permutations (list)
  (let ((res nil))
    (labels ((perm (s r)
	       (if r
		   (dolist (x r)
		     (let ((new-s (copy-seq s)))
		       (push x new-s)
		       (perm new-s  (remove x r))))
		   (push s res))))
      (perm nil list)
      res)))

(defun fac (n)
  (if (zerop n)
      1
      (* n (fac (1- n)))))

(defun number->digits (n)
  (loop for c across (str n) collect (num (string c))))

(defun digits->number (list)
  (num (format nil "~{~a~}" list)))

(defun sum-of-divisors (n)
  (if (= 1 n)
      0
      (loop for i from 2
	 while (< (* i i) n)
	 when (zerop (mod n i)) sum (+ (/ n i) i) into r
	 finally (return  (if (= (* i i) n)
			      (+ r i 1)
			      (+ r 1))))))

(defun split (string c)
  (loop for i = 0 then (1+ j)
     as j = (position c string :start i)
     collect (subseq string i j)
     while j))

(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

(defmacro each-file-line (line filename &body body)
  (with-gensyms (f)
    `(with-open-file (,f ,filename)
     (do ((,line (read-line ,f nil) (read-line ,f nil))) ((not ,line))
       ,@body))))

(defmacro each-prime (prime i &body body)
  (with-gensyms (primes)
    `(let ((,primes (make-array 100 :fill-pointer 0 :element-type 'integer :adjustable t)))
    (loop with ,i = 0 for ,prime from 2
       if (next-prime-p ,prime ,primes) do
	 (progn
	   (incf ,i)
	   (vector-push-extend ,prime ,primes)
	   ,@body)))))

(defun factors (n)
  (when (> n 1)
    (let ((limit (1+ (isqrt n))))
      (do ((i 2 (1+ i))) ((> i limit) (list n))
        (when (zerop (mod n i))
          (return-from factors
            (cons i (factors (/ n i)))))))))

(defun perm-p (s1 s2 &rest r)
  (let ((sorted  (sort s1 #'char<)))
    (and (string= sorted (sort s2 #'char<))
	   (or (null r)
	       (every #'(lambda (s) (string= (sort s #'char<) sorted)) r)))))

(defun ncr (n r)
  (/ (fac n) (* (fac r) (fac (- n r)))))

(defun palindrome-p (n base)
  (loop with s = (format nil (concatenate 'string "~" base) n)
       with len = (length s)
       for i below (floor (/ len 2))
       always (char= (char s i) (char s (- len i 1)))))

(defun reverse-number (n)
  (num (reverse (str n))))

(defun make-set (&optional list)
  (let ((h (make-hash-table :test 'equal)))
    (dolist (el list)
      (setf (gethash el h) t))
    h))

(defun add (el set)
  (setf (gethash el set) t)
  set)

(defun in (el set)
  (multiple-value-bind (value present) (gethash el set) present))

(defun r-primes (n)
  (loop with non-primes = (make-set)
     for i from 2 below n
     unless (in i non-primes)
     if (plusp (mod n i)) collect i into p
     else do
       (loop for j from 1
	  for k = (* i j)
	  while (< k n) do (add k non-primes))
  finally (return (push 1 p))))

(defun totient (n)
  (loop with non-primes = (make-set)
     for i from 2 below n
     unless (in i non-primes)
     if (plusp (mod n i)) count 1 into r
     else do
       (loop for j from 1
	  for k = (* i j)
	  while (< k n) do (add k non-primes))
  finally (return (1+ r))))

(defun maxer ()
  (let ((max-value nil) (param nil))
    (lambda (v p)
      (cond ((or (not max-value) (< max-value v))
	     (setf max-value v)
	     (setf param p))
	    (t param)))))

(defun read-file (filename)
    (with-open-file (f filename)
      (loop for line = (read-line f nil)
	   while line collect line)))


