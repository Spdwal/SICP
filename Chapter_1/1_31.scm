(define (odd? n)
  (= (remainder n 2) 1))

(define (even? n)
  (= (remainder n 2) 0))


(define (up n)
  (if (odd? n)
      (+ n 1)
      (+ n 2)))

(define (down n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))

(define (element n)
  (/ (up n) (down n)))

(define (product begin end next func)
  (if (> begin end)
      1
      (* (func begin)
         (product (next begin) end next func))))
(define (next n)
  (+ n 1))

(define (pi n)
  (* 4
     (product 1 n next element)))

(define (pro-iter begin end next func result)
  (if (> begin end)
      result
      (pro-iter (next begin) end next func (* result (func a)))))
