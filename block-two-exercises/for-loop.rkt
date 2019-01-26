#lang racket
(define build-list-pairs (λ (n)
(for*/list ([i (range n)] [j (range i)])
  (list i j)
  )))

(for/list ([i '(1 2 3)])
  (* i 2)
  (* i 3)
  )

;1.1
(define sum
  (λ (l)
    (cond
      ([empty? l] 0)
      (#t (+ (car l);first element
             (sum (cdr l));rest of the list
             ))
      )))
;1.2
(define double-list (λ (l)
                      (cond
                        ([empty? l] '())
                        (#t (cons (* 2 (car l)) (double-list (cdr l)))))))
;2.1
(define double-list2
  (λ (l)
    (for/list ([i l]) (* 2 i))
      )
    )
;2.2
;1)
(define multiply-3
  (λ (l)
    (for/list ([i l]) (* 3 i))
      )
    )
;2)
(define add-5
  (λ (l)
    (for/list ([i l]) (+ 5 i))
      )
    )
;3)
(define reverse-4
  (λ (l)
    (reverse (for/list  ([i (reverse l)]) (- i 4)))
      )
    )
;4)
(define add-2-even (λ (l)
                     (for/list ([i l])
                       (cond
                         ([even? i] (+ i 2))
                         (#t i))
                         )))