(define (print-queue queue)
  (define (iter queue p-queue)
    (let ((first (front-ptr queue))
          (last (rear-ptr queue)))
      (if (= first last)
          p-queue
          (iter (delete-queue! queue)
                (append p-queue (list (cdr first))))))))


(define (p-queue q)
  (define (iter x)
    (if (null? x)
        (newline)
        (begin (display (car x))
               (iter (cdr x)))))
  (iter (front-ptr q)))
