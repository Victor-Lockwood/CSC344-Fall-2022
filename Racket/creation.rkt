#lang racket

( require 2htdp/image )

( define ( my-creation max-size color1 color2 )
   ( first-chain max-size color1 color2 )
   ( second-chain max-size 1 color1 color2 )
)

(  define ( first-chain max-size color1 color2 )
    ( cond
      ( ( not ( = max-size 0) )
        ( print ( overlay ( first-chain-link max-size color1 ) ( second-chain-link max-size color2  ) ) )
        ( first-chain ( - max-size 1 ) color1 color2 )
      )
    )
    
)

( define ( second-chain max-size current-space color1 color2 )
       ( cond
      ( ( not ( = max-size current-space) )
        ( print ( overlay ( first-chain-link current-space color2 ) ( second-chain-link current-space color1 ) ) )
        ;( display max-size ) ( display " " )
        ( second-chain max-size ( + current-space 1 ) color1 color2 )
      )
    )
)

( define ( first-chain-link max-size color )
   ( rhombus max-size 80 "solid" color)
)

( define ( second-chain-link max-size color )
   ( circle max-size "solid" color)
)