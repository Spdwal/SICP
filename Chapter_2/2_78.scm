(define (attach-tag type-tag contents)
  (if (number? contents)
      contents
      (cons type-tag contents)))


(define (type-tag datnum)
  (cond ((number? datnum) 'scheme-number)
        ((pair? datnum) (car datnum))
        (else
         (error "Wrong datnum -- CONTENTS" datnum))))


(define (contents datnum)
  (cond ((number? datnum) datnum)
        ((pair? datnum) (cdr datnum))
        (else
         (error "Wrong datnum -- CONTENTS" datnum))))
