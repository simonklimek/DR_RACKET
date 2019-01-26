#lang racket
;explain--------------------------------------------------------------------------------------
;562	Express the type of a polymorphic function.
;563	Express the type of a higher order function.
;253	Discuss the advantages and disadvantages of side-effects.
;code--------------------------------------------------------------------------------------
;250	Define functions to write the contents of a data structure to disk and read them back.
;255	Write a function that uses stacks to solve a simple problem.
;559	Write a program that uses graphs to solve a simple problem.
;254	Write a function that uses trees to solve a simple problem.
;257	Create a simple database in Racket using a data structure.
;560	Once you have created a simple database in Racket, write queries to extract some useful data
;done--------------------------------------------------------------------------------------
;256	Write a function that uses vectors to solve a simple problem.

;Snipet2.1
(define (eval-nand an-exp)
  (cond
    [(equal? an-exp #t) #t]
    [(equal? an-exp #f) #f]
    [#t (nand (eval-nand (first an-exp))
              (eval-nand (second an-exp)))]
    ))

(list #t (list (list #f #t) #f)) ;#f
(list #f (list (list #f #t) #t)) ;#t

;ex2.2
;1 what is signature (type) of eval-nand?


;Graphs
(define (edge x graph)
  (map (λ (y) (first (rest y))) (filter (λ (y) (= (first y) x)) graph)))

(define (path x y a-graph vertex-set)
  (cond
    [(= x y) #t]
    [(not (set-member? vertex-set x)) #f]
    [(not (set-member? vertex-set y)) #f]
    [#t (ormap (λ (z) (path z y a-graph (set-remove vertex-set x ))) (edge x a-graph))]
    ))

(define (reachable x y a-graph)
  (path x y a-graph (list->set (flatten a-graph))))

(define graph '((1 0) (0 1) (1 3) (1 4) (2 4) (5 6) (6 12) ))
       