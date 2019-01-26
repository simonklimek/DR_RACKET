#lang racket
;ex1.1

(struct lubrary (readers books borrowings) #:mutable)

(define get-borrow/s (λ (x y)
                       (set-library-borrowings! (list x y)





(struct saving-account (interest balance) #:mutable) (define get-balance/s (lambda (x)
(saving -account -balance x)))
(define add-funds/s (lambda (x y) (set-saving-account-balance! x
(+ y (saving -account -balance
(define add-interest (lambda (x) (set-saving-account-balance! x
x))) ))
( * (+ 1 (saving -account -interest x))
(saving -account -balance
> (define myacc-s (saving-account 0.04 0))
> (add-fund/s myacc-s 100)
> (get-balance/s myacc-s)
100
> (add-interest myacc-s)
> (get-balance/s myacc-s)
104.0