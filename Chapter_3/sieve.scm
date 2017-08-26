(define (sieve stream)
  (cons-stream
   (stream-car stream)
   (sive (stream-filter
          (lambda (x)
            (not (divisible? x (steam-car stream))))
          (stream-cdr stream)))))

(define prime (sieve (integers-starting-from 2)))
