(define (rand-generator commands)
  (define (rand-helper num remainning-commands)
    (let ((next-command (stream-car remaining-commands)))
      (cond ((eq? next-command 'generate)
             (cons-stream num
                          (rand-helper (rand-update num)
                                       (stream-cdr remaining-commmands))))
            ((pair? next-command)
             (if (eq? (car next-command) 'reset)
                 (cons-stream (cdr (stream-car remaining-commands))
                              (rand-helper (rand-update (cdr (stream-car remaining-commands)))
                                           (stream-cdr remaining-commands)))
                 (error "bad command --" next-command)))
            (else (error "bad command -- " next-command)))))
  (rand-helper rand-init commands))