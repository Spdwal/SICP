(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      (improve guess x)
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average-3  (/ x (square guess)) (* 2 guess)))

(define (average-3 x y)
  (/ (+ x y) 3))

(define (good-enough? guess x)
  (<
   (/
    (abs (- guess x))
    guess)
   0.001))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x)
  (* x x))

(define (sqrt-3 x)
  (sqrt-iter 1.0 x))
