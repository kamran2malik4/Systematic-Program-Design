;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname countdown-animation-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; (@problem 1)
;; Design a world program that represents a countdown. The program should 
;; display the number of seconds remaining and should decrease at each 
;; clock tick. Upon reaching zero, it should stay there and not change.
;; 
;; To make your countdown progress at a reasonable speed, you can use the 
;; rate option to on-tick. If you say, for example, 
;; (on-tick advance-countdown 1) then big-bang will wait 1 second between 
;; calls to advance-countdown.
;;
;; Remember to follow the HtDW recipe! Be sure to do a proper domain 
;; analysis before starting to work on the code file.
;; 
;; Once you are finished the simple version of the program, you can improve
;; it by reseting the countdown to ten when you press the spacebar.


;; ================================ Solution ==================================


;; Constants ==========================
(define WIDTH 300)
(define HEIGHT 300)
(define TEXT-SIZE 64)
(define TEXT-COLOR "black")
(define POS-X (/ WIDTH 2))
(define POS-Y (/ HEIGHT 2))
(define MTS (empty-scene WIDTH HEIGHT))

;; Countdown is an Integer
;; interp. represents integers for countdown
;; Example(s)
(define CD1 10) ; Start of countdown
(define CD2  5) ; Middle of countdown
(define CD3  0) ; End of countdown

;; Function Template
#;
(define (fn-for-count-down c)
  (... c))

;; Template rules used are:
;; - atomic distinct: Integer


;; Countdown -> WS
;; Produces the world state of countdown (main 10)
(define (main c)
  (big-bang c
    (on-tick decrement 1)
    (on-draw render)
    (on-key reset)))

;; Countdown -> Countdown
;; counsumes the countdown and decrement it by one. Once 0, stops decrementing
;; (define (decrement c) 0) ; Stub
;; Examples/Tests
(check-expect (decrement 10) 9)
(check-expect (decrement  1) (- 1 1))
(check-expect (decrement  0) 0)

;; <Using template from countdown data defination>
(define (decrement c)
  (if (= c 0)
      c
      (- c 1)))

;; Countdown -> Image
;; produces the image of countdown number
;; (define (render c) MTS) ; Stub

;; Examples/Tests
(check-expect (render 5)
              (place-image
               (text (number->string 5) TEXT-SIZE TEXT-COLOR)
               POS-X POS-Y  MTS))

;; <Using template from Countdown Data Defination>
(define (render c)
  (place-image
   (text (number->string c) TEXT-SIZE TEXT-COLOR)
   POS-X POS-Y MTS))


;; Countdown Key -> Countdown
;; resets countdown to its initial state
(define (reset c ke)
  (if (key=? ke " ") 10 c))













