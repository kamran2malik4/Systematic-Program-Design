;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname decreasing-image-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)

;; (@problem 1)
;; Design a function called decreasing-image that consumes a natural n and
;; produces an image of all the numbers from n to 0 side by side. 
;;
;; So (decreasing-image 3) should produce the image found here:
;; https://cs110.students.cs.ubc.ca/bank/3210.png

;; Solution =================

;; Data Defination ===

;; ListOfNatural is one of:
;; - empty
;; (cons Natural ListOfNatural)
;; Examples
(define LON0 empty)
(define LON1 (cons 1 empty))
(define LON2 (cons 2 (cons 3 empty)))

;; Function Template
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;; Template rules used:
;; one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons Natural ListOfNatural)
;; - self reference: (fn-for-lon (rest lon))


;; Functions ===

;; ListOfNatural -> Image
;; produces Image representation of Naturals from n to 0 in row
;; (define (decreasing-image lob))


;; Natural -> Image
;; produces Image representation of Naturals from n to 0 in row
;; (define (decreasing-image n) (square 0 "solid" "white")) ;Stub

;; Examples/Tests
(check-expect (decreasing-image 0) (beside (text "0" 24 "black") (square 0 "solid" "white")))
(check-expect (decreasing-image 1) (beside (text "1" 24 "black") (text "0" 24 "black") (square 0 "solid" "white")))

(define (decreasing-image n)
  (if (< n 0)
      (square 0 "solid" "white")
      (beside (text (number->string n) 24 "black")
              (decreasing-image (sub1 n)))))











