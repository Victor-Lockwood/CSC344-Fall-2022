#lang racket
( require 2htdp/image )

; Modified CLISP code from CSC416 assignments of mine where applicable

; ----------------------
; TASK 1
; ----------------------

( define ( generate-uniform-list n lo )
    ( cond
        ( ( = n 0 ) null )
        ( else ( cons lo ( generate-uniform-list ( - n 1 ) lo ) ) )
    )
)

; ----------------------
; TASK 2
; ----------------------

( define ( a-list list1 list2 )
   ( cond
      ( ( null? list1 ) null )
      ( else
        ( define final-list ( list ( cons ( car list1 ) ( car list2 ) ) ) )
        ( append final-list ( a-list ( cdr list1 ) ( cdr list2 ) ) )
      )
   )
)

; ----------------------
; TASK 3
; ----------------------

( define ( assoc obj assoclist )
   ( cond
      ( ( null? assoclist ) null )
      ( ( equal? obj ( car ( car assoclist ) ) ) ( car assoclist ) )
      ( else ( assoc obj ( cdr assoclist ) ) )
   )
)

; ----------------------
; TASK 4
; ----------------------

( define ( rassoc obj assoclist )
   ( cond
      ( ( null? assoclist ) null )
      ( ( equal? obj ( cdr ( car assoclist ) ) ) ( car assoclist ) )
      ( else ( rassoc obj ( cdr assoclist ) ) )
   )
)

; ----------------------
; TASK 5
; ----------------------

( define ( los->s stringlist )
   ( cond
      ( ( null? stringlist ) "" )
      ( ( equal? ( length stringlist ) 1 ) ( car stringlist ) )
      ( else
        ( define final-string ( string-append ( car stringlist ) " "  ( los->s ( cdr stringlist ) ) ) )
        final-string
      )
   )
)

; ----------------------
; TASK 6
; ----------------------


( define ( generate-list n functionname )
   ( cond
      ( ( equal? n 0 ) null )
      ( else
        ( define final-list '() )
        ( set! final-list ( append ( list ( functionname ) ) ( generate-list (- n 1 ) functionname ) ) )
        final-list
      )
   )
)

; Auxillary Functions

( define ( roll-die ) ( + ( random 6 ) 1 ) )

( define ( dot )
   ( circle ( + 10 ( random 41 ) ) "solid" ( random-color ) )
)

( define ( big-dot )
   ( circle ( + 40 ( random 41 ) ) "solid" ( random-color ) )
)

( define ( random-color )
   ( color ( rgb-value ) ( rgb-value ) ( rgb-value ) )
)

( define ( rgb-value )
   ( random 256 )
)

( define ( sort-dots loc )
   ( sort loc #:key image-width < )
)

; ----------------------
; TASK 7
; ----------------------

( define ( single-diamond )
   ( rotate 45 ( square ( random 20 400 ) "solid" ( random-color ) ) )
)

( define ( diamond n )
   ( define diamond-list ( generate-list n single-diamond ) )
   ( foldr overlay empty-image ( sort-dots diamond-list ) )
)

; ----------------------
; TASK 8
; ----------------------

( define ( play pitch-list )
   ( define color-list ( map pc->color pitch-list ) )
   ( define box-list ( map color->box color-list ) )
   ( foldr beside empty-image box-list )
)

; Auxillary Functions

( define pitch-classes '( c d e f g a b ) )
( define color-names '( blue green brown purple red yellow orange ) )

( define ( box color )
   ( overlay
     ( square 30 "solid" color )
     ( square 35 "solid" "black" )
   )
)

( define boxes
   ( list
     ( box "blue" )
     ( box "green" )
     ( box "brown" )
     ( box "purple" )
     ( box "red" )
     ( box "gold" )
     ( box "orange" )
    )
)

( define pc-a-list ( a-list pitch-classes color-names ) )
( define cb-a-list ( a-list color-names boxes ) )

( define ( pc->color pc )
   ( cdr ( assoc pc pc-a-list ) )
)

( define ( color->box color )
   ( cdr ( assoc color cb-a-list ) )
)

; ----------------------
; TASK 9
; ----------------------

( define menu
   '( ( mayosurprise . 78.99 )
      ( grandpaslastlemon . 21 )
      ( oldteabag . 3)
      ( abcgum . 7 )
      ( mysteryfridgemold . 44 )
      ( ancientrelish . 0.50)
     )
 )

( define sales
   '( abcgum
      abcgum
      mysteryfridgemold
      oldteabag
      grandpaslastlemon
      grandpaslastlemon
      ancientrelish
      mayosurprise
      oldteabag
      ancientrelish

      oldteabag
      abcgum
      grandpaslastlemon
      mayosurprise
      ancientrelish
      ancientrelish
      mysteryfridgemold
      mysteryfridgemold
      oldteabag
      abcgum
      oldteabag

      grandpaslastlemon
      grandpaslastlemon
      mayosurprise
      oldteabag
      ancientrelish
      oldteabag
      abcgum
      grandpaslastlemon
      mayosurprise
      mayosurprise
    )
)

( define ( item->price item )
   ( cdr ( assoc item menu ) )
)

( define ( total solditems menuitem )
   ( define occurences ( filter ( lambda (l) ( eq? l menuitem ) ) solditems ) )
   ( define pricelist ( map item->price occurences ) )
   ( foldr + 0 pricelist )
)

; ----------------------
; TASK 10
; ----------------------

( define AI (text "A" 36 "orange") )
( define BI (text "B" 36 "red") )
( define CI (text "C" 36 "blue") )

( define DI (text "D" 36 "brown") )
( define EI (text "E" 36 "green") )
( define FI (text "F" 36 "orchid") )

( define GI (text "G" 36 "gold") )
( define HI (text "H" 36 "olive") )
( define II (text "I" 36 "cornflowerblue") )

( define JI (text "J" 36 "darkslategray") )
( define KI (text "K" 36 "plum") )
( define LI (text "L" 36 "silver") )

( define MI (text "M" 36 "fuchsia") )
( define NI (text "N" 36 "limegreen") )
( define OI (text "O" 36 "chocolate") )

( define PI (text "P" 36 "coral") )
( define QI (text "Q" 36 "crimson") )
( define RI (text "R" 36 "sienna") )

( define SI (text "S" 36 "tan") )
( define TI (text "T" 36 "hotpink") )
( define UI (text "U" 36 "springgreen") )

( define VI (text "V" 36 "midnightblue") )
( define WI (text "W" 36 "thistle") )
( define XI (text "X" 36 "cadetblue") )

( define YI (text "Y" 36 "firebrick") )
( define ZI (text "Z" 36 "dimgray") )

( define alphabet
   '(
     A B C
     D E F
     G H I
     J K L
     M N O
     P Q R
     S T U
     V W X
     Y Z
    )
)

( define alphapic
   ( list
     AI BI CI
     DI EI FI
     GI HI II
     JI KI LI
     MI NI OI
     PI QI RI
     SI TI UI
     VI WI XI
     YI ZI
    )
)

( define a->i ( a-list alphabet alphapic ) )

( define ( letter->image letter )
   ( cdr ( assoc letter a->i ) )
)

( define ( gcs letter-list )
   ( define image-list ( map letter->image letter-list ) )
   ( foldr beside empty-image image-list )
)