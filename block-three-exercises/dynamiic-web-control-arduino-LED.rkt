#lang racket
(require web-server/servlet
         web-server/servlet-env)
(require "AsipMain.rkt") (open-asip)
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(define pin (range 8 13))
(map (λ (x) (set-pin-mode  x  OUTPUT_MODE)) pin)    
(map (λ (x) (digital-write x LOW)) pin)
;;adding buttons to functionality


(define CONTENT (list))

(define my-app (λ (request)
  (define bindings (request-bindings request))
  (cond (
         [exists-binding? `pin bindings]
         [set! CONTENT (extract-bindings `pin bindings)]
          ))
  (response/xexpr
   `(html (head (title "Racket Web Experiments")
                (style ([type "text/css"])
                       "body {background: #25879B; margin: 20px; padding: 50px;}"
                       "p { color: #FFFFFF; font-family: 'Carme', sans-serif; font-size: 16px; line-height: 24px; margin: 0 0 24px; }"
                       "h1 { color: #CEF0D4; font-family: 'Rouge Script', cursive; font-size: 45px; font-weight: normal; line-height: 48px; margin: 0 0 50px; text-shadow: 1px 1px 2px #082b34; }"
                       "input[type=submit] { padding:5px 25px;  background:#ccc; border:0 none; cursor:pointer; -webkit-border-radius: 5px; border-radius: 5px; }"
                       ))
          (body
           (h1 "Arduino Pin Control")
           (p "Tick following PIN and submit to light up the LED on Arduino board")
           (form ,@(render-checkboxes CONTENT)
            (p (input ((type "submit") (value "Send your data")))))
           (img (src "")
           )
 )))))

(define render-checkboxes (λ (a-list)
                            (for/list ([pin pin]) 
                              (cond (
                                     (not (member (number->string pin) a-list))
                                     (digital-write pin LOW)
                                     `(p (input ((name "pin") (type "checkbox") (value ,(number->string pin)))) ,(number->string pin))
                                     )

                                    (else
                                     (digital-write pin HIGH)
                                     `(p (input ((name "pin") (type "checkbox") (checked "checked") (value ,(number->string pin)))) ,(number->string pin))
                                     )
                                    )
                              )
                            ))

(serve/servlet my-app
               #:listen-ip #f
               #:port 8080
               #:servlet-path "/led-control.rkt"
               #:launch-browser? #t)

;#:command-line? #t)

