(defun double-recursive (y)
	(cond(
		(not (null y))
		(concatenate 'list (list (car y) (car y)) (double-recursive(cdr y)) )
	))
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