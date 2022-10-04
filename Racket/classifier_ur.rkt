#lang racket
( require racket/trace )

; Some code from Professor Graci's lecture notes

( define ( higher-rank card1 card2 )
   ( define rank1 ( rank card1 ) )
   ( define rank2 ( rank card2 ) )
   ( cond
      ( ( equal? rank1 'A )
        rank1
      )
   )
)

( define ( pick-two-cards )
   ( define card1 ( pick-a-card ) )
   ( define card2 ( pick-a-card ) )

   ( cond
      ( ( not ( equal? card1 card2 ) )
        ( list card1 card2 ) 
      )
      ( #t
        ( pick-two-cards )
      )
   )
)

( define ( ranks rank )
   ( list
     ( list rank 'C )
     ( list rank 'D )
     ( list rank 'H )
     ( list rank 'S )
    )
)

( define ( deck )
   ( append
     ( ranks 2 )
     ( ranks 3 )
     ( ranks 4 )
     ( ranks 5 )
     ( ranks 6 )
     ( ranks 7 )
     ( ranks 8 )
     ( ranks 9 )
     ( ranks 'X )
     ( ranks 'J )
     ( ranks 'Q )
     ( ranks 'K )
     ( ranks 'A )
    )
)

( define ( pick-a-card )
   ( define cards ( deck ) )
   ( list-ref cards ( random ( length cards ) ) )
)

( define ( show card )
   ( display ( rank card ) )
   ( display ( suit card ) )
)

( define ( rank card )
   ( car card )
)

( define ( suit card )
   ( cadr card )
)

( define ( red? card )
   ( or
     ( equal? ( suit card ) 'D )
     ( equal? ( suit card ) 'H )
   )
)

( define ( black? card )
   ( not ( red? card ) )
)

( define ( aces? card1 card2 )
   ( and
     ( equal? ( rank card1 ) 'A )
     ( equal? ( rank card2 ) 'A )
   )
)