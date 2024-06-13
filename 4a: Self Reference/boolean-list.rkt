;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname boolean-list-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; =================
;; Data definitions:

;; (@problem 1)
;; Design a data definition to represent a list of booleans.
;; Call it ListOfBoolean.

;; Solution =================

;; ListOfBoolean is one of:
;; - empty
;; - (cons Boolean ListOfBoolean)
;; interp. A list of boolean values
;; Examples
(define LOB1 empty)
(define LOB2 (cons false empty))
(define LOB3 (cons true empty))
(define LOB4 (cons true (cons false empty)))

;; Function Template
#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (first lob)
              (fn-for-lob (rest lob)))]))

;; Template rules used:
;; one of: 2 cases:
;; - atomic distinct: empty
;; - compound: (cons Boolean ListOfBoolean)
;; - self refence: (fn-for-lob (rest lob))



;; =================
;; Functions:

;; (@problem 2)
;; Design a function that consumes a list of boolean values and produces true 
;; if every value in the list is true. If the list is empty, your function 
;; should also produce true. Call it all-true?

;; Solution ===============

;; ListOfBoolean -> Boolean
;; Produces true if all values inside list are true else false, for empty produce true
;; (define (all-true? lob) false) ;Stub

;; Examples/Tests
(check-expect (all-true? empty) true)
(check-expect (all-true? (cons false empty)) false)
(check-expect (all-true? (cons false (cons false empty))) false)
(check-expect (all-true? (cons true (cons false empty))) false)
(check-expect (all-true? (cons true empty)) true)
(check-expect (all-true? (cons true (cons true empty))) true)

;; <Using template from ListOfBoolean data defination>
(define (all-true? lob)
  (cond [(empty? lob) true]
        [else
         (and (first lob)
              (all-true? (rest lob)))]))






