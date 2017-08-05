
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (reverse List)
  (append (reverse (cdr List)) (cons (car items) nil)))
