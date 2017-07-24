(load "1_37.scm")
(define (DFC i)
  (if (= (remainder i 3) 2)
      (* 2 (/ (+ i 1) 3))
      1
      ))

