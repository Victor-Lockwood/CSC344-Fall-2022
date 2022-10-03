#lang racket

; Recreate this output except with lambda expressions:
;
; > ( mlr ’red ’yellow ’blue )
; '(blue yellow red)
; > ( mlr 10 20 30 )
; '(30 20 10)
; > ( mlr "Professor Plum" "Colonel Mustard" "Miss Scarlet" )
; '("Miss Scarlet" "Colonel Mustard" "Professor Plum")

( ( lambda ( a b c )
     ( define final-list ( reverse ( list a b c ) ) )
     final-list
   )
  'red 'yellow 'blue
)

( ( lambda ( a b c )
     ( define final-list ( reverse ( list a b c ) ) )
     final-list
   )
  '10 '20 '30
)

( ( lambda ( a b c )
     ( define final-list ( reverse ( list a b c ) ) )
     final-list
   )
  "Professor Plum" "Colonel Mustard" "Miss Scarlet"
)