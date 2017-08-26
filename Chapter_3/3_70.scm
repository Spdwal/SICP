(define (weight1 pair)
  (+ (car pair) (car (cdr pair))))

(define (weight-> p1 p2 weight)
  (> (weight p1) (weight p2)))

(define (weight-= p1 p2 weight)
  (= (weight p1) (weight p2)))


(define (merge-weight s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((cars1 (stream-car s1))
               (cars2 (stream-car s2)))
           (cond ((weight-> (weight cars1) (weight cars2) weight)
                  (cons-stream cars2 (merge-weight s1
                                                   (stream-cdr s2)
                                                   weight)))
                 ((weight-= (weight cars1) (weight cars2) weight)
                  (cons-stream cars1 (merge-weight (stream-cdr s1)
                                                   (stream-cdr s2)
                                                   weight)))
                 (else
                  (cons-stream cars1 (merge-weight (stream-cdr s1)
                                                   s2
                                                   weight))))))))

(define (weight2 pair)
  (let ((p1 (car pair))
        (p2 (car (stream-cdr pair))))
    (+ (* 2 s1) (* 3 s2) (* 5 s1 s2))))

(define my-stream
  (stream-filter (lambda (x) (not (or (divide? 2 x) (divide? 3 x) (divide? 5)))))
  integers)

(define (weight-pairs s1 s2 weight)
  (cons-stream (list (stream-car s1) (stream-car s2))
               (merge-weight (stream-map (lambda(x) (list (stream-car s)x))
                                         (stream-cdr s2))
                             (weight-pairs (stream-cdr s1)
                                           (stream-cdr s2)
                                           weight))))

(define pairs2 (weight-pairs my-stream my-stream weight2))
