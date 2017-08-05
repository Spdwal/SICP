(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (make-rat-better n d)
  (if (< (* n d) 0)
      (make-rat (- n) (abs d))
      (make-rat n d)))

(define (makt-rat-best n d)
  (if (< d 0)
      (cons (- n) (- d))
      (cons n d)))
