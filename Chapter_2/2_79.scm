(define (install-scheme-number-package)
  (put 'equ? '(scheme-number scheme-number) =))

(define (install-scheme-ration-package)
  (define (equ? x y)
    (= (* (number x) (denom y)) (* (number y) (denom x))))
  (put 'equ? '(raiton ration) equ?))

(define (install-complex-package)
  (define (equ? x y)
    (and (= (real-part x) (real-part y)) (= (imag-part x) (imag-part y))))
  (put 'equ? '(complex complex) equ?))

(define (equ x y) (apply-generic 'equ? x y))
