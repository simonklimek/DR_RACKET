#lang racket

#|
In this game, the player thinks of a number between 1 and 100,
the program will then figure out that number by repeatedly making
guesses and asking the player if her number is bigger or smaller
than the current guess.
* Determine or set the upper and lower limits of the player's number
* Guess the number halfway between those two numbers
* If the player says the number is smaller, lower the upper limit
* If the player says the number is bigger, raise the lower limit
|#

(define lower 1)
(define upper 100)

;; (start)
;; Start the game with a different range of numbers
(define (start n m)
  (set! lower (min n m))
  (set! upper (max n m))
  (guess))

;; (guess)
;; Tells the program to start guessing
(define (guess)
  (quotient (+ lower upper) 2))


;; (smaller)
;; Tells the program that the guess is too high
(define (smaller)
  (set! upper (max lower (sub1 (guess))))
  (guess))

;; (bigger)
;; Tells the program that the guess is too small
(define (bigger)
  (set! lower (min upper (add1 (guess))))
  (guess))