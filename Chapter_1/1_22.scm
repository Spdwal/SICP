(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (and (or (odd? n) (= n 2))
       (= n (smallest-divisor n))))

(define (smallest-divisor n)
  (find-divisor n 3))

(define (odd? n)
  (= (remainder n 2) 1))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 2)))))

(define (square x)
  (* x x))
(define (divides? a b)
  (= (remainder b a) 0))

(define (next-odd n)
  (if (odd? n)
      (+ 2 n)
      (+ 1 n)))

(define (continue-primes n count)
  (cond ((= count 0)
         (display "are primes"))
        ((prime? n)
         (display n)
         (newline)
         (continue-primes (next-odd n) (- count 1)))
        (else
         (continue-primes (next-odd n) count))))

(define (test-foo)
  (let ((start-time (real-time)))
    (foo)
    (- (real-time) start-time)))

(define (search-for-primes n)
  (let ((start-time (real-time)))
    (continue-primes n 3)
    (- (real-time) start-time)))
