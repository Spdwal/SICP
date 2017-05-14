#! /usr/bin/scheme --script
(define (square x) (* x x))

(define (sum-of-square x y)
  (+ (square x)
     (square y)))

(define (big x y)
  (cond ((> x y) x)
        ((> y x) y)
        ((= y x) x)))

(define (small x y)
  (cond ((> x y) y)
        ((> y x) x)
        ((= x y) x)))

(define (max x y z)
  (big (big x y) z))

(define (another-bigger x y z)
  (big (small x y) z))

(define (func x y z)
  (sum-of-square (big x y)
                 (another-bigger x y z))) ;Boooooooooom!

(display (func 5 2 3))
