(define (div-terms L1 L2)
  (if (empty-termlist? L1)
      (list (the-empty-termlist) (the-empty-termlist))
      (let ((t1 (first-term L1))
            (t2 (first-term L2)))
        (if (> (order t1)(order t2))
            (list (the-empty-termlist) L1)
            (let ((new-c (div (coeff t1) (coeff t2)))
                  (new-o (- (order t1) (order t2))))
              (let ((rest-of-result
                     (div-terms (sub-terms L1
                                           (mul-terms L2
                                                      (list (make-term new-o new-c)))
                                (list (adjoin-term (make-term new-o new-c)
                                                   ;;rest-of-result返会一个pair 第一个元素是它的 (new-o new-c)，第二个元素是余数
                                                   (car rest-of-result))
                                      (cadr rest-of-result)))))))))))

(define (div-poly poly1 poly2)
  (if (same-variable? (variable poly1) (variable poly2))
      (make-poly (variable poly1)
                 (div-terms (term-list poly1)
                            (term-list poly2)))
      (error "not the same variable" (list poly1 poly2))))
