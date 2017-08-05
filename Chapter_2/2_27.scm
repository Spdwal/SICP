((define x (list (list 1 2) (list 3 (list 4 5)))))

(define nil '())

(define (reverse items)
  (define (rev-imp items result)
    (if (null? items)
        result
        (rev-imp (cdr items) (cons (car items) result))))
  (rev-imp items nil))

;;result 最先为nil然后一层一层累加上去。
(define (deep-reverse items)
  (define (deep-rev-imp items result)
    (if (null? items)
        result
        (let ((first (car items)))
          (deep-rev-imp (cdr items)
                        (cons (if (not (pair? first))
                                  first
                                  (deep-reverse first))
                              result)))))
  (deep-rev-imp items nil))
