;;;
;;;
;;;

(trace similarp)

(defun similarp (one two)
	(cond
		;; Base case
		( (and (endp one) (endp two) ) T )
		( (and 
			( eql (car one) (car two) ) 
			(or 
				(and
					( similarp (cadr one) (cadr two) ) 
					( similarp (caddr one) (caddr two) )
				)
			
				(and
					( similarp (cadr one) (caddr two) ) 
					( similarp (caddr one) (cadr two) )
				)
			)
		))
		( T nil )
	)
)
