;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname student-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; =================
;; Data definitions:

;; (@problem 1)
;; Design a data definition to help a teacher organize their next field trip. 
;; On the trip, lunch must be provided for all students. For each student, track
;; their name, their grade (from 1 to 12), and whether or not they have
;; allergies.


;; Solution =========================

(define-struct student (fn g a))
;; Student is (make-student STRING INTEGER BOOLEAN)
;; interp. Student name grade and whether student is allergic or not
;;         fn is student's full name
;;         g is student's grade
;;         a is whether student allergic or not
;; Examples
(define S1 (make-student "Kamran" 12 false))
(define s2 (make-student "Hamza" 5 true))

;; Function Template
#;
(define (fn-for-student s)
  (... (student-fn s)   ;String
       (student-g s)    ;Integer
       (student-a s)))  ;Boolean

;; Template rules used:
;; - Compound: 3 fields




;; =================
;; Functions:

;; (@problem 2)
;; To plan for the field trip, if students are in grade 6 or below, the teacher 
;; is responsible for keeping track of their allergies. If a student has
;; allergies, and is in a qualifying grade, their name should be added to a
;; special list. Design a function to produce true if a student name should be
;; added to this list.

;; Solution ===========================

;; Student -> Boolean
;; produces true if student below or equal 6 grade has any allergy
;; (define (allergic? s) false) ;Stub

;; Examples/Tests
(check-expect (allergic? (make-student "Kamran" 12 false)) false)
(check-expect (allergic? (make-student "Hamza" 12 true)) false)
(check-expect (allergic? (make-student "Sufyan" 6 false)) false)
(check-expect (allergic? (make-student "Umar" 6 true)) true)

;; <Using template from student data defination>
(define (allergic? s)
  (and (<= (student-g s) 6)  
       (student-a s)))  














