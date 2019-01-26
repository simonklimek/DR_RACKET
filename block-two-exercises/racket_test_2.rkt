#lang racket
;is the result (cons 1 '()_ is the same as (append '() '(1))  result: '(1) , '(1) - true
;you heve following structure:
(struct point3d (x y z) #:transparent #:mutable)
(define startingpoint (point3d 0 0 0))
;suppose that you want to modify the second coordinate to read 1 so that the procedure
(print startingpoint)
;dziala
;(set-point3d-y! startingpoint 1)

;to create a generic Racket structure

;what is the result of following procedure
(set-intersect (set "a" "b" "c") (set "d" "e" "f"))
;#<set:>

;what is the result of running the following Racket code? - 4
(define unknown (λ ()
                  (let ((x 1))
                    (let ((x (+ x 1)))
                      (+ x x)))))

;what is the result of running the following Racket code? - 12
(define unknown2 (λ ()
                   (let ([x 4])
                     (let ([x 5]
                           [y (+ x 3)])
                       (+ x y)))))
;what is the result of - 6
(let ((a 1) (b 2) (c 3))
  (* (/ c a) b))

;does the let expression below
(let ((x 3)(y (+ 2 5))) (+ x y))
;evaluate the same as the following lambda expression?
((λ (x y) (+ x y)) 3(+ 2 5))
;are both give 10 - 10

;what is the result of running the function
(define xyz '(x y z))
(define unknown3 (λ ()
                   (let ((xyz '(z y x)))
                     xyz)))
;result is '(z y x)


;given a set
(set 10 20 30 40 50)
;the procedure
(set-add (set 10 20 30 40 50) 60)
;-creates new set with elements (set 10 20 30 40 50 60)

;given a tree T as a list in Racket '(1 (2 3))
(define T '(1 (2 3)))
;how would we access the right hand side of the top node of the tree?
;(rest T)


;given the following list representing a tree
;((1 (2 3 4)) (3 4) (5 6))
;is this binary tree? - False


;what does it mean to initialise a field to a default value in a class declaration?
;-to activate it with the keyword create-init


;in Racket to instantiate an object you need to use
;-the keyword init


;how would you construct the following nested list?
'((((("five a side")))))
;(cons (cons (cons (cons (cons "five a side" '()) '()) '()) '()) '())


;what is the result of the following expression?
;(cons (cons (cons 4 3) 2) 1)
;ansfer- '(((4 . 3) . 2) . 1)


;what does the following code do?
(define (dothis list)
  (cond
    ((cond
       ((null? list) '())
       ((append (dothis (rest list)) (cons (first list) '())))))))

;ansfer reverse the list

;suppose you have the following definition of what you have in your bag:
(define list1 '(pen (pencil) (ruler) (compass sharpener)))
;what does following return?
(reverse list1)


;to build as racket
;-prefix expression with a single quote mark

;how do you give a name to lists
;(define lsitname '(foo bar etc))

;evaluate (cdr (cons 'x 'y))
;- 'y


;suppose you have th efollowing definition if your bag
(define list2 '(pen (pencil (ruler) (compass sharpener))))
(first (reverse (append list2 '(glass))))
;return
;'glass


