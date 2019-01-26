#lang racket

(require web-server/servlet
         web-server/servlet-env)

(struct post (title body))
(define BLOG (list (post "First Post!"
                         "Hey, this is my first post!")))



(define (myresponse request)
  (response/xexpr

   '(html (head (title "Smart Home v1 Experiments"))
          (body
           (h1 "Home Dashboard")
           (p "security electricity and pneumatics")
           (b "Lights")
           (p (b "Rooms Status") " good status")
           (form
                   (input ((name "name")))
                   (input ((name "surname")))
                   (input ((type "submit"))))
           ))
   ))

;:8000/servlets/standalone.rkt
;(serve/servlet myresponse)
(serve/servlet myresponse
               #:listen-ip #f
               #:port 8080
             ;  #:servlet-path "/index.rkt"
               #:launch-browser? #t)