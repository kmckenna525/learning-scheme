#!/opt/local/bin/guile \
--use-srfi=1 -e main -s
!#

(load "lib/divides.scm")
(load "lib/sum-list.scm")

(define (sum-even intList) 
  (sum-list (filter even? intList)))

(define (fib-to start n) 
  (letrec 
    ((front-fib (lambda (intList) ;; Add the top two numbers in the list
        (+ (car intList) (car (cdr intList)))))
      (cons-fib1 (lambda (intList) ;; Add the top two numbers in the list and cons the result
        (cons (front-fib intList) intList)))
      (r-fib-to (lambda (intList n)
        (if (> (car intList) n) 
          (cdr intList) 
          (r-fib-to (cons-fib1 intList) n)))))
    (r-fib-to (cons (1+ start) (list start)) n)))

(define (main args) 
  (cond ((null? (cdr args)) (display "need to provide start, max as args"))
        ((null? (cdr (cdr args))) (display "need to provide start, max as args"))
        (else
          (let* ((start (string->number (cadr args)))
                 (n (string->number (cadr (cdr args)))))
            (write
              (sum-even (fib-to start n))))))
  (newline))
