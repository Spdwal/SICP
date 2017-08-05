(define (for-each1 f l)
  (if (not (null? l))
      ((f (car l))
       (for-each1 f (cdr l)))
      (else #t)))
