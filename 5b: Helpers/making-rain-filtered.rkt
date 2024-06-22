;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname making-rain-filtered-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; (@problem 1)
;; Design a simple interactive animation of rain falling down a screen. Wherever
;; we click, a rain drop should be created and as time goes by it should fall.
;; Over time the drops will reach the bottom of the screen and "fall off".
;; You should filter these excess drops out of the world state - otherwise
;; your program is continuing to tick and draw them long after they are
;; invisible.
;;
;; In your design pay particular attention to the helper rules. In our solution
;; we use these rules to split out helpers:
;;   - function composition
;;   - reference
;;   - knowledge domain shift
;;
;; NOTE: This is a fairly long problem.  While you should be getting more
;; comfortable with world problems there is still a fair amount of work to do 
;; here. Our solution has 9 functions including main. If you find it is taking
;; you too long then jump ahead to the next homework problem and finish this
;; later.

;; =================
;; Constants:

(define WIDTH  300)
(define HEIGHT 300)

(define SPEED 2)

(define DROP (ellipse 4 8 "solid" "blue"))

(define MTS (rectangle WIDTH HEIGHT "solid" "light blue"))



;; =================
;; Data definitions:

(define-struct drop (x y))
;; Drop is (make-drop Integer Integer)
;; interp. a raindrop on the screen, with x and y coordinates in pixels.
(define D1 (make-drop 10 30))

;; Function Template
#;
(define (fn-for-drop d)
  (... (drop-x d)       ;Integer
       (drop-y d)))     ;Integer

;; Template rules used:
;; - compound: 2 fields

;; ==================

;; ListOfDrop is one of:
;;  - empty
;;  - (cons Drop ListOfDrop)
;; interp. a list of drops
(define LOD1 empty)
(define LOD2 (cons (make-drop 10 20) (cons (make-drop 3 6) empty)))

;; Function Template
#;
(define (fn-for-lod lod)
  (cond [(empty? lod) (...)]
        [else
         (... (fn-for-drop (first lod))
              (fn-for-lod (rest lod)))]))

;; Template rules used:
;; - one of: 2 cases:
;; - atomic distinct: empty
;; - compound: (cons Drop ListOfDrop)
;; - reference: (fn-for-drop (first lod))
;; - self reference: (fn-for-lod (rest lod))



;; =================
;; Functions:

;; ListOfDrop -> World State
;; start rain program by evaluating (main empty)

(define (main lod)
  (big-bang lod                       ; ListOfDrop
            (on-tick  next-drops)     ; ListOfDrop -> ListOfDrop
            (to-draw  render-drops)
            (on-mouse  add-drop)))         ; ListOfDrop -> ListOfDrop

;; ========

;; ListOfDrop -> ListOfDrop
;; produce filtered and ticked list of drops
;; (define (next-drops lod) empty) ;stub

;; Examples/Tests
(check-expect (next-drops empty) empty)

(check-expect (next-drops (cons (make-drop 50 0) empty)) (cons (make-drop 50 (+ 0 SPEED)) empty))

(check-expect (next-drops (cons (make-drop 70 87) (cons (make-drop 50 0) empty)))
              (cons (make-drop 70 (+ 87 SPEED)) (cons (make-drop 50 (+ 0 SPEED)) empty)))

(check-expect (next-drops (cons (make-drop 70 HEIGHT) (cons (make-drop 70 87) (cons (make-drop 50 0) empty))))
              (cons (make-drop 70 (+ 87 SPEED)) (cons (make-drop 50 (+ 0 SPEED)) empty)))

;; <Using template from ListOfDrop data defination>
(define (next-drops lod)
  (cond [(empty? lod) lod]
        [else
         (filter-drops (tick-drops lod))]))

;; ==================

;; ListOfDrop -> ListOfDrop
;; increases y-coordinate of drops by SPEED
;; (define (tick-drops lod) empty) ;Stub

;; Examples/Tests
(check-expect (tick-drops empty) empty)

(check-expect (tick-drops (cons (make-drop 50 0) empty)) (cons (make-drop 50 (+ 0 SPEED)) empty))

(check-expect (tick-drops (cons (make-drop 70 87) (cons (make-drop 50 0) empty)))
              (cons (make-drop 70 (+ 87 SPEED)) (cons (make-drop 50 (+ 0 SPEED)) empty)))

(check-expect (tick-drops (cons (make-drop 70 HEIGHT) (cons (make-drop 70 87) (cons (make-drop 50 0) empty))))
              (cons (make-drop 70 (+ HEIGHT SPEED))(cons (make-drop 70 (+ 87 SPEED)) (cons (make-drop 50 (+ 0 SPEED)) empty))))

;; <Using template from ListOfDrop data defination>
(define (tick-drops lod)
  (cond [(empty? lod) lod]
        [else
         (cons (tick-drop (first lod))
               (tick-drops (rest lod)))]))

;; Drop -> Drop
;; increase y-coordinate of drop by SPEED
;; (define (tick-drop d) (make-drop 0 0)) ; Stub

;; Examples/Tests
(check-expect (tick-drop (make-drop 70 80)) (make-drop 70 (+ 80 SPEED)))

;; <Using template from Drop data defination>
(define (tick-drop d)
  (make-drop (drop-x d)       
             (+ (drop-y d) SPEED)))

;; ====================

;; ListOfDrop -> ListOfDrop
;; Filters all fallen drops from the list
;; (define (filter-drops lod) empty) ;Stub

;; Examples/Tests
(check-expect (filter-drops (cons (make-drop 70 (+ HEIGHT SPEED)) (cons (make-drop 90 87) (cons (make-drop 10 23) empty))))
              (cons (make-drop 90 87) (cons (make-drop 10 23) empty)))

(check-expect (filter-drops (cons (make-drop 90 87) (cons (make-drop 70 (+ HEIGHT SPEED)) (cons (make-drop 10 23) empty))))
              (cons (make-drop 90 87) (cons (make-drop 10 23) empty)))

(check-expect (filter-drops (cons (make-drop 90 87) (cons (make-drop 10 23) (cons (make-drop 70 (+ HEIGHT SPEED)) empty))))
              (cons (make-drop 90 87) (cons (make-drop 10 23) empty)))

(check-expect (filter-drops (cons (make-drop 70 (+ HEIGHT SPEED)) (cons (make-drop 10 23) (cons (make-drop 70 (+ HEIGHT SPEED)) empty))))
              (cons (make-drop 10 23) empty))

;; <Using template from ListOfDrop data defination>
(define (filter-drops lod)
  (cond [(empty? lod) empty]
        [else
         (if (fallen? (first lod))
             (filter-drops (rest lod))
             (cons (first lod) (filter-drops (rest lod))))]))

;; ===================

;; Drop -> Boolean
;; produces true if drop has fallen on ground
;; (define (fallen? d) false)

;; Exmaples/Tests
(check-expect (fallen? (make-drop 60 87)) (> 87 (- HEIGHT 30)))
(check-expect (fallen? (make-drop 60 HEIGHT)) (> HEIGHT (- HEIGHT 30)))
(check-expect (fallen? (make-drop 60 (+ HEIGHT SPEED))) (> (+ HEIGHT SPEED) (- HEIGHT 30)))

;; <Using template from Drop data defination>
(define (fallen? d)
  (> (drop-y d) (- HEIGHT 30)))    

;; ========================

;; ListOfDrop -> Image
;; render the drops onto MTS
;; (define (render-drops lod) MTS) ;stub

;; Examples/Tests
(check-expect (render-drops empty) MTS)

(check-expect (render-drops (cons (make-drop 10 10) empty))
              (place-image DROP 10 10 MTS))

(check-expect (render-drops (cons (make-drop 45 70) (cons (make-drop 10 10) empty)))
              (place-image DROP 45 70 (place-image DROP 10 10 MTS)))

;; <Using template from ListOfDrop data defination>
(define (render-drops lod)
  (cond [(empty? lod) MTS]
        [else
         (place-image DROP
                      (drop-x (first lod))
                      (drop-y (first lod))
                      (render-drops (rest lod)))]))

;; ==================

;; ListOfDrop -> ListOfDrop
;; Adds a new drop on mouse click
;; There is no stub

;; Examples/Tests
(check-expect (add-drop empty 10 10 "button-up") empty)
(check-expect (add-drop empty 10 10 "button-down") (cons (make-drop 10 10) empty))

(define (add-drop ws x y me)
  (cond [(mouse=? me "button-down") (cons (make-drop x y) ws)]
        [else ws]))









