#lang racket
(define build-list-pairs (λ (n)
(for*/list ([i (range n)] [j (range i)])
  (list i j)
  )))

(for/list ([i '(1 2 3)])
  (* i 2)
  (* i 3)
  )