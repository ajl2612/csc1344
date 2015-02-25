;;; 
;;; put comments here
(defun counter (ele)
	(cond
	((listp ele)
		(counter_helper ele)
	)
	((atom ele) 
		NIL 
	)
	( T nil)
	)
)


(defun counter_helper (ele)
	(remove '-1 
		(append (list (length ele)) (mapcar (function counter_helper_2) ele))
	))
 

(defun counter_helper_2 (ele)
	(cond
	((listp ele) 
		(counter_helper ele)
	)
	((atom ele)
		-1		
	)
	(T nil)
	)
)
	



