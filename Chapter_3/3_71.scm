(define (tri-sum p)
  (let ((i (car p))
        (j (cadr p)))
    (+ (* i i i) (* j j j))))

(define sorted-pairs (weight-pairs tri-sum integers integers))

(define (raman s pre)
  (let ((num (tri-sum (stream-car s))))
    (if (= pre num)
        (cons-stream num
                     (raman (stream-cdr s) num))
        (raman (stream-cdr s) num))))
