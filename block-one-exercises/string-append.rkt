#lang racket
(define double (λ (n)
             (cond
               ((number? n) (* 2 n))
               ((string? n) (string-append n n)))
               ))

