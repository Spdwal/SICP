(define (loop? lst)
  (let ((identity (cons '() '())))
    (define (iter remain-list)
      (cond ((null? remain-list) #f)
            ((eq? identity (car remain-list))
             #t)
            (else
             (set-car! remain-list identity)
             (iter (cdr remain-list)))))
    (iter lst)))
;;identity只是一个 特殊的标示符，没有其它的意思
