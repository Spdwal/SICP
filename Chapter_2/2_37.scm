(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (m-row) (dot-product m-row v)) m))

(define (transpose m)
  (accumulate-n cons '() m))


(define (matrix-*-matrix m n)
  (let ((n-cols (transpose n)))
    (map (lambda (m-row)
           (map (lambda (n-col)
                  (dot-product m-row n-col))
                n-cols))
         m)))
