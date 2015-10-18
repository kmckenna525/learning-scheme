(define (sum-list intList)
  (if (null? intList)
    0
    (+ (car intList) (sum-list (cdr intList)))))
