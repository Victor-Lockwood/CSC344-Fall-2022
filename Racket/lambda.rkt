#lang racket

; Recreate this output but with lambda expressions:
;
; > ( asc 5 )
; ’(5 6 7)
; > ( asc 0 )
; ’(0 1 2)
; > ( asc 108 )
; ’(108 109 110)

( ( lambda ( n )
     ( define a ( + n 1 ) )
     ( define b ( + a 1 ) )
     ( define final-list ( list n a b ) )
     final-list
   )
  5
)

( ( lambda ( n )
     ( define a ( + n 1 ) )
     ( define b ( + a 1 ) )
     ( define final-list ( list n a b ) )
     final-list
   )
  0
)

( ( lambda ( n )
     ( define a ( + n 1 ) )
     ( define b ( + a 1 ) )
     ( define final-list ( list n a b ) )
     final-list
   )
  108
)