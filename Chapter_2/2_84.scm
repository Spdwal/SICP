(define (apply-generic op . args)
  (define (raise-into s t)
    (let ((s-type (type-tag s))
          (t-type (type-tag t)))
      (cond ((equal? s-type t-type) s)
            ;;如果可以从表中找到stype的raise过程
            ((get 'raise (list s-type))
             (raise-into ((get 'raise (list s-type)) (concents)) t))
            (else #f))))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((a1 (car args))
                    (a2 (dadr args)))
                ;;a1 a2传入raise-into中，以此来识别使用哪个raise函数
                (cond
                 ((raise-into a1 a2)
                  (apply-generic op (raise-into a1 a2) a2))
                 ((raise-into a2 a1)
                  (apply-generic op a1 (raise-into a2 a1)))
                 (else (error "No method for these types"
                              (list op type-tags)))))
              (error "No method for these types"
                     (list op type-tags)))))))
