(define (make-queue)
  (let* ((front-ptr '())
         (rear-ptr '())
         (queue (cons front-ptr rear-ptr)))
    (define (front-ptr) (car queue))
    (define (rear-ptr) (cdr queue))
    (define (set-front-ptr! item) (set-car! queue item))
    (define (set-rear-ptr! item) (set-cdr! queue item))
    (define (empty-queue?) (null? (front-ptr queue)))
    (define (make-queue) (cons '() '()))
    (define (front-queue)
      (if (empty-queue? queue)
          (error "FRONT called with an empty queue" queue)
          (car (front-ptr queue))))
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue? queue)
               (set-front-ptr! queue new-pair)
               (set-rear-ptr! queue new-pair)
               queue)
              (else
               (set-cdr! (rear-ptr queue) new-pair)
               (set-rear-ptr! queue new-pair)
               queue))))
    (define (delete-queue!)
      (cond ((empty-queue? queue)
             (error "DELETE called with an empty queue" queue))
            (else
             (set-front-ptr! queue (cdr (front-ptr queue)))
             queue)))
    (define (disptch m)
      (cond ((= m 'front-ptr) front-ptr)
            ((= m 'rear-ptr) rear-ptr)
            ((= m 'set-front-ptr!) set-front-ptr)
            ((= m 'set-rear-ptr!) set-rear-ptr)
            ((= m 'empty-queue?) empty-queue?)
            ((= m 'front-ptr) front-ptr)
            ((= m 'insert-queue!) insert-queue!)
            ((= m 'delete-queue!) delete-queue!)
            (else
             (error "undeined operation -- QUEUE" m))))
    (dispatch)))
