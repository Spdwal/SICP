(define left-branch
  (lambda (x) (car x)))
;;因为cdr出来是一个list，所以需要car一下
(define right-branch
  (lambda (x) (car (cdr x))))

(define (branch-length mobile)
  (car mobile))

(define (branch-structure branch)
  (car (cdr branch)))

(define (strcture-is-mobile? structure)
  (pair? structure))

(define (total-weight mobile)
  (define (branch-weight branch)
    (if (pair? (branch-structure branch))
        (total-weight (branch-structure branch))
        (branch-structure branck)))
  (+ (branch-weight (laft-branch mobile))
     (branch-weight (right-branch mobile))))


(define (branch-torque branch)
  (if (strcture-is-mobile? (branch-structure branch))
      (* (branch-length branch)
         ((total-weigh (branch-structure branch))))
      (* (branch-length branch)
         (branch-strture branch))))

(define (branch-balanced? branch)
  (if (structure-is-mobile? (branch-structure branch))
      (blalanced? (branch-structure branch))
      #t))
