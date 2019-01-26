#lang racket
(require "AsipMain.rkt")

(open-asip)
;;Encoders
(enableCounters 1) 
(fprintf (getCount 0) "start state x is ~a endoders")
(fprintf (getCount 1) "start state y is ~a endoders")



(define left (λ ()

               (define x (floor (* 255 0.65)))
               (define y (floor (* 255 0.75)))
               (setMotors x y)
               (sleep 3)
               ))

;(left)
;(sleep 3)
(setMotors 165 165)
(sleep 3)
;(displayln "end state x is " (getCount 0) " encoders")
;(displayln "end state x is " (getCount 1) " encoders")

(stopMotors)
(close-asip)


