(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (if (null? set2)
      set1
      (union-set (adjoin-set (car set2) set1) (cdr set2))))

;;只删除遇到的第一个
(define (remove-set-element x set)
  (define (remove-set-element-iter acc rest)
    (cond ((null? rest) acc)
          ((equal? x (car rest)) (append acc (cdr rest)))
          (else (remove-set-element-iter (adjoin-set (car rest) acc) (cdr rest)))))
  (remove-set-element-iter '() set))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) (remove-set-element (car set1) set2))))
        (else (intersection-set (cdr set1) set2))))
