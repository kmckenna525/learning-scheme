#!/opt/local/bin/guile \
--use-srfi=1 -e main -s
!#

(load "lib/divides.scm")
(load "lib/sum-list.scm")

(define (fizzbuzz? fizzList n)
  (cond ((null? fizzList) #f)
        ((divides? (car fizzList) n) #t)
        (else (fizzbuzz? (cdr fizzList) n))))

(define (num-listify stringList)
  (if (null? stringList)
    stringList
    (cons (string->number (car stringList)) (num-listify (cdr stringList)))))

;; args should be: max, fizzList...
(define (main args)
  (cond ((null? (cdr args)) (display "need to provide max, fizzList... as args"))
        ((null? (cdr (cdr args))) (display "need to provide max, fizzList... as args"))
        (else
          (let* ((n (string->number (cadr args)))
                 (fizzList (num-listify (cdr (cdr args))))
                 (yes? (lambda (n) (fizzbuzz? fizzList n))))
            (write
              (sum-list (filter yes? (iota n)))))))
  (newline))
