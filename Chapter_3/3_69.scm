(define (triples s t u)
  (cons-stream (list (stream-car s)
                     (stream-car t)
                     (stream-car u))
               (interleave
                (stream-map (lambda (x)(cons (stream-car s) x))
                            (stream-cdr (pairs t u)))
                (triples (stream-cdr s)
                         (stream-cdr t)
                         (stream-cdr u)))))


(define (phythagorean-numbers)
  (define numbers (triples integers integers integers))
  (stream-filter (lambda (x) (= (square (stream-car (stream-cdr (stream-cdr x))))
                                (= (square (stream-car x))
                                   (sqaure (stream-car (stream-cdr x))))))
                 numbers))
