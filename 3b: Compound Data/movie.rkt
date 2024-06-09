;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname movie-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; =================
;; Data definitions:

;; (@problem 1)
;; Design a data definition to represent a movie, including  
;; title, budget, and year released.
;;
;; To help you to create some examples, find some interesting movie facts below:
;; "Titanic" - budget: 200000000 released: 1997
;; "Avatar" - budget: 237000000 released: 2009
;; "The Avengers" - budget: c released: 2012
;;
;; However, feel free to resarch more on your own!

;; Solution ====================

(define-struct movie (t b y))
;; Movie is (make-movie STRING INTEGER INTEGER)
;; interp. details about a movie name, budget and release year
;;         t is title of the movie
;;         b is budget of the movie
;;         y is the year movie released
;; Examples
(define M1 (make-movie "Titanic" 200000000 1997))
(define M2 (make-movie "Avatar" 237000000 2009))
(define M3 (make-movie "The Avengers" 220000000 2012))

;; Function template
#;
(define (fn-for-movie m)
  (... (movie-t m)     ;String
       (movie-b m)     ;Integer
       (movie-y m)))   ;Integer

;; Template rules used:
;; - Compound: 3 fields



;; =================
;; Functions:

;; (@problem 2)
;; You have a list of movies you want to watch, but you like to watch your 
;; rentals in chronological order. Design a function that consumes two movies 
;; and produces the title of the most recently released movie.
;;
;; Note that the rule for templating a function that consumes two compound data 
;; parameters is for the template to include all the selectors for both 
;; parameters.

;; Solution =========================================

;; Movie Movie -> String
;; consumes two movies and produces the title of most recent movie
;; if the both movies are release same year the produces the title of first movie
;; (define (recent m1 m2) "") ;Stub

;; Examples/Tests
(check-expect (recent M1 M2) "Avatar")
(check-expect (recent M3 M2) "The Avengers")
(check-expect (recent (make-movie "One" 2234 2024) (make-movie "Two" 2234 2024)) "One")

;; <Using template from movie data defination>

(define (recent m1 m2)
  (if (>= (movie-y m1) (movie-y m2))
      (movie-t m1)
      (movie-t m2))) 






















