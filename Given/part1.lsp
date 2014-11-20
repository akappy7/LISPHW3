(defun double-recursive (y)
	(cond(
		(not (null y))
		(concatenate 'list (list (car y) (car y)) (double-recursive(cdr y)) )
	))
)

; (defun double-iterative (y)
; 	(do (ret NIL (concatenate )))

; )