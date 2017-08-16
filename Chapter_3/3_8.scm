(define f
  (let ((second-last-call 0)
        (last-call 0))
    (lambda (n)
      ;;如果n先为0,则last-call被set为0, 第二次调用的时候set secondcall为也为0.
      ;;如果n先为1,则last-call被set为1,第二次调用的时候secondcall被set为0
      (set! second-last-call last-call)
      (set! last-call n)
      second-last-call)))
