(defun double-recursive (y)
    (cond(
        (not (atom y)))
	    (cond(
		(not (null y))
		(append (list (car y) (car y)) (double-recursive(cdr y)) )
	)
    )
    )

)

(defun double-iterative (y)
	(do 
		(
			(ret NIL (cons (nth index y) (cons (nth index y) ret)))
			(index 0 (+ index 1))
		)
			((null (nth index y)) (reverse ret))
	)

)
(defun double-mapcar (y)
    (apply #'append (mapcar #'list y y ))


)
