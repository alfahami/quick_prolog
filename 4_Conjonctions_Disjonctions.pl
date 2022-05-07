% CONJONCTION

/* 
    AND LOGIC is expressed with (,) operator.
    Two predicates separated by comma are joined with AND statement.
*/

% DISCJONCTION

/* 
    OR LOGIC is expressed with (;) operator
    Two predicates separated by sem-colon are joind with OR
*/


parent(john, bob).
parent(lili, bob).

male(john).
female(lili).

% Conjonction Logic
father(X,Y) :- parent(X,Y),male(X).
mother(X,Y) :- parent(X,Y),female(X).

% Disjonction Logic
child_of(X,Y) :- father(X,Y);mother(X,Y).