(load "1_45.scm")
(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define tolerance 0.00001)
;;求不动点
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;;base^n
(define (expt base n)
  (if (= n 0)
      1
      ((repeat (lambda (x) (* base x)) n) 1)))

;;求多少次平均阻尼

(define (average-damp-n-times f n)
  ((repeat average-damp n) f))

(define (damped-nth-root n damp-times)
  (lambda (x)
    (fixed-point
     (average-damp-n-times
      (lambda (y)
        (/ x (expt y (- n 1))))
      damp-times)
     1.0)))

