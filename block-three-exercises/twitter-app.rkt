#lang racket
(require "oauth-single-user.rkt")
(require json)

(define myAuthenticationParameters
  (new oauth-single-user%
       [consumer-key ""] ;; API key
       [consumer-secret ""] ;; API secret
       [access-token ""] ;; access token
       [access-token-secret ""] ;; access token secret
       ))

(define twitterResponse (bytes->jsexpr (first
    (send myAuthenticationParameters get-request
          "https://api.twitter.com/1.1/search/tweets.json"
          (list (cons `q "Hello World, this is my second tweet from Racket!") )
          ) ;; end of send
    ) ;; end of first
   ) ;; end of bytes->jsexpr
  ) ;; end of definition of twitterResponse

(define statuses (hash-ref twitterResponse `statuses))

(for ([tweet statuses])
  (printf "The message is: ~a\n" (hash-ref tweet `id))
  (printf "The message is: ~a\n" (hash-ref tweet `text))
    (printf "The message is: ~a\n" (printf "~a\n" (hash-ref (hash-ref tweet 'user) 'screen_name)))
  )

;(hash-ref tweet `id)

#|
(send myAuthenticationParameters post-request "https://api.twitter.com/1.1/statuses/update.json"
      (list (cons `status "Hello World, this is my second tweet from Racket!")))

|#