(define (smooth s)
  (stream-map (lambda (x1 x2) (/ (+ x1 x2) 2))
              s
              (stream-cdr s)))

(define (make-zero-crossings input-stream smooth)
  (let ((after-smooth (smooth input-stream)))
    (stream-map sign-change-dector input-stream (stream-cdr input-stream))))

(define (smoothed-zero-crossing data)
  (make-zero-crossings (smooth data)))
