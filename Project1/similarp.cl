;;; Program for checking if two binary trees are similar. Binary trees are 
;;; similar if they share the same root node and their children are 
;;; consistently structured and share identical contents. 
;;; 
;;; Written by Andrew Lyne February 24, 2015
;;;
;;;

;(trace similarp)

(defun similarp (one two)
	(cond
		;; Base case - both trees are nil. Return true.
		( (and (endp one) (endp two) ) T )
		
		;;Recursive case - Returns true if the following are true:
		;; - Root element of tree one and two are the same.
		;; - either:
		;;   1) Tree one's left child is similar to tree two's left child
		;;     AND 
		;;     Tree one's right child is similar to tree two's right child.
		;;
		;;   2) Tree one's left child is similar to tree two's right child
		;;     AND 
		;;     Tree one's right child is similar to tree two's left child.

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
