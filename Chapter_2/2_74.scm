(define (get-record division employee-name)
  ((get division 'record) employee-name))

(define (get-salary division employee-name)
  ((get division 'salary) employee-name))

(define (find-employee-record division-list employee-name)
  (if (null? division-list)
      #f
      (cons (get-record (car division-list) employee-name)
            (find-employee-record (cdr division-list) employee-name))))
