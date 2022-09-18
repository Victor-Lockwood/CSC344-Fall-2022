#lang racket

( define ( square n )
   ( * n n )
)

( define ( cube n )
   ( * n n n )
)

( define ( sequence name n )
   ( cond
      ( ( = n 1 )
        ( display ( name 1 ) ) ( display " " )
      )
      ( else
        ( sequence name ( - n 1 ) )
        ( display ( name n ) ) ( display " " )
      )
    )
)

( define ( triangular n )
   ( cond
      ( ( = n 1 ) 1 )
      ( ( > n 1)
        ( + n ( triangular ( - n 1 ) ) )
      )
   )
)

( define ( sigma n )
   ( cond
      ( ( = n 0 ) 0 )
      ( ( > n 0 )
        ( display n ) ( display " " )
        ( + ( sigma (- n 1) ) (  check-divisor n ( - n 1 ) ) ) 
      )
   )
)

( define ( check-divisor n candidate )
   ( cond
      (
       ( eq? candidate 1 1 )
       ( eq? ( remainder n candidate ) 0 ) candidate )
      
      ( else ( check-divisor n ( - candidate 1 ) ) )
   )
)