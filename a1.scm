;; function that give all permutations in a list
;; e.g. (perm '(a e d)) will give ((a e d) (a d e) (e a d) (e d a) (d e a) (d a e))
(define (perm word)
  (cond ((null? word) '())
	((null? (cdr word)) (list word))
	(else ;; for each item in the list, extract it and perm the remaining items
	  (let joint ((left '()) (middle (car word)) (right (cdr word)))
	    (append
	      (map (lambda (x) (cons middle x)) (perm (append left right)))
	      (if (null? right) '()
		(joint (cons middle left) (car right) (cdr right))))))))

;; function that ouput the permutations line by line
(define (output word)  
  (if (null? word)
    (begin
    	(display #f)
    	(newline))
    (begin
    	(display(car word)) 
    	(newline) 
	(output (cdr word))))) ;; recursively output for each item

;; function that pass the permutation list to (output word)
(define (permute word) 
  (output(perm word)))

(define dictionary '(a act ale at ate cat eat etc tea))

;; convert list of symbols to string
(define (convert word)
  (string->symbol
   (apply string-append
          (map symbol->string word))))

;; check that whether a word exists in the dictionary.
;; if yes, display it
;; if no, do nothing
(define (check dictionary word)
  (cond 
    ((null? dictionary) (begin '())) ;; if no, do nothing
    ((equal? (cons (car dictionary) '()) (list (convert word))) (begin (display word) (newline) (check (cdr dictionary) word))) ;; if yes, display it 
    ((not(equal? (cons (car dictionary) '()) (list (convert word)))) (begin (check (cdr dictionary) word))))) ;; recursively check for every words in dictionary

;; pass every permutation one by one to (check dictionary word)
(define (checkperm dictionary word)
  (if (null? word)
    (begin
      (display #f)
      (newline))
    (begin
      (check dictionary (car word)) ;; check the first permutation
      
      (checkperm dictionary (cdr word)) ;; recursively check for the rest
      )))

;; pass the permutation list to (checkperm dictionary word)
(define (anagram dictionary word)
  (checkperm dictionary (perm word)))

;; test case
(permute '(a a a))
;;(permute '())
;;(permute '(a))
;;(anagram dictionary '(a e t))
;;(anagram dictionary '(a t c))
;;(anagram dictionary '(a))
;;(anagram '() '(a e t))
