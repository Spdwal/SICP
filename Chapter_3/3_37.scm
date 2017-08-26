(define (c* x y)
  (let ((z (make-connector)))
    (mul x y z)
    z))

(define (cv x)
  (let ((z (make-connector)))
    (constant x z)
    z))

(define (c- x y)
  (let ((z (make-connector))
        (-y (make-connector)))
    (set-value! -y (- (get-value y)))
    (adder x -y z)
    z))
