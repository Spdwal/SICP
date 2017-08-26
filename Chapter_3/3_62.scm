(define (div-series s1 s2)
  (let ((c (stream-car s2)))
    (if (= c 0)
        (error "constant terms of s2 can't be 0")
        (scale-stream (mul-series s1
                                  ;;必须要做出一个常数项为1的级数，
                                  ;;所以有(scale-stream s2 (/ 1 c))这一步
                                  ;;且最后又用sacle-stream乘来回归
                                  (reciprocal-series (scale-stream s2 (/1 c))))
                      ;;因为前面用了reciprocal来求倒数，所以这里用(/ 1 c)
                      (/ 1 c)))))
