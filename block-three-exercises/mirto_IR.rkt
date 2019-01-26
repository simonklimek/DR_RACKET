#lang racket

(require "AsipMain.rkt")

(open-asip)

(enableIR 50)
(clearLCD)


                
(define main (λ ()
               (for ([i (in-range 100000)])
                                
                 (define sens1 (getIR 0))
                 (define sens2 (getIR 1))
                 (define sens3 (getIR 2))

                 (setLCDMessage (number->string sens1) 0)
                 (setLCDMessage (number->string sens2) 1)
                 (setLCDMessage (number->string sens3) 2)
                 (sleep 0.8)
                 
              (cond
                [(or (and (< sens1 450) (> sens2 450)) (< sens1 450)) (setMotors 100 0)]
                [(or (and (< sens3 450) (> sens2 450)) (< sens3 450)) (setMotors 0 100)]
            ;    [(< sens3 300) (setMotors 0 70)]
                [(> sens2 450) (setMotors 100 100)]
                [(and (> sens1 450) (> sens3 450)) (setMotors 100 100)]
                )
                 (stopMotors)
                
                 
                
                 
                 )
               ))
(main)






