(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map sub-tree f)
             (f tree)))
       tree))
