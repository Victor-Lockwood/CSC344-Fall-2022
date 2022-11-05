% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- File: pokemon.pro
% --- Line: Just a few facts about pokemon
% -----------------------------------------------------------------------
% Facts were written by Professor Graci.

% -----------------------------------------------------------------------
% --- cen(P) :: Pokemon P was "creatio ex nihilo"

cen(pikachu).
cen(bulbasaur).
cen(caterpie).
cen(charmander).
cen(vulpix).
cen(poliwag).
cen(squirtle).
cen(staryu).

% -----------------------------------------------------------------------
% --- evolves(P,Q) :: Pokemon P directly evolves to pokemon Q

evolves(pikachu,raichu).
evolves(bulbasaur,ivysaur).
evolves(ivysaur,venusaur).
evolves(caterpie,metapod).
evolves(metapod,butterfree).
evolves(charmander,charmeleon).
evolves(charmeleon,charizard).
evolves(vulpix,ninetails).
evolves(poliwag,poliwhirl).
evolves(poliwhirl,poliwrath).
evolves(squirtle,wartortle).
evolves(wartortle,blastoise).
evolves(staryu,starmie).

% -----------------------------------------------------------------------
% --- pokemon(name(N),T,hp(H),attach(A,D)) :: There is a pokemon with
% --- name N, type T, hit point value H, and attach named A that does
% --- damage D.

pokemon(name(pikachu), electric, hp(60), attack(gnaw, 10)).
pokemon(name(raichu), electric, hp(90), attack(thunder-shock, 90)).

pokemon(name(bulbasaur), grass, hp(40), attack(leech-seed, 20)).
pokemon(name(ivysaur), grass, hp(60), attack(vine-whip, 30)).
pokemon(name(venusaur), grass, hp(140), attack(poison-powder, 70)).

pokemon(name(caterpie), grass, hp(50), attack(gnaw, 20)).
pokemon(name(metapod), grass, hp(70), attack(stun-spore, 20)).
pokemon(name(butterfree), grass, hp(130), attack(whirlwind, 80)).

pokemon(name(charmander), fire, hp(50), attack(scratch, 10)).
pokemon(name(charmeleon), fire, hp(80), attack(slash, 50)).
pokemon(name(charizard), fire, hp(170), attack(royal-blaze, 100)).

pokemon(name(vulpix), fire, hp(60), attack(confuse-ray, 20)).
pokemon(name(ninetails), fire, hp(100), attack(fire-blast, 120)).

pokemon(name(poliwag), water, hp(60), attack(water-gun, 30)).
pokemon(name(poliwhirl), water, hp(80), attack(amnesia, 30)).
pokemon(name(poliwrath), water, hp(140), attack(dashing-punch, 50)).

pokemon(name(squirtle), water, hp(40), attack(bubble, 10)).
pokemon(name(wartortle), water, hp(80), attack(waterfall, 60)).
pokemon(name(blastoise), water, hp(140), attack(hydro-pump, 60)).

pokemon(name(staryu), water, hp(40), attack(slap, 20)).
pokemon(name(starmie), water, hp(60), attack(star-freeze, 20)).



% --------------------------------------------
% Added Rules
% --------------------------------------------


% --------------------------------------------
% display_names :: displays the names of all Pokemon

display_names :-
    pokemon(name(N), _, _, _),
    write(N), nl,
    fail.
display_names.


% --------------------------------------------
% display_attacks :: displays the names of 
% each Pokemon's attack

display_attacks :-
    pokemon(_, _, _, attack(A, _)),
    write(A), nl,
    fail.
display_attacks.


% --------------------------------------------
% powerful(N) :: Returns true if Pokemon with name N has an attack that deals > 55 damage 

powerful(N) :-
    pokemon(name(N), _, _, attack(_, D)),
    D > 55.


% --------------------------------------------
% tough(N) :: Returns true if Pokemon with name N has an an HP value > 100 

tough(N) :-
    pokemon(name(N), _, hp(HP), _),
    HP > 100.


% --------------------------------------------
% type(N, T) :: Returns true if the Pokemon with the specified name N is type T

type(N, T) :-
    pokemon(name(N), T, _, _).


% --------------------------------------------
% dump_kind(T) :: Displays all information of Pokemon of type T

dump_kind(T) :-
    pokemon(N, T, HP, A),
    write(pokemon(N, T, HP, A)), nl,
    fail.


% --------------------------------------------
% display_cen :: Display the names of all "creatio ex nihilo" Pokemon

display_cen :-
    cen(N),
    write(N), nl, 
    fail.
display_cen.


% --------------------------------------------
% family(N) :: Display the evolutionary family of a 
% "creatio ex nihilo" Pokemon with name N 

family(N) :-
    evolves(N, X),
    evolves(X, Y),
    write(N), write(' '), write(X), write(' '), write(Y).
family(N) :-
    evolves(N, X),
    write(N), write(' '), write(X).


% --------------------------------------------
% families :: Displays all evolutionary families

families :-
    cen(N),
    family(N), nl,
    fail.
families.

% --------------------------------------------
% lineage(N) :: Displays all information for the Pokemon N and each one that 
% comes after it evolutionarily

lineage(N) :-
    evolves(N, X),
    evolves(X, Y),
    pokemon(name(N), T1, HP1, A1),
    pokemon(name(X), T2, HP2, A2),
    pokemon(name(Y), T3, HP3, A3),
    write(pokemon(name(N), T1, HP1, A1)), nl,
    write(pokemon(name(X), T2, HP2, A2)), nl,
    write(pokemon(name(Y), T3, HP3, A3)).
lineage(N) :-
    evolves(N, X),
    pokemon(name(N), T1, HP1, A1),
    pokemon(name(X), T2, HP2, A2),
    write(pokemon(name(N), T1, HP1, A1)), nl,
    write(pokemon(name(X), T2, HP2, A2)).
lineage(N) :-
    pokemon(name(N), T, HP, A),
    write(pokemon(name(N), T, HP, A)).