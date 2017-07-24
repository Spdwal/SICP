(load "fermat.scm")

(define (carmichael-test n)
  (test-iter 1 n))

(define (test-iter a n)
  (cond ((= a n)
         #t)
        ((congruent? a n)
         (test-iter (+ a 1) n))
        (else
         #f)))
;;;一个数的幂对另一个数取模的结果是不是同余。
(define (congruent? a n)
  (= (expmod a n n) a))
