#lang racket
;;FIX BINDINGS
(require web-server/servlet
         web-server/servlet-env)
(require net/dns)
(require net/head)
(require net/smtp)
(require openssl/mzssl) 

(define (myresponse request)
  (define bindings (request-bindings request))


 (cond ((exists-binding? `name bindings)
         (define myname (extract-binding/single `name bindings))
         (define mymessage (extract-binding/single `texarea bindings))


(displayln "Email sent"))
         
  (else
  (response/xexpr
   `(html (head (title "Contact page"))
          (body
           (h1 "A Simple Contact Us form")
           (form
            (p "Enter your name " (input ((name "name"))))
            (p "Enter your message below")
            (p (textarea ((rows "10") (cols "50"))))
            (p (input ((type "submit") (value "Send Email")))))))
   )
  )
  ))

(define sendEmail (λ ()
                    (smtp-send-message
                     (dns-get-address (dns-find-nameserver) "smtp.gmail.com")

                     "1@gmail.com" `("1@gmail.com")
                     (standard-message-header "Sender Name <1@gmail.com>"
                                              `("@live.mdx.ac.uk>")
                                              `() ; CC
                                              `() ; BCC
                                              "saying hello from mdx")
                     `("hello world!")
                     #:port-no 587
                     #:auth-user ""
                     #:auth-passwd "" 
                     #:tcp-connect tcp-connect
                     #:tls-encode ports->ssl-ports
                     )
                    ))

(serve/servlet myresponse)