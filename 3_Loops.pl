/* 
    We use a recursive predicate logic to call a block multiple times.
    There are no for, while, ...
*/

count_to_10(10) :- write(10),nl. 
count_to_10(X) :- 
    write(X),nl,
    Y is X + 1,
    count_to_10(Y).

count_down(L, H) :-
    between(L, H, Y), % as Y is a variable, it is bound to all integers between L(low) and H(high) with Low and High included
    Z is H - Y,
    write(Z), nl.

count_up(L, H) :- 
    between(L, H, Y),
    Z is L + Y,
    write(Z), nl.

% DECISION MAKING
 /* 
    Normally, the decision making is like, well in most langage
    If <condition> is true, Then <do this>, Else 

    But in prolog we have to define in some other manner
 */

% If-Ten-Else statement

gt(X,Y) :- X >= Y,write('X is greater or equal to Y').
gt(X,Y) :- X < Y,write('X is smaller').

% If-Elif-Else statement

gte(X,Y) :- X > Y,write('X is greater than Y').
gte(X,Y) :- X =:= Y,write('X and Y are eqaul').
gte(X,Y) :- X < Y,write('X is smaller').