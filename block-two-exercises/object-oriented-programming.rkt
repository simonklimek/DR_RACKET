#lang racket
;example
(define fantasy%
  (class object%
    (init-field (pages 5)) ;;default value of 5
    (define/public (letters)
      (* pages 500)) (super-new)
    )
  )


(define account%
  (class object%
    (super-new) ;; Invokes superclass initialisation 4
    (field (balance 0)) ;; a field called balance

    (define/public (add n) ;; define the method add
      (set! balance (+ n balance)))

    (define/public (get-balance) balance)
    )
  )


(define savings% (class account% (super-new)
                   (field (interest 0.04))
                   (define/public (add-interest)
                     (send this add ( * interest (send this get-balance)))))
  )

;ex
;(define f1 (λ (x) 
 ;                 (map (λ (x) (+ 5 x)) ’(1 2 3))
  ;              ))


;lecture
