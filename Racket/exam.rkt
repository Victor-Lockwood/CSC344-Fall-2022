#lang racket
( require 2htdp/image )

( define ( diamond side col1 col2 )
   ( above
     ( triangle side 'solid col1 )
     ( rotate 180 ( triangle side 'solid col2 ) )
   )
)

( define ( diamond-of-diamonds side )
   ( overlay
     ( beside
       ( diamond side 'red 'blue )
       ( diamond side 'blue 'red )
      )
     ( above
       ( diamond side 'purple 'orange )
       ( diamond side 'orange 'purple )
      )
   )
)

( define ( line n side c1 c2 )
   ( cond
      ( ( not ( eq? n 0 ) )
        ( beside
          ( rectangle side side 'solid c1 )
          ( line ( - n 1 ) side c2 c1 )
        )
      )
      ( #t
        empty-image
      )
   )
)

( define ( pick l )
   ( define pos ( random ( length l ) ) )
   ( define el ( list-ref l pos ) )
   el
)

( define ( select l n )
   ( cond
      ( ( eq? n 0 )
        null
      )
      ( #t
        ( define list2 ( list ( pick l ) ) )
        ( append list2 ( select l ( - n 1 ) ) )
      )
   )
)