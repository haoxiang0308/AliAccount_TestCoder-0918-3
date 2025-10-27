% База фактов о семье (Family facts database in Prolog)

% Родители (Parents)
parent(anna, maria).
parent(anna, ivan).
parent(petr, maria).
parent(petr, ivan).
parent(maria, dmitriy).
parent(maria, elena).
parent(ivan, alexei).
parent(ivan, svetlana).
parent(dmitriy, oleg).
parent(dmitriy, natalia).
parent(alexei, viktor).
parent(alexei, irina).

% Пол (Gender)
male(petr).
male(ivan).
male(dmitriy).
male(alexei).
male(oleg).
male(viktor).

female(anna).
female(maria).
female(elena).
female(svetlana).
female(natalia).
female(irina).

% Брак (Marriage)
married(anna, petr).
married(petr, anna).
married(maria, dmitriy).
married(dmitriy, maria).
married(ivan, svetlana).
married(svetlana, ivan).

% Правила (Rules)
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandmother(X, Z) :- grandparent(X, Z), female(X).
grandfather(X, Z) :- grandparent(X, Z), male(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).