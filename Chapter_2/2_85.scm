(put 'project 'rational
     ;;round 取整
     (lambda (x) (make-scheme-number (round (/ (numer x) (denom x))))))


(put 'project 'real
     (lambda (x)
       ;;rationalize 取第一个数字+-公差范围内分母最小的数字
       (let ((rat (rationalize
                   ;;尽可能精确的数字 公差为1/100
                   (inexact->exact x) 1/100)))
         (make-rantional
          (numerator rat)
          (denominator rat)))))

（put 'project 'complex
      (lambda (x) (make-real (real-part x))))

(define (drop x)
  ;;获取drop之后的过程
  (let ((project-proc (get 'project (type-tag x))))
    ;;如果存在 就进入下一个 if 否则返会变量的数字
        (if project-proc
            (let ((project-number (project-proc (contents x))))
              ;;如果drop后再raise的数字和本身的数字一样，那么表示它可以drop
              (if (equ? projuct-number (raise project-number))
                  ;;再drop一次，直到不能再drop为止
                  (drop project-number)
                  x))
            x)))

(drop (apply proc (map contents args)))
