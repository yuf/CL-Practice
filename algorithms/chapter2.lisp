(defun mymergesort (lst)
  (let* ((n (length lst))
	 (mid (truncate (/ n 2))))
    (if (> n 1)
	(mymerge (mymergesort (subseq lst 0 mid)) (mymergesort (subseq lst mid n)))
	lst)))
(defun mymerge (lst1 lst2)
  (cond ((null lst1) lst2)
	((null lst2) lst1)
	((<= (car lst1) (car lst2)) (cons (car lst1) (mymerge (cdr lst1) lst2)))
	(t (cons (car lst2) (mymerge lst1 (cdr lst2))))))

(defun iterative-mergesort (lst)
  (let ((queue (mapcar #'list lst))
	(n (length lst)))
    (dotimes (i (1- n) (pop queue))
      (push (mymerge (pop queue) (pop queue)) queue))))

(defun kth-smallest_1 (lst k)
  (let* ((n (length lst))
	 (v (nth (random n) lst))
	 (lst-l (remove-if-not (lambda (x) (< x v)) lst))
	 (lst-v (remove-if-not (lambda (x) (= x v)) lst))
	 (lst-r (remove-if-not (lambda (x) (> x v)) lst))
	 (length-l (length lst-l))
	 (length-v (length lst-v)))
    (cond ((<= k length-l) (kth-smallest_1 lst-l k))
	  ((and (> k length-l) (<= k (+ length-l length-v))) v)
	  ((> k (+ length-l length-v)) (kth-smallest_1 lst-r (- k length-l length-v))))))
(defun kth-smallest_2 (lst k)
  (let ((v (nth (random (length lst)) lst))
	(lst-l nil)
	(lst-v nil)
	(lst-r nil)
	(length-l 0)
	(length-v 0))
    (dolist (x lst)
      (cond ((< x v)
	     (progn (push x lst-l)
		    (incf length-l)))
	    ((= x v)
	     (progn (push x lst-v)
		    (incf length-v)))
	    (t (push x lst-r))))
    (cond ((<= k length-l) (kth-smallest_2 lst-l k))
	  ((and (> k length-l) (<= k (+ length-l length-v))) v)
	  ((> k (+ length-l length-v)) (kth-smallest_2 lst-r (- k length-l length-v))))))

(defun FFT ()
  (print "Ugly!"))