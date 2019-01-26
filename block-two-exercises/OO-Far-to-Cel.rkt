#lang racket/gui
(define myframe (new frame%
                     [label "my Window"]
                     [width 200] [height 300]))


(define butt (new button%
                  [parent myframe]
                  [label "Click This"]))
(define check-box (new check-box%
                       [label "Check Box"] [parent myframe]
                       [value #t]))
(define choice (new choice%
                    [label "Choose"] [parent myframe]
                    [choices (list "First choice" "Second choice")]))
(define slider (new slider%
                    [label "Slider"] [parent myframe]
                    [min-value 0] [max-value 100]))
(define text-field (new text-field%
                        [label "Text"] [parent myframe]))


(define pan (new horizontal-panel%
                 [parent myframe]))
(new button% [parent pan]
     [label "First"])
(new button% [parent pan]
     [label "Second"])


(define v-pan (new vertical-panel%
                 [parent myframe]))
(new button% [parent v-pan]
     [label "First"])
(new button% [parent v-pan]
     [label "Second"])
(send myframe show #t)
