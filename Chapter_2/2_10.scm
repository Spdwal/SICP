(define (div-interval x y)
  (if (or (not-unsign x)
          (not-unsign y))
      (error "Warning, the bounds are beyond zero!")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (not-unsign x)
  (< (* (upper-bound x)
        (lower-bound x))
     0))
