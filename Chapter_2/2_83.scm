(define (raise x) (apply-generic 'raise x))
;;整数变成分数
(put 'raise 'integer
     (lambda (x) (make-rational x 1)))
;;分数变成有理数
(put 'raise 'rational
     (lambda (x) (make-real (/ (number x) (denom x)))))
;;实数变虚数
(put 'raise 'real
     (lambda (x) (make-from-real-imag x 0)))
