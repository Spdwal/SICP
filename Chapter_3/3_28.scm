(define (or-gate a1 a2 output)
  (define (or-action-proc)
    (let ((new-value
           (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 or-action-proc)
  (add-action! a2 or-action-proc)
  'ok)

(define (logical-or a1 a2)
  (cond ((or (= a1 1) (= a2 1)) 1)
        ((and (= a1 0) (= a2 0)) 0)
        (else
         (error "WRONG INPUT"))))
