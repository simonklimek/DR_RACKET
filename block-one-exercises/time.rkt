#lang racket
(define startTime 0)
(define duration 0)
(define interval 5)



(set! startTime (current-seconds))



(define loopster
  (λ ()
    (set! duration (- (current-seconds) startTime))

    ;doesnt work
    (cond
      ((equal? duration interval) displayln "msg")
      (#t displayln "test"))

    
  (displayln duration)
  (displayln interval)
  (sleep 1)
  (loopster)
  ))

(loopster)