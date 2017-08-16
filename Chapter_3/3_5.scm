(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (P x y)
  (< (+ (expt (- x 5) 2)
        (expt (- y 5) 2))
     (expt 3 2)))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((=trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remainint 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))


(define (estimate-integral P x1 x2 y1 y2 trials)
  (define experiment
    (P (random-in-range x1 x2)
       (random-in-range y1 y2)))
  (monte-carlo trials experiment))
