#lang racket
( require 2htdp/image )

; Modified CLISP code from CSC416 assignments of mine where applicable

; ----------------------
; TASK 1
; ----------------------

( define ( generate-uniform-list n lo )
    ( cond
        ( ( = n 0 ) null )
        ( else ( cons lo ( generate-uniform-list ( - n 1 ) lo ) ) )
    )
)

; ----------------------
; TASK 2
; ----------------------

( define ( a-list list1 list2 )
   ( cond
      ( ( null? list1 ) null )
      ( else
        ( define final-list ( list ( cons ( car list1 ) ( car list2 ) ) ) )
        ( append final-list ( a-list ( cdr list1 ) ( cdr list2 ) ) )
      )
   )
)

; ----------------------
; TASK 3
; ----------------------

( define ( assoc obj assoclist )
   ( cond
      ( ( null? assoclist ) null )
      ( ( equal? obj ( car ( car assoclist ) ) ) ( car assoclist ) )
      ( else ( assoc obj ( cdr assoclist ) ) )
   )
)

; ----------------------
; TASK 4
; ----------------------

( define ( rassoc obj assoclist )
   ( cond
      ( ( null? assoclist ) null )
      ( ( equal? obj ( cdr ( car assoclist ) ) ) ( car assoclist ) )
      ( else ( rassoc obj ( cdr assoclist ) ) )
   )
)

; ----------------------
; TASK 5
; ----------------------

( define ( los->s stringlist )
   ( cond
      ( ( null? stringlist ) "" )
      ( ( equal? ( length stringlist ) 1 ) ( car stringlist ) )
      ( else
        ( define final-string ( string-append ( car stringlist ) " "  ( los->s ( cdr stringlist ) ) ) )
        final-string
      )
   )
)

; ----------------------
; TASK 6
; ----------------------


( define ( generate-list n functionname )
   ( cond
      ( ( equal? n 0 ) null )
      ( else
        ( define final-list '() )
        ( set! final-list ( append ( list ( functionname ) ) ( generate-list (- n 1 ) functionname ) ) )
        final-list
      )
   )
)

; Auxillary Functions

( define ( roll-die ) ( + ( random 6 ) 1 ) )

( define ( dot )
   ( circle ( + 10 ( random 41 ) ) "solid" ( random-color ) )
)

( define ( big-dot )
   ( circle ( + 40 ( random 41 ) ) "solid" ( random-color ) )
)

( define ( random-color )
   ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) )
)

( define ( rgb-value )
   ( random 256 )
)

( define ( sort-dots loc )
   ( sort loc #:key image-width < )
)
