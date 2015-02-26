;;; Program for removing duplicate elements from a list.
;;; 
;;; Written by Andrew Lyne February 24, 2015

;(trace dupfilter)
;(trace dup)

; Verifies input is correct format. If so calls recursive helper function 
; and returns its results. Requires only a list to process as an 
; argument. 

(defun dupfilter (ele)
	(cond
		((listp ele)
			(reverse (dup ele '()))
		)
		((atom ele) 
			ele 
		)
		( T nil)
	)
)


; Recursive function to remove duplicate elements form a list. Requires a list
; to parse and a result list. 
(defun dup (lst results)
	(cond
		;; Base case - The list to parse is empty. Return the current 
		;; contents of the result list. 
		((endp lst)  results)
		
		;; Takes the first element of the list and check if it is 
		;; contained in the result list. If it is not, the function 
		;; is called recursivly with the search list minus the first 
		;; element and the result list with the additional element.
		;; added. 
		;;
		;; Otherwise, the function is called recursivly with the first 
		;; list minus the first element and the result list as is. 
		(
			(endp ( member (car lst) results :test 'equal))
			(dup ( cdr lst) (cons  (car lst) results))
		)
		( 
			T
			(dup ( cdr lst) results )
		)
	)
)
