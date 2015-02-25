;;;
;;;
;;;

(trace dupfilter)
(trace dup)

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

(defun dup (lst results)
	(cond
		;; Base case
		((endp lst)  results)
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



;;	(cond
;;		((listp ele)
;;			(counter_helper ele)
;;		)
;;		((atom ele) 
;;			NIL 
;;		)
;;		( T nil)
;;	)
;;)

