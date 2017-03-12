;;;; Description of the program
;;; comment
; comment after a line of code
#|| a
multi
line
comment
||#
;;;;primarily based on tutorials of Derek Banas on YouTube as well as other resources
;;; https://youtu.be/ymSq4wHrqyU

(format t "Hello") ;prints "Hello" to the terminal
(format t "Hello World!" ~%) ;prints and adds a new line at the end

(print "Insert your name: ")

;;;lisp is not case sensitive

(defvar *name* (read)) ;reads a variable and saves it as a global variable called name

;;;define a function called hello-friend
(defun hello-friend (*name*) ;using dashes as Lisp is NOT case sensitive
	(format t "Hello ~a! ~%" *name*))

(setq *print-case* :capitalize) ;sets all print outs to be capitalized
;;;can also use :upcase or :downcase

(hello-friend *name*) ;call the function

;;;;forms
(+ 5 4) ;(function-name value1 value2 etc.) this one sums them
;;;nest forms in forms
(+ 5 (- 6 22))

;;;everything is a list inside of lisp, held in their own cells
(+ 5 4)
;;;which means
[+] [5] [4] [nil]

(defvar *number* 0) ;define with value
(setf *number* 6) ;change value



;;;;format
;;;format t outputs to the terminal
(format t "number with commas ~:d" 10000000) ;prints out the number as 10,000,000
(format t "number with acc to 5 characters ~5f" 3.141593) ;3.142
(format t "number with acc to 4 decimal places ~,4f" 3.14593) ;3.1416
(format t "10 percent ~,,2f" 0.10) ;10.0
(format t "10 Dollars ~$ ~%" 10) ;10.00



;;;;maths
(+ 5 4) ;9
(- 5 4) ;1
(* 5 4) ;20
(/ 5 4) ;5/4 -outputs like that for int division
(/ 5 4.0) ;1.25 - floating point division gives decimal answer
(rem 5 4) ;1 - remainder of division
;;;
(expt 4 2) ;16 - 4^2
(sqrt 81) ;9 - square root
(exp 1) ;2.7182817 - e^1
(log 1000 10) ;3 - log10(1000)
(eq 'dog 'dog) ;T - check if two variables are equal
(floor 5.5) ;5
(ceiling 5.5) ;6
(max 4 10) ;10
(min 1 10 7) ;2
(oddp 15) ;T - it is odd
(evenp 13) ;Nil - it is not even
(numberp 2) ;T - is a number
(null nil) ;T - it is empty
;;;there's also sin cos and many more



;;;;equality
(defparameter *name* 'John) ;another way of defining a variable
(format t "The name is John - ~d ~%" (eq *name* 'John)) ;The name is John - T

;;;eq is for compating symbols, for everything else use equal
(equal 'car 'truck) ;Nil - also works, so eq is basiaclly redundant at this point
(equal 12 12) ;T
(equal 6.8 6.9) ;Nil
(equal "string" "String") ;Nil
(equal (list 1 2 3) (list 1 2 3)) ;T

;;;equalp - for different data types
(equalp 1.0 1) ;T - float to integer comparison
(equalp "Hello" "hello") ;T - different case

;;;other types of equality
(listp '(tom rick)) ;T - it is a list



;;;;Conditional statements
(defvar *age* 18)
(if (= *age* 18)
	(format t "You are an adult~%")
	(format t "You are too young mate"))
;;;executes the first one if condition is true, the scond one if false

(if (not (= *age* 18)) ;check for not equal
	(format t "You are an adult~%")
	(format t "You are too young mate"))

;;;logical operator: and, or, <=, >, = etc.
(if (and (>= *age* 18) (not (>= *age* 70)))
	(print "You can drive")
	(print "You might be a dangerous dirver"))

(defvar *num* 3)
(defvar *num-2* 3)
(defvar *num-3* 3)

;;;executing multiple operations in an if statement
(if (= *num* 3)
	(progn 
		(set *num-2* (* *num-2 2))
		(set *num-3* (* *num-3* 3)))
	(format t "Not equal to 3~%"))
	
;;;switch statement
(case *age*
	(5 (print "Kindergarden")
	(6 (print "just starting school")
	(otherwise (print "somewhere else")))))
;;;no need to use break like in modern languages

;;;when
(when (= *age* 18)
	(setf *num-3* 18)
	(format t ("Man, you're already ~d ~%" *num-3)))
;;;unless
(unless (= *age* 22)
	(print "something"))
;;;opposite of when

;;;conditional - if else
(cond ( (>= *age* 18)
		(print "Ready for uni")
		(print "yep"))
	( (< *age* 18)
		(print "Not ready for uni"))
	(t (format t "Uni is hard"))) 
;;;use t for condition set to true - this is the else part



;;;;to get a new empty line in terminal use
(terpri)



;;;;loops
;;;for loop
(loop for x from 100 to 110
	do (print x))
	
;;;while loop
(setq x 1) ;set value
(loop
	(format t "~d ~%" x)
	(setq x (+ x 1))
	(when (> x 10) (return x)))

;;;for loop for lists
(loop for x in '(Charles Morgan John) do
	(format t "~s ~%" x))
	
;;;dotimes loop
(dotimes (y 12)
	(print y))
;;; this will output integers from 0 to 11



;;;;lists
(cons 'iron-man 'spider-man) ;sets them as a list in consecutive order
(list 'iron-man 'spider-man 'doctor-strange) ;makes a list again in that order
(cons 'doctor-strange '(iron-man spider-man)) ;puts doctor-strange at the front before that list
;;;you can store lists in variables like everything else

;;;get the first item of the list
(format t "First = ~a ~%" (car '(iron-man spider-man doctor-strange))) ;iron-man
;;;other items without first
(format t "First = ~a ~%" (cdr '(iron-man spider-man doctor-strange))) ;spider-man doctor-strange

;;;second item from the list
(format t "First = ~a ~%" (cadr '(iron-man spider-man doctor-strange)))
;;;from the left: in cadr d gets you all items except the first, then a gives you the first ot of those

;;;fourth item - use cadddr etc.
;;;can only use 4 characters so to get something further than 4th item you need more advanced methods

;;;n-th item of a list
(defparameter *numbers* '(2 4 6))
(nth 2 *numbers*) ;gives you thrid item in the list

;;;check if something is in a list
(if (memeber 3 '(2 4 6)) 't nil) ;if 3 is in the list give T, otherwise give Nil


;;;adding at the end of a list
(append '(just) '(random words) '(mate))

;;;put at the front
(push 1 *numbers*) ;1 is now at the front of numbers*


;;;advanced usage
(defvar spider-man (list :name "Spider-man" :secret-id "Miles Morales"))
(defvar *hero-list* nil)
(push spider-man *hero-list*)
(dolist (hero *hero-list*)
	(format t "~{~a : ~a ~}~%" hero))
;;;goes through the list and lists like: Name : Spider-man Secret-Id : Miles Morales
;;;the ~{ ~} brackets look weird but they make this "magic" possible


;;;;association lists
(defparameter *heroes*
	'((Iron-man (Tony Stark))
	(Spider-man (Miles Morales))
	(Doctor-Strange (Steven Strange))))
(format t "Iron-man Data ~a ~%" (assoc 'Iron-man *heroes*))
;;;prints out: Iron-man Data (Iron-man (Tony Stark))

(format t "Iron-man Data ~a ~%" (cadr (assoc 'Iron-man *heroes*)))
;;;prints out: Iron-man Data (Tony Stark)



;;;;functions
(defun hello() ;define a function without putting in values
	(print "Hello") ;printout
	(terpi)) ;empty line after printout
(hello) ;call function

(defun average (num-1 num-1) ;function using provided values
	(/ (+ num-1 num-2) 2))
(print "Avg 10 & 50 = ~a ~%" (average 10 50)) ;calling this function inside a print statement

(defun print-a-list (w x &optional y z) ;make function take at least two arguments but up to 4
	(print "List = ~a ~%" (list w x y z)))
(print-a-list 1 2 3)
;prints List = (1 2 3 Nil)


(defvar *total* 0)
(defun sum (&rest nums) ;allow for input of multiple values
	(dolist (num nums)
		(setf *total* (+ *total* num)))
	(print "Sum = ~a ~%" *total*))
;;;makes a list of the values you input, dolist runs through them and adds them each to the total*


;;;keywords/key values
(defun print-list(&optional &key x y z) ;all input is optional, but there are 3 key values
	(format t "List: ~a ~%" (list x y z)))
(print-list :x 1 :y 2) ;call parsing values to the key spots
;;;prints List: (1 2 Nil)


(defun difference (num1 num2)
	(return-from difference(- num1 num2)))
;;;have a returned specific value from the function



;;;;Quasi Quote 
;;;quasi quoting when making functions which act on association lists allows you to switch between "code" and "data" modes

(defparameter *hero-size*
	'((Iron-man (his height) (his weight))
	(Spider-man (his height) (his weight))
	(Doctor-strange (his height) (his weight))))
	
(defun get-hero-data (size)
	(format t "~a ~%"
	'(,(caar size) is ,(cadar size) and ,(cddar size))))
;;;you can execute CODE inside DATA

(get-hero-data *hero-size*)
;;;prints: (Iron-man is (his height) and (his wieght))


;;;can also use it in simple outputs
(format "A number ~a ~%" (mapcar #'numberp '(1 2 3 f g))) ;mapcar - cycle through a list and perform a func on it
;;;prints: A number (T T T Nil Nil)


;;;flet - functions inside of functions!
(flet ((func-name (arguments)
	function Body ))
	body))
;;;that's the base structure

;;;example
(flet ((double-that (num)
	(* num 2))
	(triple-that (num)
	(* num 3)))
	(format t "Double & Triple 10 = ~d~%" (triple-that(double-that 10))))
;;;


;;;labels - a function calling itself
(labels ((double-it (num)
		(* num 2)
	(triple-it (num)
		(* (double-it num) 3)))
	(format t "Double & Triple 2 = ~d~%" (triple-it 2))))
;;;etc


;;;return multiple values
(defun squares (num)
	(values (expt num 2) (expt num 3)))
	
;;;bind multiple values
(multiple-value-bind (a b) (squares 2)
	(format t "2^2 = ~d~%" a b))
	


;;;;Higher order functions - call multiple functions from one function
(defun times-3 (x) (* 3 x))
(defun times-4 (x) (* 4 x))

(defun multiples (multi-function max-num)
	(dotimes (x man-num)
	(format t "~d : ~d ~%" x (funcall multi-function x))))
	
(multiples #'times-3 10)
(multiples #'times-4 10)
;;;prints out 0 : 0, 1:3, 2 : 6 etc. up to 9 and same for 4



;;;;Lambdas - a function without a name that you can pass like a variable
(mapcar (lambda (x) (print (* x 2))) '(1 2 3 4 5))
;;;prints out: 2 4 6 8 10



;;;;Macros - compiled function, runs just like a lisp built-in function
;;;example, macro that makes if statements faster to write
(defvar *num* 2)
(defvar *num-2* 0)

;;;original
(if (= *num* 2)
	(progn 
		(setf *num-2* 2)
		(format t "*num-2* = ~d ~%" *num-2*))
	(format t "Not equal to 2 ~%"))
	
;;;make a macro
(defmacro ifit (condition &rest body)
	(if, condition (progn ,@body) (format t "Can't do that ~%")))
;;;macros GENERATE CODE, they will write the structure for you based on the blueprint

(setf *age* 16)

(ifit (>= *age* 16)
	(print "You are over 16")
	(print "Time to Drive!")
	(tempri))
;;;this will execute all the stuff if age is 16


;;;another example
(defun add (num1 num2)
	(let ((sum (+ num1 num2)))
		(format t "~a + ~a = ~a ~%" num1 num2 sum)))
;;;long and tedious - very untidy

;;;make a macro:
(defmacro letx (var val &rest body)
	'(let ((,var ,val)) ,@body))

(defun subtract (num1 num2)
	(letx dif (- num1 num2)
		(format t "~a + ~a = ~a ~%" num1 num2 dif)))
;;;much tidier 



;;;;classes
;;;define a class
(defclass animal()
	(name
	sound))

;;;create an object
(defparameter *dog* (make-instance 'animal)

;;;set the objects parameters
(setf (slot-value *dog* 'name) "Spot")
(setf (slot-value *dog* 'sound) "Woof")

;;;get objects parameters
(format t "~a says ~a ~%" 
	(slot-value *dog* 'name)
	(slot-value *dog* sound))
;;;prints: Spot says Woof


;;;defina a class with "constructors" or keys
(defclass mammal()
	((name
		:initarg: name
		:initform (error "Must provide a name")) ;print an error if not provided with a name
	(sound
		:initarg :sound
		:initform "No Sound"
		:accessor mammal-sound ;generate the get-set
		:writer mammal-sound ;only set
		:reader mammal-sound ;only get
	)))

(defparameter *king-kong*
	make-instance 'mammal :name "King Kong" :sound "Rawr")
;;;intantiate an object with parameters



;;;;Generic functions
;;;functions which a name and a parameter list but no implementation
;;;those functions are responsible for executing correct functions based on passed in data

(defgeneric make-sound (mammal))

(defmethod make-sound ((the-mammal mammal))
	(format t "~a says ~a ~%"
	(slot-value the-mammal 'name)
	(slot-value the-mammal 'sound)))
	
(make-sound "king-kong")
;;;basically function templates for using objects as variables and easily accesssing their data

;;;always have a generic and then methods belonging to it
(defgeneric (setf mammal-name) (value the-mammal))

(defmethod (setf mammal-name) (value (the-mammal mammal))
	(slot-value the-mammal 'name))
	
(setf (mammal-name *king-kong*) "Kong")
;;;using mammal-name to change *king-kong*s name to Kong

;;;since we used accessor in mammal sound, we had ALL of that done for us:
(setf (mammal-sound *king-kong*) "RAWRRR XD")

;;;for such easy stuff PLEASE use accessors, getters and setters, for real



;;;;Inheritance
(defclass dog (mammal) ()) ;it's that easy

(defparameter *rover*
	(make-instance 'dog :name "Rover" :sound "Woof"))
	

	
	
;;;;Arrays
(defparameter names (make-array 3)) ;array holding 3 pieces of data

(setf (aref names 1) 'Bob) ;aref - array reference
;;;this sets the value to Bob

(aref names 1) ;this gets it back


;;;Multi-dimentional arrays
;;;3x3
(setf num-array (make-array '(3 3)
	:initial-contents '((0 1 2) (3 4 5) (6 7 8))))
	
(dotimes (x 3)
	dotimes(y 3)
		(print (aref num-array x y)))



		
;;;;Hash tables
(defparameter people (make-hash-table))

(setf (gethash '102 people) '(Paul Smith))
(setf (gethash '103 people) '(Sam Smith))

(format t "~a ~%" (gethash '102 people))
;;;prints (Paul Smith)

(maphash #'(lambda (k v) (format t "~a = ~a ~%" k v)) people)
#|| prints:
103 = (Sam Smith)
102 = (Paul Smith) ||#
;;;to remove a hash just use (remhash '103 people)



;;;;Structures
;;;user defined data types - they can have multiple datatypes inside them
(defstruct customer name address id)
(setq paulsmith (make-customer
	:name "Paul Smith"
	:address "123 Main"
	:id 1000))
	
(format t "~a ~%" (customer-name paulsmith))
;;;prints Paul Smith

(setf (customer-address paulsmith) "125 main")

(write paulsmith)
;;;prints out all about paulsmith



;;;;File I/O
;;;write to a file
(with-open-file (my-stream
	"test.txt"
	:direction :output
	:if-exists :supersede)
	(print "some text that will be written to the file"))
	
;;;read from a file
(let ((in (open "test.txt" :if-does-not-exist nil)))
	(when in
		(loop for line = (read-line in nil)
		while line do (format t "~a~%" line))
		(close in)))