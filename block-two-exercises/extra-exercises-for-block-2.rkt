#lang racket
;ex1

(define check-range1 (λ (x)
                       (cond
                         ((< x 5) (displayln "mniejsze od 5"))
                         ((> x 95) (displayln "wieksze od 95"))
                         (#t  (displayln "w zasiegu"))
                         )))

;ex2
(struct point3D (x y z) #:transparent #:mutable)
(define point (point3D 0 0 20))
(point3D-z point)
(set-point3D-z! point 7)

;ex3
(cons 10 (cons 11 (cons 12 ( cons 13 '()))))

(cons (cons 10 (cons 11 '()))  (cons (cons 12 (cons 13 '())) '()) )

;(cons (cons 10 (cons 11 (cons 12 '()))) (cons (cons 13 (cons 14 '())) '()))
(cons 10 (cons 11 (cons 12 (cons (cons 13 (cons 14 '())) '()))))

(cons (cons 10 (cons 11 (cons 12 '()))) (cons 13 '()))

 (cons (cons 12 (cons 13 '())) (cons 10 '()))

(cons (cons 11 '()) (cons 12(cons 13 '())))

(cons (cons  12 (cons 10 '())) (cons 11 '()))

