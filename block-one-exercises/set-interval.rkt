#lang racket

;; once per second
(define mylist '("one" "two" "three"))
;; the last time an action was executed
(define lastTime 0)
;; the current "state" (i.e., position in the list)
(define currentState 0)
;; interval (in milliseconds) between print events
(define interval 2000)

(define loopNoSleep (λ ()
                      (cond 
                        [ (> (- (current-milliseconds) lastTime) interval)

                          (displayln (list-ref mylist currentState)) ;element from the list state 0 = one 1=two 3=three

                          (displayln currentState) ;0 ;1 ;2

                          (set! currentState (modulo (+ 1 currentState) (length mylist)))
       
                          (set! lastTime (current-milliseconds))

                          (displayln currentState) ;1 ;2 ;0

                          ]
                        ) 
                      ;; here you can check the button pressed;
                     

                      (sleep 0.01)
  (loopNoSleep)

                      ))
(loopNoSleep)