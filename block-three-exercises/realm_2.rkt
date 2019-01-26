#lang racket
(require rackunit)
(require 2htdp/universe 2htdp/image)

(define WIDTH 100)
(define HEIGHT 300)
(define IMG-UFO (bitmap "player1.png"))

(define (add-3-to-state current-state)
  (+ current-state 3))

(define (state-is-300 current-state)
      (>= current-state 278))

(define (render-UFO current-state)
  (place-image IMG-UFO (/ WIDTH 2) current-state (empty-scene WIDTH HEIGHT))
  )



#|

(define (key-events w key)
  (cond [(key=? key "up") (bigger w)]
        [(key=? key "down") (smaller w)]
        [(key=? key "q") (stop-with w)]
        [(key=? key "=") (stop-with w)]
        [else w]))

|#
  (big-bang 0
            ;;(on-key key-events)
            (to-draw render-UFO)
            (on-tick add-3-to-state)
            (stop-when state-is-300)
            )


