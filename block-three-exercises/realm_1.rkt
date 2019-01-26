#lang racket
(require rackunit)
(require 2htdp/universe 2htdp/image)
(struct point (x y) #:transparent)

(define (distance-to-origin p)
  (sqrt (+ (sqr (point-x p)) (sqr (point-y p)))))



(define a (point -1 2))
(define b (point -1 2))


(define (my-equal? a b)
  (cond
    [(and (point? a) (point? b))
     (and (my-equal? (point-x a) (point-x b))
          (my-equal? (point-x a) (point-x b)))]


    ;; Every struct definition adds a cond clause.
    [(and (cons? a) (cons? b))
     (and (my-equal? (car a) (car b))
          (my-equal? (cdr a) (cdr b)))]
    [(and (empty? a) (empty? b))
     #t]


    [else #f]
    ))
; tests (check-equal? (add1 5) 6)
;;(check-equal? (sub1 (add1 5)) 5)
;(check-equal? 5 6 "NUMBERS MATTER!")

(define WIDTH 100)
(define HEIGHT 200)
;;defining center of the scene
(define X-CENTER (quotient WIDTH 2))
(define Y-CENTER (quotient HEIGHT 2))
;;creating an error
(unless (> HEIGHT 0)
  (error 'guess-my-number "HEIGHT may not be negative"))
;;more definition with scope
(struct posn (x y))
(struct rectangle (width height))
(define (inside-of-rectangle? r p)
  (define x (posn-x p))
  (define y (posn-y p))
  (define width (rectangle-width r))
  (define height (rectangle-height r))
  (and (<= 0 x) (< x width) (<= 0 y) (< y height)))

;;BIG BANG
#|
(define IMAGE-of-UFO (bitmap "player1.png"))

(define (add-3-to-state current-state)
  (+ current-state 3))

(define (draw-a-ufo-onto-an-empty-scene current-state)
  (place-image IMAGE-of-UFO (/ WIDTH 2) current-state
               (empty-scene WIDTH HEIGHT)))

(define (state-is-300 current-state)
  (>= current-state 200))
|#

;;guess my number?

(define HELP-TEXT
  (text " for larger numbers, for smaller ones"
        TEXT-SIZE
        "blue"))
(define HELP-TEXT2
  (text "Press = when your number is guessed; q to quit."
        TEXT-SIZE
        "blue"))
(define COLOR "red")



(define MT-SC
  (place-image/align
   HELP-TEXT TEXT-X TEXT-UPPER-Y "left" "top"
   (place-image/align
    HELP-TEXT2 TEXT-X TEXT-LOWER-Y "left" "bottom"
    (empty-scene WIDTH HEIGHT))))




(define (deal-with-guess w key)
  (cond [(key=? key "up") (bigger w)]
        [(key=? key "down") (smaller w)]
        [(key=? key "q") (stop-with w)]
        [(key=? key "=") (stop-with w)]
        [else w]))

(define (smaller w)
  (interval (interval-small w)
            (max (interval-small w) (sub1 (guess w)))))

(define (bigger w)
  (interval (min (interval-big w) (add1 (guess w)))
(interval-big w)))

(define (guess w)
  (quotient (+ (interval-small w) (interval-big w)) 2))

(define (render w)
  (overlay (text (number->string (guess w)) SIZE COLOR) MT-SC))

(define (render-last-scene w)
  (overlay (text "End" SIZE COLOR) MT-SC))

(define (single? w)
  (= (interval-small w) (interval-big w)))


;;main function
(define (start lower upper)
  (big-bang (interval lower upper)
            (on-key deal-with-guess)
            (to-draw render)
            (stop-when single? render-last-scene)))
