(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((up-painter
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 1.0 1.0)))
          (down-painter
           (transform-painter painter2
                              split-point
                              (make-vect 0.0 1.0)
                              (make-vect 1.0 0.5))))
      (lambda (frame)
        (paint-bottom fram)
        (paint-top frame)))))

