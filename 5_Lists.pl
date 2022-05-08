/* 
    Lists are used to store the atoms as a collection
    Lists can either be empty [] or non-empty [atom, hello, 12,[]]
    Consist of two things
    
    Head : first item of the list
    Tail : the remaining part of the list, and can be another list in case of multiple elements

    L = [a, b, c], Tail = [b, c] then L = [a | Tail]
    [a, b, c] = [x | [b, c]]
    [a, b, c] = [a,b | [c]]
    [a, b, c] = [a,b,c |[]]

    List is a DATA STRUCTURE that consists of two parts, the head and a tail. The tail itself has to be a list

    % Basic Operations: 
        Membership checking, Length calculation, Concatenation, Delete Item, Append Item, Insert Item 
*/

% Members Operation

/* 
    X is a member of L if either −
        X is head of L, or
        X is a member of the tail of L
*/

member(X,[X|_]).
member(X,[_|TAIL]) :- list_member(X,TAIL).

list_member(a,[a,b,c]).
list_member(b,[a,[b,c]]). % False
list_member([b,c],[a,[b,c]]).
list_member(d,[a,b,c]).

% Length Calculation

/* 
    If list is empty, then length is 0.

    If the list is not empty, then L = [Head|Tail], then its length is 1 + length of Tail.
*/

list_length([], 0).
list_length([_|TAIL], N) :- list_length(TAIL, N1), N is N1 + 1.

% list_length([a,b,c,d,e,f,g,h,i], Len).

% Concatenation

/* 
    If the first list is empty, and second list is L, then the resultant list will be L.

    If the first list is not empty, then write this as [Head|Tail], concatenate Tail with L2 recursively, and store into new list in the form, [Head|New List].
*/

list_concat([], L, L).
list_concat([X1|L1],L2,[X1|L3]) :- list_concat(L1,L2,L3).


% Delete from List

/* 
    If X is the only element, then after deleting it, it will return empty list.

    If X is head of L, the resultant list will be the Tail part.

    If X is present in the Tail part, then delete from there recursively.
*/

list_delete(X, [X], []).
list_delete(X, [X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).

% Append into List

/* 
    Let A is an element, L1 is a list, the output will be L1 also, when L1 has A already.

    Otherwise new list will be L2 = [A|L1].
*/

member2(X, [X|_]).
member2(X,[_|TAIL]) :- list_member(X, TAIL).

list_append(A,T,T) :- list_member(A,T),!.
list_append(A,T,[A|T]).