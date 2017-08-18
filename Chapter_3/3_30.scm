(define (ripple-carry-adder Ak Bk Sk C)
  (define (iter a b s c-in c-out)
    (if (null? a)
        s
        (begin (full-adder (car a) (car b) c-in (car s) c-out)
               (iter (cdr a) (cdr b) (cdr s) (c-out) (make-wire)))))
  ;;make-wire只是一条连线，供人使用而以，c-in等等，也是连线。
  (iter Ak Bk Sk C (make-wire)))
