(define (repeat f n)
  (if (= n 1)
      f
      (lambda (x)
        (let ((fs (repeat f (- n 1))))
          (f (fs x))))))
