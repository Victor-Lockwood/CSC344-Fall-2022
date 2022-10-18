#lang racket

; Modified CLISP code from CSC416 assignments of mine where applicable
( define ( generate-uniform-list n lo )
    ( cond
        ( ( = n 0 ) null )
        ( else ( cons lo ( generate-uniform-list ( - n 1 ) lo ) ) )
    )
)

( define ( a-list list1 list2 )
   ( cond
      ( ( null? list1 ) null )
      ( else
        ( define final-list ( list ( cons ( car list1 ) ( car list2 ) ) ) )
        ( append final-list ( a-list ( cdr list1 ) ( cdr list2 ) ) )
      )
   )
)

( define ( assoc obj assoclist )
   ( cond
      ( ( null? assoclist ) null )
      ( ( equal? obj ( car ( car assoclist ) ) ) ( car assoclist ) )
      ( else ( assoc obj ( cdr assoclist ) ) )
   )
)

( define ( rassoc obj assoclist )
   ( cond
      ( ( null? assoclist ) null )
      ( ( equal? obj ( cdr ( car assoclist ) ) ) ( car assoclist ) )
      ( else ( rassoc obj ( cdr assoclist ) ) )
   )
)