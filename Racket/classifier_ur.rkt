#lang racket
( require racket/trace )

; Some code from Professor Graci's lecture notes

( define ( classify-two-cards-ur card-list )
   ( display card-list ) ( display ": " )
   ( define card1 ( first card-list ) )
   ( define card2 ( second card-list ) )

   ( display ( higher-rank card1 card2 ) ) ( display " high " )
   ( display-if-straight card1 card2 )
   ( display-if-flush card1 card2 )
)

( define ( classify-two-cards card-list )
   ( display card-list ) ( display ": " )
   ( define card1 ( first card-list ) )
   ( define card2 ( second card-list ) )

   ( display ( get-nlp-rank ( higher-rank card1 card2 ) ) ) ( display " high " )
   ( display-if-straight card1 card2 )
   ( display-if-flush card1 card2 )
)

( define ( get-nlp-rank rank )
   ( cond
      ( ( equal? rank 1 )
        'one
      )
      ( ( equal? rank 2 )
        'two
      )
      ( ( equal? rank 3 )
        'three
      )
      ( ( equal? rank 4 )
        'four
      )
      ( ( equal? rank 5 )
        'five
      )
      ( ( equal? rank 6 )
        'six
      )
      ( ( equal? rank 7 )
        'seven
      )
      ( ( equal? rank 8 )
        'eight
      )
      ( ( equal? rank 9 )
        'nine
      )
      ( ( equal? rank 'X )
        'ten
      )
      ( ( equal? rank 'J )
        'jack
      )
      ( ( equal? rank 'Q )
        'queen
      )
      ( ( equal? rank 'K )
        'king
      )
      ( ( equal? rank 'A )
        'ace
      )
      ( ( equal? rank 'equal )
        'no
      )
   )
)

( define ( display-if-straight card1 card2 )
   ( define rank1 ( rank card1 ) )
   ( define rank2 ( rank card2 ) )
   ( define number-val1 ( get-number-value rank1 ) )
   ( define number-val2 ( get-number-value rank2 ) )
   ( cond
      ( ( = number-val1 ( + number-val2 1 ) )
        ( display "straight " )
      )
      ( ( = number-val2 ( + number-val1 1 ) )
        ( display "straight " )
      )
   )
)

( define ( display-if-flush card1 card2 )
   ( define suit1 ( suit card1 ) )
   ( define suit2 ( suit card2 ) )
   ( define rank1 ( rank card1 ) )
   ( define rank2 ( rank card2 ) )
   ( cond
      ( ( equal? suit1 suit2 )
        ( display "flush " )
      )
      ( ( equal? rank1 rank2 )
        ( display "flush " )
      )
   )
)

( define ( higher-rank card1 card2 )
   ( define rank1 ( rank card1 ) )
   ( define rank2 ( rank card2 ) )
   ( define number-val1 ( get-number-value rank1 ) )
   ( define number-val2 ( get-number-value rank2 ) )
   
   ( cond
      ( ( equal? rank1 rank2 )
        'equal
      )
      ( ( > number-val1 number-val2 )
        rank1
      )
      ( ( < number-val1 number-val2 )
        rank2
      )
   )
)

( define ( get-number-value input )
   ( cond
      ( ( number? input )
        input
      )
      ( ( equal? input 'X )
        10
      )
      ( ( equal? input 'J )
        11
      )
      ( ( equal? input 'Q )
        12
      )
      ( ( equal? input 'K )
        13
      )
      ( ( equal? input 'A )
        14
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

;( trace higher-rank )