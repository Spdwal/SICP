(define (negate-terms termlist)
  (map (lambda (x) (make-terms(order t)
                              (- (coeff t)))))
  termlist)

(put 'negate 'polynomial
     (lambda (poly) (make-polynomial (variable poly)
                                     (negate-terms (term-list poly)))))

(put 'sub '(polynomial polynomail)
     (lambda (x y) (tag (add-poly x (negate y)))))
