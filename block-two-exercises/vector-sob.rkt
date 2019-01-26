#lang racket

#|
(define v (vector "Micheal" "Igor" "Leo" "Franco" "Kelly" "Martin" "Guseppe"))
(define v2 (build-vector 10 add1))
(vector-filter-not odd? v2) ;returns the odd nr from v2
(define names2 '( "Micheal" "Igor" "Leo" "Franco" "Kelly" "Martin" "Guseppe"))

(vector-set*! v2 7 8)

;-------ODD LISTS---
(define lst (list 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14))
(define (odds lst)
  (length (filter odd? lst)))
|#

(define lst (list 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14))

(define (my-map f lst)
  (for/list ([i lst])
    (f i)))

(map (λ (number) (* 2 number)) '(1 2 3 4))

;-----------
#|
(let ([names '( "Micheal" "Igor" "Leo" "Franco" "Kelly" "Martin" "Guseppe")])
    (for/vector #:length (length names)  ;length expression
      ([i (in-naturals 1)] [names names])  ;sequence
      (string-append (number->string i) ". " names)))

;---------------------------------------------
(for ([i '(1 2 3 4 5)] [j "abcdef"]
                   #:when (odd? i)
                   [k #(#t #f)])
  (display (list i j k)))
;---------------------------------------------
(for/hash ([i '( 1 2 3)])
    (values i (number->string i)))
'#hash((1 . "1") (3 . "3") (2 . "2"))
;----------------------------------------------
;-----------VECTOR ODD INDEX-------------------
(define names3 '( "Micheal" "Igor" "Leo" "Franco" "Kelly" "Martin" "Guseppe"))
(define odies (list (filter even? lst)))

|#




;;FINAL TRY------------------------------------------------------------------------------ WORKS!----
;; 38 Show and explain a simple program using a for loop
#|
(define v3 (vector "Micheal" "Igor" "Leo" "Franco" "Kelly" "Martin" "Guseppe"))
(define v3-length (vector-length v3))
(define v3-indexList (build-list v3-length values))

(for ([i v3] [j v3-indexList]) 
  (cond
    [(odd? j) (vector-set! v3 (+ j 1) (number->string (+ j 1)))]   
   ))
|#
;----------------------------------------------------------------------------------------------------



;----------NOT FINISHED-------------

#|
(define pos-x (vector 12 10 9 13 11 11 11 11 11 1 1 1 1 1 2 3 19 19 2 3 19 19 19 19 18 17 17 19 18 ))
(define pos-y (vector 7 7 7 7 8 6 7 5 9 2 3 11 12 13 13 13 3 13 1 1 13 12 11 1 1 1 13 2 13))
(define pos-x-length (vector-length pos-x))
(define pos-y-length (vector-length pos-y))
(define pos-x-indexList (build-list pos-x-length values))
(define pos-y-indexList (build-list pos-y-length values))


|#



;[(and (= x pos-x) (= y pos-y)) 0]

;(define two-sq (λ (l1 l2)
                
;(string-replace (list-ref name odds) (number->string odds))

;V good function (string-replace (list-ref name odds) (number->string odds))

;(list-ref (list 'a 'b 'c) odds ) ;if its odd then replace

;-------------------------------------------------
;(define v-len (- (vector-length v) 1))
  
;(vector-ref v 0)

;(define forVector (make-vector 10))

;(define odds (λ (v)
;  (for/vector ([i l]) (+ 3 i))    ; (vector-sort l <)                  
;  ))

;(vector-memq "Igor" v)
;(vector-filter-not even?)

;(vector->list v)

;(vector-ref v i) (+ i 1)

