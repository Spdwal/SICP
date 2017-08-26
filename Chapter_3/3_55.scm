;;错误答案，应该右移，而不是左移，这是左移的写法
(define (partial-sums integers)
  (add-stream integers (cdr partial-sums)))

;;正确答案
(define (partial-sums s)
  (add-stream s (cons-stream 0 (partial-sums s))))
