#lang racket/gui
(pair? 42)
(pair? '(1.2))
(pair? (cons 'a 'b))

;car - fist element , cdr - rest of the list
(car (cons 1 2))
(cdr (cons 1 2))

(cons 1 (cons 1 2))
;dot
(println "dot")
(car (cons 1 (cons 1 2)))
(cdr (cons 1 (cons 1 2)))
;sequence
(println "sequence")
(cons 1 (cons 5 (cons 2 '())))
;ex1
;(5 4 ("a" "b") 2 1)
(cons 5 (cons 4 (cons '("a" "b") (cons 2 (cons 1 '())))))
;(5 ((2 1 ) 3))
(cons 5 (cons (cons (cons 2 (cons 1 '())) (cons 3 '())) '()))
;(("Mary" "Bob") ("Alice" "John") "Sara")
(cons (cons "Mary " (cons "Bob" '())) (cons (cons "Alice " (cons "John" '())) (cons "Sara" '())))
;(5 (4 (3 0 2))))
(cons 5 (cons (cons 4 (cons (cons 3 (cons 0 (cons 2 '()))) '())) '()))
