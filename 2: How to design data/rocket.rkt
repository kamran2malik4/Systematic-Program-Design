;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname rocket-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; =================
;; Data definitions:

;; (@problem 1)
;;
;; You are designing a program to track a rocket's journey as it descends 
;; 100 kilometers to Earth. You are only interested in the descent from 
;; 100 kilometers to touchdown. Once the rocket has landed it is done.
;;
;; Design a data definition to represent the rocket's remaining descent. 
;; Call it RocketDescent.  Use a mixed data itemization to clearly
;; distinguish the case of when has shutdown and the journey is over. 
;;

;; Solution =========================

;; RocketDescent is one of:
;; - InRange
;; - Interval[100 1]
;; - "Landed"
;; Examples
(define RD1 false)    ;; Rocket is not in range
(define RD2 100)      ;; Rocket just entered the range
(define RD3 1)        ;; Rocket about to land
(define RD4 "Landed") ;; Rocket has landed

;; Function Template
#;
(define (fn-for-rocket-descent rd)
  (cond [(false? rd) (...)]
        [(number? rd) (...)]
        [else (...)]))

;; Function template rules used:
;; one of: 3 cases:
;; - InRange: false
;; - Interval[100 1]: Natural
;; - Landed: String




;; =================
;; Functions:

;; (@problem 2)
;;
;; Design a function that will output the rocket's remaining descent distance 
;; in a short string that can be broadcast on Twitter. 
;; When the descent is over, the message should be "The rocket has landed!".
;; Call your function rocket-descent-to-msg.
;;

;; RocketDescent -> String
;; Produces the current descent message of rocket until it lands
;; (define (rocket-descent-to-msg rd) "") ; Stub

;; Examples/Tests
(check-expect (rocket-descent-to-msg 100) "100")
(check-expect (rocket-descent-to-msg 1) "1")
(check-expect (rocket-descent-to-msg "Landed") "Landed")
(check-expect (rocket-descent-to-msg false) "Rocket is not in range.")

;; <Using template from RocketDescent data defination>
(define (rocket-descent-to-msg rd)
  (cond [(false? rd) "Rocket is not in range."]
        [(number? rd) (number->string rd)]
        [else rd]))








