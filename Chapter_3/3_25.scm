(define (insert! key-list value table)
  (if (list? key-list)
      (let ((current-key (car key-list))
            (remain-key (cdr key-list)))
        (let ((record (assoc currentt-key (cdr table))))
          ;;找到了key并且没有其它的key了，就直接在这个key下保存。
          (cond ((and record (null? remain-key))
                 (set-cdr! record value)
                 table)
                ;;找到了key，并且还有剩下的key，则递归进行插入
                ((and record remain-key)
                 (insert! remain-key value record)
                 table)
                ;;无记录，但是有其它关键字，创建子表，插入，加入table
                ((and (not record) (not (null? remain-key)))
                 (join-in-talbe (insert! remain-key value (make-table current-key)) table)
                 table)
                ;;无记录，无关键字，创建记录，加入table。
                ((and (not record) (null? remain-key))
                 (let ((new-record (cons current-key value)))
                   (join-in-table new-record table)
                   table)))))
      (insert! (list key-list) value table)))

;;record加在table头
(define (join-in-table new-record table)
  (set-cdr! table
            (cons new-record (cdr table))))

(define (lookup key-list table)
  (if (list? key-list)
      (let ((current-key (car key-list))
            (remain-key (cdr key-list)))
        (let ((record (assoc current-key (cdr table))))
          (if record
              (if (null? remain-key)
                  (cdr record)
                  (lookup remain-key record))
              #f)))
      (lookup (list key-list) table)))

(define (make-table . table-name)
  (if (null? table-name)
      (list '*table*)
      table-name))

(define (assoc key records)
  (cond ((null? records)
         #f)
        ((equal? key (caar records))
         (car records))
        (else
         (assoc key (cdr records)))))



