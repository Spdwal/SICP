(define (square-sum p)
  (let ((i (car p))
        (j (cadr p)))
    (+ (square i) (square j))))


(define (func s pre pre-pre)
  (let ((num (square-sum (stream-car s))))
    (if (and (= pre pre-pre) (= num pre))
        (cons-stream num
                     (func (stream-cdr s) num pre))
        (func (stream-cdr s) num pre))))
