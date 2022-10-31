% ----------------------------------------------------
% different(X,Y) :: X is not equal to Y
% ----------------------------------------------------

different(red, blue).
different(red, green).
different(red, orange).

different(green, blue).
different(green, orange).
different(green, red).

different(blue, green).
different(blue, green).
different(blue, red).

different(orange, blue).
different(orange, green).
different(orange, red).


% ----------------------------------------------------
% coloring(OU, SEC1, SEC2, SEC3, SEC4, 
%    T1, T2, T3, T4, T5, T6, T7, T8, I1, I2, I3, I4) :: Sections of
% the map colored so no sections sharing a border are the same color
% ----------------------------------------------------

coloring(OU, SEC1, SEC2, SEC3, SEC4, T1, T2, T3, T4, T5, T6, T7, T8, I1, I2, I3, I4):-
    different(OU, SEC1),
    different(OU, SEC2),
    different(OU, SEC3),
    different(OU, SEC4),

    different(SEC1, SEC2),
    different(SEC1, SEC4),
    different(SEC2, SEC3),
    different(SEC3, SEC4),

    different(SEC1, T1),
    different(SEC1, T4),
    different(SEC2, T3),
    different(SEC2, T4),
    different(SEC3, T5),
    different(SEC3, T6),
    different(SEC4, T7),
    different(SEC4, T8),

    different(T1, T2),
    different(T1, T8),
    different(T2, T3),
    different(T3, T4),
    different(T4, T5),
    different(T5, T6),
    different(T7, T8),
    different(T1, I1),
    different(T2, I2),
    different(T3, I2),
    different(T4, I3),
    different(T5, I3),
    different(T6, I4),
    different(T7, I4),
    different(T8, I1),

    different(I1, I2),
    different(I1, I4),
    different(I2, I3),
    different(I3, I4).
