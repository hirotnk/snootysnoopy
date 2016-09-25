;; From SICP 2.1.4, Exercise 2.4
;; Implementation of cons, car, and cdr. Neat.
(define (cons x y) (lambda (m) (m x y)))
(define (car z) (z (lambda (x y) x)))
(define (cdr z) (z (lambda (x y) y)))


;; Execution:
; gosh> (define (cons x y) (lambda (m) (m x y)))
; cons
; gosh> (define (car z) (z (lambda (x y) x)))
; car
; gosh> (define (cdr z) (z (lambda (x y) y)))
; cdr
; gosh> (car (cons 1 2))
; 1
; gosh> (cdr (cons 1 2))
; 2


;;From https://en.wikipedia.org/wiki/CAR_and_CDR
;;start quote
;;
;;Lisp was originally implemented on the IBM 704 computer, in the late 1950s.
;;The 704 hardware had special support for splitting a 36-bit machine word into
;;four parts: an "address part" and "decrement part" of fifteen bits each, and
;;a "prefix part" and "tag part" of three bits each.
;;
;;Precursors[1][2] to Lisp included functions:
;;
;;car (short for "Contents of the Address part of Register number"), cdr
;;("Contents of the Decrement part of Register number"), cpr ("Contents of the
;;Prefix part of Register number"), and ctr ("Contents of the Tag part of
;;Register number"), each of which took a machine address as an argument,
;;loaded the corresponding word from memory, and extracted the appropriate
;;bits.
;;
;;end quote



;; Later, SICP revisits the implementation of car, cdr, and cons, from the
;; machine instruction level.  In SICP 5.3.1, car, cdr, and cons are
;; implemented as follows to explain low level operations conceptually:
(vector-ref <vector> <n>) returns n-th element of the vector
(vector-set! <vector> <n> <value>) sets n-th element of the vector to the designated value

;; here 'the-cars and 'the-cdrs are supposed to be the vector on memory
car:
(assign <reg1> (op car) (reg <reg1>)) as
;; just fetching the contents of memory on address <reg2> on the vector
;; 'the-cars, then assigning it to <reg1>
(assign <reg1> (op vector-ref) (reg the-cars) (reg <reg2>))

cdr:
(assign <reg1> (op cdr) (reg <reg1>)) as
;; just fetching the contents of memory on address <reg2> on the vector
;; 'the-cdrs then assigning it to <reg1>
(assign <reg1> (op vector-ref) (reg the-cdrs) (reg <reg2>))


cons:
(assign <reg1> (op cons) (reg <reg2>) (reg <reg3>)) as
;; 'free register is supposed to point the next available memory address on the
;; vector 'the-cars and 'the-cdrs.
;; 1. set the contents of address register <reg2> to the 'free location of
;; 'the-cars vector
(perform (op vector-set!) (reg the-cars) (reg free) (reg <reg2>))
;; 2. set the contents of address register <reg2> to the 'free location of
;; 'the-cdrs vector
(perform (op vector-set!) (reg the-cdrs) (reg free) (reg <reg2>))
;; 3. set the location(address) in 'free to <reg1>
(assign <reg1> (reg free))
;; 4. increment the contents of 'free register
(assign free (op +) (reg free) (const 1))


