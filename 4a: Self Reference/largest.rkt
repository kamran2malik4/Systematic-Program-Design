;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname largest-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

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

;(@dd-template-rules one-of               ;2 cases
;                    atomic-distinct      ;empty
;                    compound             ;(cons Number ListOfNumber)
;                    self-ref)            ;(rest lon) is ListOfNumber
                    
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))



;; =================
;; Functions:

;; (@problem 1)
;; Design a function that consumes a list of numbers and produces the largest 
;; number in the list. You may assume that all numbers in the list are greater
;; than 0. If the list is empty, produce 0.

;; Solution ============

;; ListOfNumber -> Number
;; Produces largest number in list if list is empty produces 0 (numbers > 0)
;; (define (larger lon) 0) ;Stub

;; Examples/Tests
(check-expect (larger empty) 0)
(check-expect (larger (cons 1 empty)) 1)
(check-expect (larger (cons 11 (cons 12 empty))) 12)
(check-expect (larger (cons 14 (cons 13 empty))) 14)
(check-expect (larger (cons 2 (cons 3 (cons 4 empty)))) 4)
(check-expect (larger (cons 7 (cons 6 (cons 5 empty)))) 7)
(check-expect (larger (cons 8 (cons 10 (cons 9 empty)))) 10)

;; <Using template from ListOfNumber data defination>
(define (larger lon)
  (cond [(empty? lon) 0]
        [else
         (if (> (first lon) (larger (rest lon)))
              (first lon)
              (larger (rest lon)))])) 
















