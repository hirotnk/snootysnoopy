;; From SICP 5.2.2
;; https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-32.html#%_sec_5.2.2
;;
;; This code is crafty. You can pass a lambda function that will be executed
;; after all accumlation has done, receiving those parameters.
(define (extract-labels text receive)
  (if (null? text)
    (receive '() '())
    (extract-labels
      (cdr text)
      (lambda (insts labels)
        (let ((next-inst (car text)))
          (if (symbol? next-inst)
            (receive insts (cons (make-label-entry next-inst insts) labels))
            (receive (cons (make-instruction next-inst) insts) labels)))))))

;;start quote
;;
;; Using the receive procedure here is a way to get extract-labels to effectively
;; return two values—labels and insts—without explicitly making a compound data
;; structure to hold them.
;;
;; You can consider our use of receive as demonstrating an elegant way to
;; return multiple values, or simply an excuse to show off a programming trick.
;; An argument like receive that is the next procedure to be invoked is called
;; a “continuation.”
;;
;;end quote

;; You call it like this:
(define (assemble controller-text machine)
  (extract-labels
    controller-text
    ;; This lambda receives accumulated 2 arguments in the end, and
    ;; `update-insts!` gets executed.
    (lambda (insts labels) 
      (update-insts! insts labels machine) insts)))

