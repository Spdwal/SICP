(define (apply-generic op . arg)
  ;;确定所有的方法都可以在方法集合里找到
  (define (can-coerced-into? types target-type)
    (andmap
     (lambda (type)
       (or (equal? type target-type)
           (get-coercion type target-type)))
     types))
  ;;找到一个可以用的方法
  (define (find-coerced-type types)
    (ormap
     (lambda (target-type)
       (if (can-coerced-into? types target type)
           target-type
           #f))
     types))
  ;;将所有过程应用于 args
  (define (coerced-all target-type)
    (map
     (lambda (arg)
       (let ((arg-type (type-tag arg)))
         (if (equal? arg-type target-type)
             arg
             ((get-coercion arg-type target-type) arg))))
     args))
  ;;获取所有type-tags
  (let ((type-tags (map type-tag args))
        ;;获取处理过程
        (let ((proc (get op type-tags)))
          (if proc
              ;;对args进行处理
              (apply proc (map contents args))
              (let ((target-type (find-coerced-type types)))
                ;;如果可以找到可以用的类型处理过程
                (if target-type
                    (apply apply-generic
                           (append (list op) (coerced-all target-type)))
                    (error "no method for these types" (list op type-args)))))))))
