;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname boxify-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Problem ===========================
;; Use the How to Design Functions (HtDF) recipe to design a function that
;; consumes an image, and appears to put a box around it. Note that you can do
;; this by creating an "outline" rectangle that is bigger than the image, and
;; then using overlay to put it on top of the image. 
;; For example:
;;
;; (boxify (ellipse 60 30 "solid" "red"))
;; should produce the image found in this link:
;; https://cs110.students.cs.ubc.ca/bank/boxify.png
;;
;; Remember, when we say DESIGN, we mean follow the recipe.
;;
;; Leave behind a commented out version of the stub.

;; Solution ================

;; Image -> Image
;; add box border around the image
;; (define (boxify img) (square 0 "solid" "white")) ; Stub

;; Examples/Tests
(check-expect (boxify (square 0 "solid" "white"))
              (overlay (rectangle 0 0 "outline" "blue")
                       (square 0 "solid" "white")))
(check-expect (boxify (circle 10 "solid" "yellow"))
              (overlay (rectangle 20 20 "outline" "blue")
                       (circle 10 "solid" "yellow")))

;; Function Template
#;
(define (fn-for-boxify img)
  (... img))

(define (boxify img)
  (overlay (rectangle (image-width img) (image-height img) "outline" "blue")
           img))













