% --------------------------------------------
% File: list_processors.pro
% Code from Professor Graci's lecture notes
% --------------------------------------------

first([H|_], H).


rest([_|T], T).


last([H|[]], H).
last([_|T], Result) :- 
    last(T, Result).


nth(0,[H|_],H).
nth(N,[_|T],E) :- 
    K is N - 1, 
    nth(K,T,E).


writelist([]).
writelist([H|T]) :- 
    write(H), nl, 
    writelist(T).


sum([],0).
sum([Head|Tail],Sum) :-
    sum(Tail,SumOfTail),
    Sum is Head + SumOfTail.


add_first(X,L,[X|L]).


add_last(X,[],[X]).
add_last(X,[H|T],[H|TX]) :- 
    add_last(X,T,TX).


iota(0,[]).
iota(N,IotaN) :-
    K is N - 1,
    iota(K,IotaK),
    add_last(N,IotaK,IotaN).


pick(L,Item) :-
    length(L,Length),
    random(0,Length,RN),
    nth(RN,L,Item).


make_set([],[]).
make_set([H|T],TS) :-
    member(H,T),
    make_set(T,TS).
make_set([H|T],[H|TS]) :-
    make_set(T,TS).

% --------------------------------------------
% Newly defined predicates
% --------------------------------------------

product([],1).
product([Head|Tail],Product) :-
    product(Tail,ProductOfTail),
    Product is Head * ProductOfTail.

factorial(Num, Factorial) :-
    iota(Num, Iota),
    product(Iota, Product),
    Factorial is Product.

make_list(0, _, _).
make_list(Occurences, Item, List) :-
    K is Occurences - 1,
    make_list(K, Item, ListK),
    add_last(Item, ListK, List).

% This is pretty much the same as last...?
but_first([_|Cdr], Cdr).

but_last(L, List) :-
    reverse(L, FirstPass),
    but_first(FirstPass, Cdr),
    reverse(Cdr, List).

is_palindrome([]).
is_palindrome(List) :-
    length(List, L),
    L = 1.
is_palindrome(List) :-
    first(List, H),
    last(List, L),
    L = H,
    but_last(List, Truncated),
    but_first(Truncated, Final),
    is_palindrome(Final).

noun_phrase(NP) :-
    pick([potato, tomato, habanero, taquito, emoji, shirt, controller, fridge], Noun),
    pick([spicy, large, evil, deceptive, annoying, boring], Adjective),
    NP = [the, Adjective, Noun].

sentence(S) :-
    noun_phrase(NP1),
    noun_phrase(NP2),
    pick([ate, destroyed, wrote, buried, vetoed, threw, stamped], Verb),
    append(NP1, [Verb], S0),
    append(S0, NP2, S).