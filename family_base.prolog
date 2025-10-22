% Family facts base in Prolog
% Parents and children
parent(john, mary).
parent(john, paul).
parent(mary, lisa).
parent(mary, tom).
parent(paul, anna).
parent(lisa, david).
parent(tom, sarah).
parent(anna, peter).

% Males
male(john).
male(paul).
male(tom).
male(david).
male(peter).

% Females
female(mary).
female(lisa).
female(anna).
female(sarah).

% Father relationships
father(john, mary).
father(john, paul).
father(paul, anna).
father(tom, sarah).
father(anna, peter).

% Mother relationships
mother(mary, lisa).
mother(mary, tom).
mother(lisa, david).

% Sibling relationship
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Brother relationship
brother(X, Y) :- sibling(X, Y), male(X).

% Sister relationship
sister(X, Y) :- sibling(X, Y), female(X).

% Grandfather relationship
grandfather(X, Z) :- parent(Y, Z), father(X, Y).

% Grandmother relationship
grandmother(X, Z) :- parent(Y, Z), mother(X, Y).

% Uncle relationship
uncle(X, Z) :- parent(Y, Z), brother(X, Y).

% Aunt relationship
aunt(X, Z) :- parent(Y, Z), sister(X, Y).