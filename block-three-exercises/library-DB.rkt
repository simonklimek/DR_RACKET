#lang racket/gui
(require 2htdp/batch-io)

(struct book (title status))
(struct status (timeLeft person))
(struct person (name book))
;;---- GUI ------------------------------------------------------------------------------
(define frame (new frame% [label "MDX Library 1.0"]
                   [width 500]
                   [height 250]))
(define msg (new message% [parent frame] [label "Automated system"]))
(define mainPanel (new horizontal-panel% [parent frame]))

;;login window
(define loginPanel (new vertical-panel% [parent mainPanel]))
(define groupBoxPanel (new group-box-panel% [parent loginPanel] [label "Logging area"]))
(define name (new text-field% [label "Login"] [parent groupBoxPanel] ))
(define password (new text-field% [label "Password"] [parent groupBoxPanel] ))
(new button% [parent groupBoxPanel] [label "Logg In"]
     [callback (λ (button event) (println "button clicked")
                 (send loginMsg set-label "Veryfication . . .")
                 (auth)
                 )])
(define loginMsg (new message% [parent groupBoxPanel]
                      [label "pending veryfication"]))

;;borrowing window
(define panel (new vertical-panel% [parent mainPanel]))
(define groupBoxBookPanel (new group-box-panel% [parent panel] [label "Borrowing area"]))
(new choice% [parent groupBoxBookPanel] [enabled #t](label "Choose Book")
     (choices (read-lines "books.txt")))
(new choice% [parent groupBoxBookPanel][enabled #t] (label "Choice term")
     (choices (list "1 day" "3 days" "7 days")))
(define borrowBtn (new button% [parent groupBoxBookPanel][enabled #f] [label "Borrow book"]
                       [callback (λ (button event) (print "button clicked - authentication in progress . . . ")
                                   (send msg set-label "Checking Books"))]))

;;footer

(define msgDummy (new message% [parent frame]
                      [label "No events so far..."]))

(send frame show #t)

;functions    
(define auth (λ ()
               (for ([i (build-list (length (read-words/line "people.txt")) values)])  
                 (cond
                   [(and (equal? (car (list-ref (read-words/line "people.txt") i)) (send name get-value))
                         (equal? (second (list-ref (read-words/line "people.txt") i)) (send password get-value))
                         (and (send borrowBtn enable #t) (displayln "both good - authenticated")))]
                   [(equal? (car (list-ref (read-words/line "people.txt") i)) (send name get-value)) (displayln "good login")]
                   [(equal? (second (list-ref (read-words/line "people.txt") i)) (send password get-value)) (displayln "good password")]
                   )
                 )))




;--------------------------------------------------
;(send name get-value)
;(displayln (cdr (list-ref (read-words/line "people.txt") i)))
;;(cdr (list-ref (read-words/line "people.txt") 1))
;;(length (read-words/line "people.txt")) ;;4 - 1