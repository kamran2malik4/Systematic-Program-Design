;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname demolish-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; =================
;; Data definitions:

;; (@problem 1)
;; You are assigned to develop a system that will classify 
;; buildings in downtown Vancouver based on how old they are. 
;; According to city guidelines, there are three different classification
;; levels: new, old, and heritage.
;;
;; Design a data definition to represent these classification levels. 
;; Call it BuildingStatus.

;; Solutions ========================
;; BuildingStatus is one of:
;; - new
;; - old
;; - heritage
;; interp. status of buildings in downtown Vancouver
;; <Examples for Enumerations are redundant>

;; Function Template
#;
(define (fn-for-building-status status)
  (cond [(string=? status "new") (...)]
        [(string=? status "old") (...)]
        [(string=? status "heritage") (...)]))
;; Template rules used are:
;; one of 3 cases:
;; atomic distinct: String
;; atomic distinct: String
;; atomic distinct: String


;; =================
;; Functions:

;; (@problem 2)
;; The city wants to demolish all buildings classified as "old". 
;; You are hired to design a function called demolish? 
;; that determines whether a building should be torn down or not.

;; Solution =============
;; BuildingStatus -> Boolean
;; produces true for buildings with "old" status
;; (define (demolish? building) false) ; Stub

;; Examples/Tests
(check-expect (demolish? "old") true)
(check-expect (demolish? "new") false)
(check-expect (demolish? "heritage") false)

;; <Using template from BuildingStatus defination>
(define (demolish? status)
  (string=? status "old"))




