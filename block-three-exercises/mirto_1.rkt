#lang racket

( require "AsipMain.rkt")

( define previousLeft #f)
( define previousRight #f )

( define sensorsLoop ( lambda ()

                        ( cond ( ( not ( equal? ( leftBump?) previousLeft ))


                                 ( cond (( leftBump?) ( printf " Left bump pressed \n"))
                                        ( else ( printf " Left bump released \n"))
                                        )
                                 )
                               ) ;; end of cond for left bump changed

                        ( cond ( ( not ( equal? ( rightBump?) previousRight ))
                                 ;; Something has changed for the right bump
                                 ( cond (( rightBump?) ( printf " Right bump pressed \n"))
                                        ( else ( printf " Right bump released \n"))
                                        )
                                 )
                               ) ;; end of cond for right bump changed

                        ( set! previousLeft ( leftBump?))
                        ( set! previousRight ( rightBump?))

                        ( sleep 0.02)

                        ( cond ( ( not (and ( leftBump?) ( rightBump?)))
                                 ( sensorsLoop )
                                 )
                               else (displayln "sensor"))
                               )
   )

( define anotherSimpleExample ( lambda ()
                                 ( open-asip )

                                 ( enableBumpers 100)
                                 ( sleep 0.5)

                                 ( sensorsLoop )
                                 ( close-asip )
                                 ))
(anotherSimpleExample ) (sensorsLoop)
