(define (greastest-common-divisor a b)
  (apply-generic 'greast-common-divisor a b))

(put 'greast-common-divisor '(scheme-number scheme-number)
     (lambda (a b) (gcd a b)))

(define (remainder-terms p1 p2)
  (cadr (div-terms p1 p2)))

(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))

(define (gcd-poly p1 p2)
  (if (same-varable? (variable p1)(variable p2))
      (make-poly (variable p1)
                 (gcd-terms (term-list p1)
                            (term-list p2)))
      (error "not the same variable -- gcd poly" (list p1 p2))))

(put 'greast-common-divisor '(polynomial polynomial)
     (lambda (a b) (tag (gcd-poly a b))))
