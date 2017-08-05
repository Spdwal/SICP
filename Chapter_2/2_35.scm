(define (count-leaves t)
  (accumulate + 0
              (map
               (lambda (t)
                 (cond ((null? t) 0)
                       ((pair? t) (count-leaves t))
                       (else 1)))
               t)))
