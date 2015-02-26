;;; Program which takes three arguments: two s-expressions and a list. Function 
;;; will examine the third argument, looking for occurrences of the first 
;;; argument and replacing them with the second argument. 
;;; 
;;; Written by Andrew Lyne February 24, 2015;;;

;(trace repl)
;(trace repl_rec)

(defun repl (val rpl lst)
	(cond 
		( (listp lst ) (reverse (repl_rec val rpl lst '() ) ) )
	)
	;( repl_rec val rpl lst '() )
)

(defun repl_rec ( val rpl inlst outlst)
	(cond
		;; Base Case, inlist is empty. return outlist.
		( ( equal inlst  '() ) outlst )
		
		;; Rec case - The first element is a match. 
		((equal (car inlst) val) (repl_rec val rpl (cdr inlst) (cons rpl outlst)))
		
		;; Recursive Case: Remove the first element of the inlst and process it. 
        	(T
	      		(cond
	              	;; The first value is a list. Recursivly call The function, add the results 
			;; into a list and add car that to the outlist. 
			(	
				(listp (car inlst)) 
				(repl_rec val rpl (cdr inlst) (cons (repl val rpl (car inlst)) outlst))
			)

			;; The first value is an atom but not what we are looking for. Append it to 
			;; the outlis it and move on. 
			(
				(atom (car inlst)) 
				(repl_rec val rpl (cdr inlst) (cons (car inlst) outlst))
			)
			
			)
		)
	)
)

