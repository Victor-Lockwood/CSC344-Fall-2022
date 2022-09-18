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

( define ( roll-for-odd )
   ( define result ( roll-die ) )
   ( display result )
   ( display " " )
   ( cond
      ( ( eq? ( remainder result 2 ) 0 ) 
        ( roll-for-odd )
      )
   )
)

( define ( roll-for-odd-even )
   ( roll-for-odd )
   
   ( define result ( roll-die ) )
   ( display result )
   ( display " " )
   
   ( cond
      ( ( > ( remainder result 2 ) 0 ) 
        ( roll-for-odd-even )
      )
   )
)

( define ( roll-for-odd-even-odd )
   ( roll-for-odd-even )
   
   ( define result ( roll-die ) )
   ( display result )
   ( display " " )
   ( cond
      ( ( eq? ( remainder result 2 ) 0 ) 
        ( roll-for-odd-even-odd )
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
            ()
         )
      )
   )
)