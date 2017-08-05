(define (first-denomination list)
  (car list))

(define (except-first-denomination list)
  (cdr list))

(define (no-more? list)
  (null? list))
