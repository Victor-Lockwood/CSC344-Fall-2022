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