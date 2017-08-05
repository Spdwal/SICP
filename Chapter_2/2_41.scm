(define (f-sum-euqal? i j k s)
  (= (+ i j k)
     s))

(define (make-triple i j k)
  (list i j k))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))


(define (ordered-triples-sum n s)
  (filter (lambda (list) (= (accumulate + 0 list) s))
          (flatmap
           (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 (- j i))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n))))
