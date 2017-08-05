(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff high-terms)
                (+ (* higher-terms x) this-coeff))
              0
              coefficient-sequence))
