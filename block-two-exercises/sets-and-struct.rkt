#lang racket
;ex1.1 sets 
(define set1 (list 10 20 30 40 50))
;ex1.2
(define setA (list 2 4 6 8 ))
(define setB (list 4 8 12 ))
(define setC (list 8 16 24 ))

(define check11 (λ (y x) 
                          (cond
                            [(set-member? y x) (displayln "value is in set")]
                            [#t (displayln "value is not in set")]
                            )
                         ; (cond
                         ;   [(set-member? set1 -10) (displayln "-10 is in set")]
                        ;    [#t (displayln "-10 is not in set")]
                           ; )
                       ))
;ex1.2
(displayln  (set-intersect (set-union setA setB) setC))
(displayln  (set-union (set-intersect setB setC) setC))
(displayln  (set-union (set-subtract setA setB) setC))
(displayln  (set-subtract (set-union setB setC) setA))


;------------------------------------------
;ex1.3
(define set-disjoint? (λ (x y)
                        (cond
                          [(eqv? (length (set-intersect x y )) 0) (displayln "#t")]
                          [#t (displayln "#f")]
                          )))




;Precondition:
;take arguments which are both the lists
;check arguments are not empty
;check agrument lists consists numbers only

;Postcondition: return boolean in a console


;-------------------------------------------

;ex2.1 struct
(struct film (title director time))
(struct book (title author))
(struct car (make model price))

(define film-record-1 (film 'Snatch 'Guy-Ritchie 144))
(define another-film (film 'ToyStory 'Scorsese 177))
(define book-record-1 (book 'Shantaram 'Gregory-David-Roberts))
(define car-record-1 (car 2002 'BMW-E-46 10000))

(displayln (book-author book-record-1))
(displayln (car-price car-record-1))



(define directed-by-Scorsese (λ (x) (cond
                                     [(equal? (film-director x) 'Scorsese) (film-title x)]
                                     [#t "not by Scorsese"]
                                     )))


(define is-it-film (λ (x) (cond
                                     [(film? x) (film-title x)]
                                     [#t "not film"]
                                     )))

;ex 2.3


(struct menuitem (dishname price) #:mutable)

(define dish (menuitem 'gnocchi 7))
(menuitem-price dish)

(set-menuitem-price! dish 8)
(menuitem-price dish)


(define increase (λ ()
                  (set-menuitem-price! dish (+ (menuitem-price dish) (* (menuitem-price dish) 0.1)))
                   (menuitem-price dish) 
                   ))