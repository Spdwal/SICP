(define (exponentiation? exponent)
  (and (pair? exponent) (eq? (car exponent) '**) (pair? (cdr exponent))))

(define (exponent-base exponent)
  (cadr (exponent)))

(define (exponent-power exponent)
  (caddr (exponent)))

(define (make-exponentiation base power)
  (if (= power 0)
      1
      (list '** base power)))

