#lang racket
(require net/dns)
(require net/head)
(require net/smtp)

(define (testmdx)
  (smtp-send-message (dns-get-address (dns-find-nameserver) "smtp.mdx.ac.uk")
   "@live.mdx.ac.uk" `("@live.mdx.ac.uk")
   (standard-message-header "Sender Name <@live.mdx.ac.uk>"
    `("")
    `() ; CC
    `() ; BCC
    "saying hello from mdx")
   `("hello world!")
   )
  )