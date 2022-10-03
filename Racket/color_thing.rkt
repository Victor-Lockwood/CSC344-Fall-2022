#lang racket
( require 2htdp/image )
; Base code from Professor Graci's lecture

; ( rectangle 500 50 "solid" <COLOR> )

( define ( color-thing )
   ( display "(?): " )
   ( define input ( read ) )
   ( define command ( first input ) )
   ( define color-list ( second input ) )

   ( cond
      ( ( equal? command 'random )
        ( define color
           ( list-ref color-list ( random ( length color-list ) ) )
        )
        ( color-block color )
      )
      ( ( equal? command 'all )
        ( all-the-colors color-list )
      )
      ( #t
        ( define color
           ( list-ref color-list ( - command 1 ) )
        )
        ( color-block color ) 
      )
   )

   ( color-thing )
)

( define ( all-the-colors color-list )
   ( cond
      ( ( not ( eq? null color-list ) )
        ( color-block ( car color-list ) )
        ( all-the-colors ( cdr color-list ) ) 
      )
   )
)

( define ( color-block color )
   ( print ( rectangle 600 25 "solid" color ) ) ( display "\n" ) 
)