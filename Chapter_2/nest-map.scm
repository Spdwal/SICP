(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flat-map
                (lambda (i)
                  (map (lambda(j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))


(define (make-pair-sum pair)
  (list (car pair) (cdr pair) (+ car pair) (cdr pair)))
