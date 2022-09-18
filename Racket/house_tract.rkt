; File: house_tract.rkt

#lang racket

( require 2htdp/image )

; Some code is from Professor Graci's lecture notes

( define ( rgb-value )
   ( random 256 )
)

( define ( random-color )
   ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) )
)

( define ( floor width height color )
   ( rectangle width height "solid" color )
)

( define ( house width height color1 color2 color3 )
   ( define floor1 ( floor width height color1 ) )
   ( define floor2 ( floor width height color2 ) )
   ( define floor3 ( floor width height color3 ) )
   ( define roof ( triangle width "solid" "grey" ) )
   ( define the-house ( above roof floor1 floor2 floor3 ) )
   the-house
)

( define ( tract width height )
   ( define color1 ( random-color ) )
   ( define color2 ( random-color ) )
   ( define color3 ( random-color ) )

   ( define house-width ( / width 6 ) )
   ( define floor-height ( / height 3 ) )

   ( define house1 ( house house-width floor-height color1 color2 color3 ) )
   ( define house2 ( house house-width floor-height color1 color3 color2 ) )
   ( define house3 ( house house-width floor-height color2 color1 color3 ) )
   ( define house4 ( house house-width floor-height color2 color3 color1 ) )
   ( define house5 ( house house-width floor-height color3 color1 color2 ) )
   ( define house6 ( house house-width floor-height color3 color2 color1 ) )

   ( define space ( square 10 'solid 'white ) )

   ( define tract ( beside house1 space house2 space house3 space house4 space house5 space house6 ) )

   tract
)