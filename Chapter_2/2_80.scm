(define (install-scheme-number-package)
  (define (=zero? x)
    (= x 0))
  (put '=zero? '(scheme-number scheme-number) =zero?))

(define (install-rational-package)
  (define (=zero? x)
    (and (= (numer x) 0) (not (= (denom x) 0))))
  (put '=zero? '(rational rational) =zero?))

(define (install-commplex-package)
  (define (=zero? x)
    (and (= (real-part x) 0) (= (imag-part x) 0)))
  (put '=zero? '(complex complex) =zero?))

(define (=zero? x) (apply-generic '=zeor? x))

