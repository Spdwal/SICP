(define (last-pair List)
  (if (null? (cdr List))
      List
      (last-pair (cdr List))))
