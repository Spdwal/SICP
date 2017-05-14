#! /usr/bin/scheme --script
(define (average x y)
  (/ (+ x y) 2))

(define (abs x)
  (if (< x 0)
      (- x)
      x))


(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? old-guess new-guess)
  (> 0.0001
     (/ (abs (- new-guess old-guess))
       old-guess)))

(define (square x)
  (* x x))


(define (sqrt-iter guess x)
    (if (good-enough? guess (improve guess x))  ; 调用新的 good-enough?
        (improve guess x)
        (sqrt-iter (improve guess x)
                   x)))

(display (sqrt-iter 2 2))
