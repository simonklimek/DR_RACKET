#lang racket
;exercise 11
;(> 2 3)
;(define f2 (λ (x) (zero? x)))
;(<= 2 3)


; works fine
;(define AND (λ (x y)
 ;             (cond
  ;             ((equal? x y))
   ;            (not (equal? x y)))))

;(define NOT (λ (x)
 ;             (cond
  ;              ((equal? x true) ("false"))
   ;             (false) ("true"))
    ;            ))


; works well
(define NOT (λ (n)
             (not n)))


;works well !
 (define OR (λ (x y)
              (cond
                 (x #t)
                 (y #t)
                 (#t #f)
                 )))


;works well!
(define XOR (λ (x y)
              (cond
                  ((equal? x y) #f)
                 (#t #t))))


 (define AND (λ (x y)
              (cond
                 ((eqv? x #f) #f)
                 ((eqv? y #f) #f)
                 (#t #t)
                 )))



   ;             ((and (eqv? x #t) (eqv? y #f)) (true))
    ;            ((false)))))


                 

;(define OR (λ (x y)
;             (cond
;               ((equal? x y) #t)
 ;              (#f #f))))λ


