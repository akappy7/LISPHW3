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

(defun rdouble (y)
	(cond(
		(not (null y))
		(cond
			(
				(atom (car y))
				(cons (car y) (cons (car y) (rdouble (cdr y))))
			)
			(
				(not (atom (car y)))
				(cons (rdouble (car y)) (rdouble (cdr y)))
			)
		)
	))
)

(defun rewrite (y) 
	(cond(
		(not (null y))
		(cond
			(
				(atom y)
				y
			)
			(
				(atom (car y))
				(cond
					(;if the s-expression is an if
						(equal 'if (car y))
						(append
							'(cond) ;need to check if last element is list, atom, or even exists vvv
							(list (list (rewrite (cadr y)) (rewrite(caddr y))) 
								(cond
									(
										(equal (length y) 4) ;y has an else statement <- need to provide a case for no else statement
										(cond
											(
												(atom (cadddr y)) ;length of else statement is 1, is an atom
												(list 'T (cadddr y)) ;is an atom, wont recurse
											)
											(
												'T ;length is not 1, else is an s expression, must recurse
												(list 'T (rewrite (cadddr y))) 
											)
										)
									)
									(;no else statement, generates an explicit nil return if statement is false
										'T ;^^^^ need a better way
										(list 'T NIL)
									)
								)
							)
						)
					)
					(
						'T ;if the atom is not an if continue copying
						(cons (car y) (rewrite (cdr y)))
					)
				)
			)
			(
				(not (atom (car y)))
				(cons (rewrite(car y)) (rewrite(cdr y)))
			)
		))
	)
)