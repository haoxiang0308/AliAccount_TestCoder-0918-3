% Family facts in Prolog
% Parents
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Gender
male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).

% Spouses
spouse(tom, liz).
spouse(liz, tom).
spouse(bob, ann).
spouse(ann, bob).
spouse(pat, jim).
spouse(jim, pat).

% Derived relationships
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandmother(X, Z) :- grandparent(X, Z), female(X).
grandfather(X, Z) :- grandparent(X, Z), male(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).