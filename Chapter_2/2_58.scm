(define (sum? expr)
  (eq? '+ (smallest-op expr)))

(define (product? expr)
  (eq? '* (smallest-op expr)))


(define (smallest-op expr)
  (accumulate (lambda (a b)
                (if (operator? b)
                    (min-precedence a b)
                    a))
              'maxop
              expr))


