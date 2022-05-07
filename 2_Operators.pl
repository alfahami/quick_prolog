% COMPARATORS OPERATOR

/* 
    X =:= Y | X & Y values are equal
    X=\= Y  | X & Y are not equal
    X =< Y  | X is less than or equal to Y

1+2=:=2+1. % True, cuz it checking the value

1+2=2+1. % False, because it checking whetever '1+2' with '2+1'

1+A=B+2. % A & B are automatically assinged to values that will match the pattern

A = 2 et B = 1

*/

% ARITMETIC OPERATORS

/* 
    **  POWER
    //  INTEGER DIVISION
    mod MODULUS
*/

calc :- 
    X is 100 +200, write('100 + 200 is '),write(X),nl,
        Y is 400 - 150, write('400 - 150 is '),write(Y),nl,
        Z is 10 * 300, write('10 * 300 is '),write(Z),nl,
        A is 100 / 30,write('100 / 30 is '),write(A),nl,
        B is 100 // 30,write(' 100 // 30 is '),write(B),nl,
        C is 100 ** 2,write('100 ** 2 is '),write(C),nl,
        D is 100 mod 30,write('100 mod 30 is '),write(D),nl.
