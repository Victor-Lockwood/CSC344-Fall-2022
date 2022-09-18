#lang racket

( require 2htdp/image )

; Some code is from Professor Graci's lecture notes

( define ( rgb-value )
   ( random 256 )
)

( define ( random-color )
   ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) )
)

( define space ( square 20 'solid 'white ) )

( define ( random-color-dot )
   ( circle 30 "solid" ( random-color ) )
)

( define ( row-of-dots n )
   ( cond
      ( ( = n 0 )
        empty-image
      )
      ( ( > n 0 )
        ( beside ( row-of-dots ( - n 1 ) ) space ( random-color-dot ))
       )
    )
)

( define ( rectangle-of-dots r c )
   ( cond
      ( ( = r 0 )
        empty-image
      )
      ( ( > r 0 )
        ( above ( rectangle-of-dots ( - r 1 ) c ) space ( row-of-dots c ) ) 
      )
   )
)

( define ( hirst-dots s ) ( rectangle-of-dots s s ) )