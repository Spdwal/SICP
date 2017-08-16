(define (make-dlink value prev next)
  (cons (cons value prev) next))

(define (value-dlink dlink)
  (car (car dlink)))

(define (next-dlink dlink)
  (cdr dlink))

(define (prev-dlink d-link)
  (cdar dlink))

(define (set-value-dlink! dlink item)
  (set-car! (car d-link item)))

(define (set-next-dlink! dlink ref)
  (set-cdr! dlink ref))

(define (set-prev-dlink! dlink ref)
  (set-cdr! (car dlink) ref))

(define (push-prev-dlink! dlink value)
  (and (not (null (prev-dlink dlink)))
       (error "PUSH-PREV called on a middle link" dlink))
  (let ((new-pair (make-dlink value null dlink)))
    (set-prev-dlink! dlink new-pair)
    new-pair))

(define (push-next-dlink! dlink value)
  (and (not (null (next-dlink dlink)))
       (error "PUSH-NEXT called on a middle link" dlink))
  (let ((new-pair (make-dlink value dlink null)))
    (set-next-dlink! dlink new-pair)
    new-pair))

(define (make-deque)
  (cons '() '()))

(define (front-ptr deque) (car deque))

(define (rear-ptr deque) (cdr deque))

(define (empty-deque? deque)
  (null? (front-ptr deque)))

(define (set-front-ptr! deque v)(set-car! deque v))

(define (set-rear-ptr! deque v) (set-cdr! deque v))

(define (front-deque deque)
  (if (empty?-deque deque)
      (error "FRONT called with an empty deque" deque)
      (car (front-ptr deque))))

(define (rear-deque deque)
  (if (empty?-deque deque)
      (error "REAR called with an empty deque" deque)
      (car (rear-ptr deque))))

(define *front* (lambda(x y) x))

(define *rear* (lambda (x y) y))

(define (insert-deque! side deque item)
  (cond ((empty-deque? deque)
         (let ((new-pair (make-dlink item '() '())))
           (set-front-ptr! deque new-pair)
           (set-rear-ptr! deque new-pair)))
        (else
         (let ((push-re-dlink! (side push-prev-dlink! push-next-dlink!))
               (ptr (side front-ptr rear-ptr))
               (set-ptr! (side set-front-ptr! set-rear-ptr!)))
           (let ((new-pair (push-ref-dlink! (ptr deque) item)))
             (set-ptr! deque new-pair)))))
  deque)

(define (front-insert-deque! deque item)
  (insert-deque! *front* deque item))

(define (rear-insert-deque! deque item)
  (insert-deque! *rear* deque item))

(define (delete-deque! side deque)
  (if (empty-deque? deque)
      (error "DELETE called with an empty deque" deque)
      (let ((ptr (side front-ptr rear-ptr))
            (set-ptr! (side set-fron-ptr! set-rear-ptr!))
            (ref-dlink (side next-dlink prev-dlink))
            (set-ref-new-dlink! (side set-prev-dlink! set-next-dlink!))
            (set-ref-poped-dlink! (side set-next-dlink! set-prev-dlink!)))
        (let* ((pop (ptr deque))
               (new-tip (ref-dlink pop)))
          (cond ((pair? new-tip)
                 (set-ref-new-dlink! new-tip null)
                 (set-ptr! deque new-tip))
                (else
                 (set-front-ptr! deque null)
                 (set-rear-ptr! deque null)))
          (set ref-popped-dlilnk! pop null)
          (value-dlink pop)))))

(define (front-delete-deque! deque)
  (delete-deque! *front* deque))

(define (rear-delete-deque! deque)
  (delete-deque! *rear* deque))
