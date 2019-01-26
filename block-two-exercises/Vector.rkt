#lang racket
(vector 1 2 3 4)
(define v (make-vector 3))
(vector-set! v 0 2)
(vector-set! v 1 'apple)
(vector-set! v 2 (list 1 2))

;ex4.1

(vector-length (vector 2 4 3))

(displayln "append")
(vector-append (vector 1) (vector 2) (vector 3 4 5))
(displayln "map")
(vector-map + #(1 2) #(3 4))

;1)
(define v1 (make-vector 4))
(vector-set! v1 0 3)
(vector-set! v1 1 1)
(vector-set! v1 2 4)
(vector-set! v1 3 2)
(displayln "return co-ordinate 1")
(vector-ref v1 1)
;2)

;3)

;4)

;5)

;6)

;ex4.2
;1)
(displayln " function multiply vectors")
;(multiply-vectors (vector 2 3 4) (vector 3 4 5))
(define multiply-vectors (λ ()
                           (vector-map * #(2 3 4) #(3 4 5))
                           ))
;2)
(define double-vector (λ ()
                        (vector-map * #(2 3 4) #(2 2 2))
                        ))
                        
;3)
;4)
;5)
;6)
;7)
;8)