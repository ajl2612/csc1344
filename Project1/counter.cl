;;; Counter program for counting the number of elements in a list and 
;;; printing the inst back in a particular format.
;;; 
;;; Written by Andrew Lyne February 24, 2015

;;; Checks to make sure passed parameter is a list. Returns nil otherwise. 
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


;;; Used to call helper_function_2 on each element of the parameter list. 
;;; Automatically removes -1 flag to indicate space character needed. 
(defun counter_helper (ele)
	(remove '-1 
		(append (list (length ele)) (mapcar (function counter_helper_2) ele))
	))
 

;;; Recursivly calls helper_function if element passes is a list or returns -1
;;; to indicate non-list element. 
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
	



