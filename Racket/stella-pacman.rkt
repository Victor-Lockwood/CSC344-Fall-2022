#lang racket

( require 2htdp/image )

; Code modified from professor Graci's lecture code
; Referred to this for Pacman shape: https://docs.racket-lang.org/teachpack/2htdpimage.html

( define ( paint-nested-pacman from to delta color1 color2 )
   ( define radius ( * from delta ) )

   ( cond
      ( ( = from to )
        ( if (even? from )
             ( rotate 30 (wedge radius 300 "solid" color1 ) )
             ( rotate 30 (wedge radius 300 "solid" color2 ) )
        )
      )
      ( ( < from to )
        ( if ( even? from )
             ( overlay
               ( rotate 30 (wedge radius 300 "solid" color1 ) )
               ( paint-nested-pacman ( + from 1 ) to delta color1 color2 )
             )
             ( overlay
                ( rotate 30 (wedge radius 300 "solid" color2 ) )
                ( paint-nested-pacman ( + from 1 ) to delta color1 color2 )
             )

           )
        )
      )
                
)

( define ( stella radius count color1 color2 )
   ( define delta ( / radius count ) )
   ( paint-nested-pacman 1 count delta color1 color2 )
)