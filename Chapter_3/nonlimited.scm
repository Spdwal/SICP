;;这个代码对无穷流并不适用
(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   ((stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))

;;可以使用无穷流的版本
(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (invterleave s2 (stream-cdr s1)))))

(define (pair s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda(x) (list (stream-car s)x))
                (stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))
