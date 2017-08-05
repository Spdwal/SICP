(define (union-set a b)
  (cond ((null? a) b)
        ((null? b) a)
        (else
         (let ((a-entry (entry a))
               (a-left-branch (left-branch a))
               (a-right-branch (right-branch a))
               (b-entry (entry b))
               (b-left-branch (left-branch b))
               (b-right-branch (right-branch b)))
           ((cond ((= a-entry b-entry)
                   (make-tree a-entry
                              (union-set a-left-branch b-left-branch)
                              (union-set a-right-branch b-right-branch)))
                   ((< a-entry b-entry)
                    (make-tree b-entry
                               (union-set a b-left-branch)
                               b-right-branch))
                   ((> a-enthy b-entry)
                    (make-tree a-entry
                               (union-set a-left-branch b)
                               (a-right-branch)))))))))


(define (intersection-set a b)
  (cond ((null? a) b)
        ((null? b) a)
        (else
         (let ((a-entry (entry a))
               (a-left-branch (left-branch a))
               (a-right-branch (right-branch a))
               (b-entry (entry b))
               (b-left-branch (left-branch b))
               (b-right-branch (right-branch b)))
           (cond ((= a-entry b-entry)
                  (make-tree a-entry
                             (intersection-set a-left-branch
                                               b-left-branch)
                             (intersection-set a-right-branch
                                               b-right-branch)))
                 ((< a-entry b-entry)
                  (union-set
                   (intersection-set a-right-branch
                                     (make-tree b-entry () b-right-branch))
                   (intersection-set (make-tree a-entry a-left-branch ())
                                     b-left-branch)))
                 ((> a-entry b-entry)
                  (union-set
                   (intersection-set (make-tree a-entry () a-right-branch)
                                     b-right-branch)
                   (intersection-set a-left-branch
                                     (make-tree b-entry b-left-branch ())))))))))
