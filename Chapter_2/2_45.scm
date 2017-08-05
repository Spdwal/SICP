(define right-split (split beside below))

(define (split indentity1 indentity2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split indentify1 indentify2) painter (- n 1))))
          (indentify1 painter (indentify2 smaller smaller))))))
