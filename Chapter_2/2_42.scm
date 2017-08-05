(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions)  (safe? k position))
           (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-posion new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
    (queen-cols board-size))

(define empry-board '())

(define (place-queen rank file)
  (cons rank file))

(define (queen-file queen)
  (cdr queen))

(define (queen-rank queen)
  (car queen))

;;在一个棋盘上加入棋子
(define (adjoin-position rank file board)
  (cons (palce-queen rank file) board))


(define (find-first pred items)
  (cond ((null? iterms) nil)
        ((pred (car items))
         (car items))
        (else (find-first pred (cdr items)))))

(define (safe? file board)
  (define (get-queen-by-file file board)
    (find-first (lambda (queen)
                  (= (queen-file queen) file))
                board))
  (let* ((the-queen
          (get-queen-by-file file board))
         (other-queens
          (filter (lambda (q)
                    (not (and (= (queen-rank the-queen)
                                 (queen-rank q))
                              (= (queen-file the-queen)
                                 (queen-file q))))
                    board)))
         ;;cols相等
         (and (not (accumulate (lambda (p q)
                                 (or q
                                     (= (queen-rank p)
                                        (queen-rank the-queen))))
                               #f
                               other-queens))
              ;;或者是在一条斜线上
              (not (accumulate (lambda (p q)
                                 (or q
                                     (= (abs (- (queen-rank the-queen) (queen-rank p)))
                                        (abs (- (queen-file the-queen) )queen-file p))))))
              #f
              other-queens))))



