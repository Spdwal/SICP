(define (stream-map proc . argstreams)
  (if (null? (car argstreams))
      the-empty-stream
      (cons
       (apply proc (map (lambda(s) (stream-car s) argstreams))
       (apply stream-map
              (cons proc (map (lambda(s) (stream-cdr s)) argstreams))))))
