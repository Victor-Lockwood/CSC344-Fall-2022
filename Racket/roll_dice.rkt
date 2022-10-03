#lang racket

; Some code modified from Professor Graci's lecture notes

( define ( roll-die )
   ( define outcome ( random 1 7 ) )
   outcome
)

( define ( roll-for-1 )
   ( define result ( roll-die ) )
   ( display result )
   ( display " " )
   ( cond
      ( ( not ( eq? result 1 ) )
        ( roll-for-1 )
      )
   )
)

( define ( roll-for-11 )
   ( roll-for-1 )
   ( define result ( roll-die ) )
   ( display result )
   ( display " " )
   ( cond
      ( ( not ( eq? result 1 ) )
        ( roll-for-11 )
       )
   )
)



( define ( roll-two-dice-for-a-lucky-pair )
   ( define result1 ( roll-die ) )
   ( define result2 ( roll-die ) )

   ( display "( " ) ( display result1 ) ( display " " ) ( display result2 ) ( display " ) ")

   ( cond
      (  ( not ( = result1 result2 ) )
         ( define result-sum ( + result1 result2 ) )
         ( cond
            ( ( not ( = 11 result-sum ) )
            ( cond
               ( ( not ( = 7 result-sum ) )
                  ( roll-two-dice-for-a-lucky-pair )
                 )
               )
             )
         )
      )
   )
)

; Found use of "odd?" and "even?" comparators when looking at classmate's code:
; https://www.cs.oswego.edu/~dmitche7/CSC344WorkSite/Racket/Racket%202%20Assignment.pdf
; These methods are my own however and we approached in different ways

( define ( roll-for-odd )
   ( define result ( roll-die ) )
   ( display result )
   ( display " " )
   ( cond
      ( ( even? result ) 
        ( roll-for-odd )
      )
   )
)

( define ( roll-for-even )
   ( define result ( roll-die ) )
   ( display result )
   ( display " " )
   ( cond
      ( ( odd? result ) 
        ( roll-for-even )
      )
   )
)

( define ( roll-for-odd-even-odd )
   ( roll-for-odd )
   ( roll-for-even )
   
   ( define result ( roll-die ) )
   ( display result )
   ( display " " )
   
   ( cond
      ( ( even? result ) 
        ( roll-for-odd-even-odd )
      )
   )
)