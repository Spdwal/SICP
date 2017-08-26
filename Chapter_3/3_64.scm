(define (stream-limit s number)
  (let ((s1 (stream-car s))
        (s2 (stream-car (stream-cdr s))))
    (if (< (abs (- s1 s2)) (abs number))
        s2
        (stream-limit (cdr-stream s) number))))
