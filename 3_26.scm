(define (entry tree) (car tree))

(define (tree-key tree) (car tree))

(define (tree-value tree) (cdr tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= (car x) (tree-key (entry set))) set)
        ((< (car x) (tree-key (entry set)))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((< (car x) (car (entry set)))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))

(define (make-table)
  (let ((local-table '()))
    (define (lookup key records)
      (cond ((null? records) #f)
            ((= key (tree-key (entry records))) (entry records))
            ((< key (tree-key (entry records))) (lookup key (left-branch records)))
            ((> key (tree-key (entry records))) (lookup key (right-branch records)))))
    (define (insert! key value)
      (let ((recocrd (lookup key local-table)))
        (if record
            ;;如果已经存在key，则更新value
            (set-cdr! record value)
            ;;如果不存在，则添加节点
            (set! local-table (adjoin-set (cons key value) local-table)))))
    (define (get key)
      (lookup key local-table))
    (define (dispatch m)
      (cond ((eq? m 'get-proc) get)
            ((eq? m 'insert-proc) insert!)
            ((eq? m 'print) local-table)
            (else (error "Undefined operation --TABLE" m))))
    dispatch))

(define table (make-table))

(define get (tablee 'get-proc))

(define put (table 'insert-proc))
