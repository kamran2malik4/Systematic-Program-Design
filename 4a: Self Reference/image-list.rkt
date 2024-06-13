;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image-list-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; =================
;; Data definitions:

;; (@problem 1)
;; Design a data definition to represent a list of images. Call it ListOfImage.

;; Solution ================
;; ListOfImage is one of:
;; - empty
;; - (cons Image ListOfImage)
;; interp. a list of any type of image
;; Examples
(define LOI1 empty)
(define LOI2 (cons (circle 10 "solid" "red") empty))
(define LOI3 (cons (square 10 "solid" "green")
                   (cons (circle 10 "solid" "red") empty)))

;; Function Template
#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else
         (... (first loi)
              (fn-for-loi (rest loi)))]))

;; Template rules used:
;; one of: 2 cases:
;; - atomic distinct: empty
;; - compound: (cons Image ListOfImage)
;; - self reference: (fn-for-loi (rest loi))



;; =================
;; Functions:

;; (@problem 2)
;; Design a function that consumes a list of images and produces a number 
;; that is the sum of the areas of each image. For area, just use the image's 
;; width times its height.

;; Solution =======================

;; ListOfImage -> Number
;; Produces a total sum of area of all images
;; (define (sum-all loi) 0) ;Stub

;; Examples/Tests
(check-expect (sum-all empty) 0)
(check-expect (sum-all (cons (square 4 "solid" "yellow") empty)) 16)
(check-expect (sum-all (cons (square 4 "solid" "yellow")
                             (cons (rectangle 2 4 "outline" "red") empty))) 24)

;; <Using template from data defination>
(define (sum-all loi)
  (cond [(empty? loi) 0]
        [else
         (+ (* (image-width (first loi)) (image-height (first loi)))
              (sum-all (rest loi)))]))







