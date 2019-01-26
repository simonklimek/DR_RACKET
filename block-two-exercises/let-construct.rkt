#lang racket
;snippet1.1
(define solve-quadratic (λ (a b c )
                          (list
                           (/ (+ (- b) (sqrt (- (sqr b ) (* 4 (* a c ))))) ( * 2 a))
                           (/ (- (- b) (sqrt (- (sqr b ) (* 4 (* a c ))))) ( * 2 a))
                           )))
;snippet1.2
(define solve-quadratic-short (λ (a b c)
                                (let
                                    ([det (sqrt (- (sqr b) (* 4 (* a c))))])
                                  (list
                                   (/ (+ (- b) det) (* 2 a))
                                   (/ (- (- b) det) (* 2 a))
                                   ))))

;snippet1.3
(define solve-quadratic-shorter (λ (a b c)
                                (let
                                    ([det (sqrt (- (sqr b) (* 4 (* a c))))]
                                     [2a (* 2 a)])
                                  (list
                                   (/ (+ (- b) det) 2a)
                                   (/ (- (- b) det) 2a)
                                   ))))
;snippet1.4
(define test (λ ()
               (let ([n 2])  ;n = 2
               (let ([n (+ n 2)]) ;n = 4 and overwrite the first N value
                 (+ n n)))))
;snippet1.5
(define test2 (λ ()
                (let ([n0 2])
                (let ([n1 (+ n0 2)])
                  (+ n1 n1)))))
;ex1.6
(define myVar '(a b c))
(define silly (λ ()
                (let ([myVar '(c b a)])
                  myVar)))

;ex1.7  1) 2)
;1)
;(+ (- (* 3 a) b) (+ (* 3 a) b))
(define f1-simplify (λ (a b)
                      (let ([f1 (+ (* 3 a) b)])
                      (let ([f2 (- (* 3 a) b)])
                      (+ f1 f2)))
                      ))

;2)

;(cons (car (list a b c)) (cdr (list a b c)))
(define list-var (λ (a b c)
                   (let ([var1 (list a b c)])
                     (cons (car var1) (cdr var1))
                     )))
;exercise for sob
(define sob (λ ()
              (let ([c 2])
              (let ([x 3])
              (let ([b 4])
                (sqr (sqrt (- (* (+ 2 b) (+ 3 x)) c)))
                )))))
;ex1.8
;y=a * x * x + b * x + c
(define figure (λ (x)
                 (let ([a 1])
                 (let ([b 2])
                 (let ([c 3])
                   (+ (+ (* a x x) (* b x)) c)
                   )))))
;ex1.9 - TODO - explain the difference of results
(define test-1 (λ ()
                (let ([x 2])
                  (let ([x 3]
                        [y (+ x 4)])
                    (+ x y)))))

(define test-2 (λ ()
                (let ([x 2])
                  (let ([x 3])
                      (let ([y (+ x 4)])
                    (+ x y))))))

;1.10 - TODO

