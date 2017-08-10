(define (pseudoremainder-terms a b)
  (let* ((o1 (order (first-term a)))
         (o2 (order (first-term b)))
         (c (coeff (first-term b)))
         (divident (mul-terms (make-term 0
                                         (expt c (+ 1 (- o1 o2))))
                              a)))
    ;;divident即是乘过一个整数的a，这里pseudoremainder－terms得到一个伪余
    (cadr (div-terms divident b))))

(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (pseudoremainder-terms a b))))

(define (gcd-terms a b)
  (if (empty-termlist? b)
      (let* ((coeff-list (map cadr a))
             ;;系数的最大公约数，这里假设多项式本来是不可化简的形式
             (gcd-coeff (apply gcd coeff-list)))
        (div-terms a (make-term 0 gcd-coeff)))
      (gcd-terms b (pseudoremainder-terms a b))))
