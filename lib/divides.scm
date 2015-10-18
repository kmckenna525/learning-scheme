(define (fizzify f)
  (lambda (n)
    (eqv? (remainder n f) 0)))

(define (divides? f n)
  ((fizzify f) n))