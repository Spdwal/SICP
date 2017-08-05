(define (gcd a b)
  (if (= a b)
      a
      (gcd b (remainder a b))))
