#lang racket
(define evens '(2 4 6 8))
(define odds '(1 3 5 7 9))

(first odds)
(rest odds)
(first (rest odds))
(rest evens)
(rest (rest evens))
(first (rest (rest evens)))
(first (rest (rest (rest odds))))
(last odds)
(rest (reverse evens))
(reverse (rest evens))
(reverse (rest (rest odds)))
(rest (reverse odds))


;; (7 5 3)

(rest (reverse (rest odds)))


(define my-third (λ (n)
                  (first (rest (rest n)))
                   ))

(define my-last (λ (n)
                  (last n)
                   ))

(define show-list (λ (n)
                  (list (first n))
                   ))

(define dfunction (λ (n)
                  (list (length n) (first n))
                   ))

(define LHrest (λ (n)
                  (list (reverse (rest (reverse n))))
                   ))

(define two-lists (λ (n m)
                  (append (reverse n) (reverse m))
                   ))

;not ready
(define cons-length (λ (n)
                  (list (append (append (length n))))
                   ))

(define silly (λ (n)
                (append n (rest (reverse n)))
                ))

(define palindrome (λ (n)
                     (cond
                     (equal? n (reverse n) "palindrome")
                     (#t "non palindrome")
                     )))

(define palindrome2 (λ (x)
              (cond
                ((equal? x (reverse x)) x)
                ("non palindrome"))
                ))

(define bag1 '(apples (grapes) (melon cabbage)))
(define bag2 '(chocolate (cream cakes) sugar))

(define weight (λ (n)
                 (cond
                   ((not (number? n)) "numbers only")
                   ((> n 90) "heavy")
                  ((> n 60) "normal")
                   ((< n 60) "light")
                   ((zero? n) "wrong number")
                   ((string? n) "wrong number")
                   ((list? n) "wrong number")
                   )))
;list->list/string/string
(define sob (λ (n)
              (cond
                ((list? n) (list (first n) (last n)))
                ((number? n) "not list")
                ((string? n) "not list")
                )))
;number->number
(define exc (λ (n)
              (cond
                ((number? n) (* n n))
                (n))))
;list->list->list
(define exd (λ (x y)
              (cond
                ((list? x) (append x y))
                ((cons x y))
                )))

;number->number->number->boolean
(define exe (λ (x a b)
              (cond
                ((and (< a x) (< x b)) "true")
                ("false")
                )))
"------- car - first  |  cdr - rest  -------"
(car '(1 2 3))
(cdr '(1 2 3 4))
"------- cadr - second  -------"
(cadr '(1 2 3))

;recursive function
;number->list->list
(define my-insert (λ  (i sl)
                    (cond
                      ((empty? sl) (list i))
                      ((<= i (first sl)) (cons i sl))
                      (#t (cons (first sl) (my-insert i (rest sl))))
                      )))


(define	my-merge (λ (ul sl)	
    (cond
       ((empty?	ul)sl)	
 (#t (my-insert (first ul) (my-merge (rest ul) sl))))))

	