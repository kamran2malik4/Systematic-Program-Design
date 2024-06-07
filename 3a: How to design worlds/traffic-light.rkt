;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname traffic-light-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; (@problem 1)
;; Design an animation of a traffic light. 
;; 
;; Your program should show a traffic light that is red, then green, 
;; then yellow, then red etc. For this program, your changing world 
;; state data definition should be an enumeration.
;;
;; The link below shows what your program might look like if the initial world 
;; state was the red traffic light:
;;
;; https://cs110.students.cs.ubc.ca/bank/r-traffic.png
;;
;; Next:
;;
;; https://cs110.students.cs.ubc.ca/bank/g-traffic.png
;
;; Next:
;; 
;; https://cs110.students.cs.ubc.ca/bank/y-traffic.png
;;
;; Next is red, and so on.
;;
;; To make your lights change at a reasonable speed, you can use the 
;; rate option to on-tick. If you say, for example, (on-tick next-color 1) 
;; then big-bang will wait 1 second between calls to next-color.
;;
;; Remember to follow the HtDW recipe! Be sure to do a proper domain 
;; analysis before starting to work on the code file.
;; 
;; Note: If you want to design a slightly simpler version of the program,
;; you can modify it to display a single circle that changes color, rather
;; than three stacked circles.


;; ========================== Solution ================================

;; Constants ============================

(define WIDTH 100)
(define HEIGHT 300)
(define CTR-X (/ WIDTH 2))
(define CTR-Y (/ HEIGHT 2))
(define SPACE-Y (rectangle 0 8 "solid" "white"))
(define OFF-LIGHT "gray")
(define RADIUS 40)
(define SWITCH-RATE 1)
(define MTS (overlay (rectangle WIDTH HEIGHT "solid" "black") (empty-scene WIDTH HEIGHT)))

;; Data Definations ===========================================

;; TLight is one of:
;; - "red"
;; - "yellow"
;; - "green"
;; colors of a traffic light
;; <Examples for enumerations are redundant>

;; Functions Template
#;
(define (fn-for-traffic-light tl)
  (cond [(string=? tl "red") (...)]
        [(string=? tl "yellow") (...)]
        [(string=? tl "green") (...)]))

;; Template rules used:
;; one of: 3 cases:
;; - atomic distinct: "red"
;; - atomic distinct: "yellow"
;; - atomic distinct: "green"



;; TLight -> TLight
;; produces next light in TLight
;; (define (next-light tl) "") ; Stub

;; Examples/Tests
(check-expect (next-light "red") "green")
(check-expect (next-light "green") "yellow")
(check-expect (next-light "yellow") "red")

;; <Using template from TLight data defination>
(define (next-light tl)
  (cond [(string=? tl "red") "green"]
        [(string=? tl "yellow") "red"]
        [(string=? tl "green") "yellow"]))


;; TLight -> Image
;; Produces Traffic light image
;; (define (render tl) MTS) ; Stub

;; Examples/Tests
(check-expect (render "red")
              (place-image (above
                            (circle RADIUS "solid" "red") SPACE-Y
                            (circle RADIUS "solid" OFF-LIGHT) SPACE-Y
                            (circle RADIUS "solid" OFF-LIGHT))
                           CTR-X CTR-Y MTS))
(check-expect (render "yellow")
              (place-image (above
                            (circle RADIUS "solid" OFF-LIGHT) SPACE-Y
                            (circle RADIUS "solid" "yellow") SPACE-Y
                            (circle RADIUS "solid" OFF-LIGHT))
                           CTR-X CTR-Y MTS))
(check-expect (render "green")
              (place-image (above
                            (circle RADIUS "solid" OFF-LIGHT) SPACE-Y
                            (circle RADIUS "solid" OFF-LIGHT) SPACE-Y
                            (circle RADIUS "solid" "green"))
                           CTR-X CTR-Y MTS))

;; <Using template from TLight defination>
(define (render tl)
  (cond [(string=? tl "red") (place-image (above
                            (circle RADIUS "solid" "red") SPACE-Y
                            (circle RADIUS "solid" OFF-LIGHT) SPACE-Y
                            (circle RADIUS "solid" OFF-LIGHT))
                           CTR-X CTR-Y MTS)]
        [(string=? tl "yellow") (place-image (above
                            (circle RADIUS "solid" OFF-LIGHT) SPACE-Y
                            (circle RADIUS "solid" "yellow") SPACE-Y
                            (circle RADIUS "solid" OFF-LIGHT))
                           CTR-X CTR-Y MTS)]
        [(string=? tl "green") (place-image (above
                            (circle RADIUS "solid" OFF-LIGHT) SPACE-Y
                            (circle RADIUS "solid" OFF-LIGHT) SPACE-Y
                            (circle RADIUS "solid" "green"))
                           CTR-X CTR-Y MTS)]))

;; TLight -> WS (Image)
;; produces current state of Traffic Light
(define (main tl)
  (big-bang tl
    (on-tick next-light SWITCH-RATE)
    (on-draw render)))
























