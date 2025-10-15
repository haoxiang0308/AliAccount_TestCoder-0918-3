% База фактов о семье

% Мужчины
male(иван).
male(пётр).
male(сергей).
male(андрей).
male(виталий).
male(олег).

% Женщины
female(мария).
female(анна).
female(ольга).
female(екатерина).
female(дарья).
female(алёна).

% Родители (parent, child)
parent(иван, пётр).
parent(иван, ольга).
parent(мария, пётр).
parent(мария, ольга).
parent(пётр, сергей).
parent(пётр, екатерина).
parent(анна, сергей).
parent(анна, екатерина).
parent(сергей, виталий).
parent(сергей, дарья).
parent(алёна, виталий).
parent(алёна, дарья).
parent(олег, андрей).

% Браки (супруги)
married(иван, мария).
married(пётр, анна).
married(сергей, алёна).
married(олег, екатерина).

% Правила

% Родитель
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).

% Ребёнок
child(X, Y) :- parent(Y, X).

% Брат или сестра
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Брат
brother(X, Y) :- male(X), sibling(X, Y).

% Сестра
sister(X, Y) :- female(X), sibling(X, Y).

% Дедушка
grandfather(X, Z) :- male(X), parent(X, Y), parent(Y, Z).

% Бабушка
grandmother(X, Z) :- female(X), parent(X, Y), parent(Y, Z).

% Двоюродный брат/сестра
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2).

% Зять/невестка
in_law(X, Y) :- married(X, Z), parent(Z, Y).