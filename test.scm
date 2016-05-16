(define (vector-swap! v i j)
(let ((tmp (vector-ref v i)))
(vector-set! v i (vector-ref v j))
(vector-set! v j tmp)))
 
(define (next-perm p)
(let* ((n (vector-length p))
	(i (let aux ((i (- n 2)))
	(if (or (< i 0) (< (vector-ref p i) (vector-ref p (+ i 1))))
		i (aux (- i 1))))))
(let aux ((j (+ i 1)) (k (- n 1)))
	(if (< j k) (begin (vector-swap! p j k) (aux (+ j 1) (- k 1)))))
(if (< i 0) #f (begin
	(vector-swap! p i (let aux ((j (+ i 1))) 
		(if (> (vector-ref p j) (vector-ref p i)) j (aux (+ j 1)))))
	#t))))
 
(define (print-perm p)
(let ((n (vector-length p)))
(do ((i 0 (+ i 1))) ((= i n)) (display (vector-ref p i)) (display " "))
(newline)))
 
(define (print-all-perm n)
(let ((p (list n)))
(do ((i 0 (+ i 1))) ((= i n)) (vector-set! p i i))
(print-perm p)
(do ( ) ((not (next-perm p))) (print-perm p))))
 
(print-all-perm '(a e d))
