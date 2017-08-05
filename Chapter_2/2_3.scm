(load "2_2.scm")
(define (rec-make ))

(define (perimeter-rec r)
  (let ((length (length-of-rectangle r))
        (width (width-of-rectangle r)))
    (* 2 (+ length width))))

(define (area-rec r)
  (let ((length (length-of rectangle r))
        (width (width-of0rectangle r)))
    (* length width)))

(define (make-rec length-1 length-2 width-1 width-2)
  (cons (cons length-1 length-2)
        (cons width-1 width-2)))

(define (length-1-rec r)
  (car (car r)))

(define (length-2-rec r)
  (car (cdr r)))

(define (width-1-rec r)
  (cdr (car r)))

(define (width-2-rec r)
  (cdr (cdr r)))

(define (length-of-rec r)
  (let ((length (length-1-rec r)))
    (let ((start (start-segment length))
          (end (end-segment length)))
      (- (x-point end)
         (x-point start)))))


(define (width-of-rec r)
  (let ((width (width-1-rec r)))
    (let ((start (start-segment width))
          (end (end-setment width)))
      (- (y-point end)
         (y-point start)))))
