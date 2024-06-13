;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname double-all-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; =================
;; Data definitions:

;; Recall the data definition for a list of numbers:
;; (if this data definition does not look familiar, please review it)


;; (@htdd ListOfNumber)
;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 60 (cons 42 empty)))

;(@dd-template-rules one-of          ;2 cases
;                    atomic-distinct ;empty
;                    compound        ;(cons Number ListOfNumber)
;                    self-ref)       ;(rest lon) is ListOfNumber

#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))



;; =================
;; Functions:

;; (@problem 1)
;; Design a function that consumes a list of numbers and doubles every number 
;; in the list. Call it double-all.

;; Solution ===================

;; ListOfNumber -> ListOfNumber
;; doubles all number of a list
;; (define (double-all lon) empty) ;Stub

;; Examples/Tests
(check-expect (double-all empty) empty)
(check-expect (double-all (cons 2 empty)) (cons (* 2 2) empty))
(check-expect (double-all (cons 2 (cons 4 empty))) (cons 4 (cons 8 empty)))

;; <Using template from ListOfNumber data defination
(define (double-all lon)
  (cond [(empty? lon) empty]
        [else
         (cons (* 2 (first lon))
               (double-all (rest lon)))]))




