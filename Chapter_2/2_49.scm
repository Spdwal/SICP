(let ((tl (make-vect 0 1))
      (tr (make-vect 1 1))
      (bl (make-vect 0 0))
      (br (make-vect 1 0)))

  (segments->painter (list
                     (make-segment bl tl)
                     (make-segment tl tr)
                     (make-segment tr br)
                     (make-segment br bl)))
  (segments->painter (list
                      (make-segment bl tr)
                      (make-segment br tl))))


