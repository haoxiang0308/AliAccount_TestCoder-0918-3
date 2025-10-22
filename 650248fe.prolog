% База фактов о семье
% Родители и дети
parent(anna, maria).
parent(anna, ivan).
parent(petr, maria).
parent(petr, ivan).
parent(maria, elena).
parent(maria, alexei).
parent(ivan, svetlana).
parent(ivan, dmitri).
parent(elena, katarina).
parent(alexei, viktor).
parent(svetlana, olga).
parent(dmitri, sergei).

% Мужчины
male(petr).
male(ivan).
male(alexei).
male(dmitri).
male(viktor).
male(sergei).

% Женщины
female(anna).
female(maria).
female(elena).
female(svetlana).
female(katarina).
female(olga).

% Отношения: отец
father(petr, maria).
father(petr, ivan).
father(ivan, svetlana).
father(ivan, dmitri).
father(alexei, viktor).
father(dmitri, sergei).

% Отношения: мать
mother(anna, maria).
mother(anna, ivan).
mother(maria, elena).
mother(maria, alexei).
mother(elena, katarina).
mother(svetlana, olga).

% Брат и сестра
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Брат
brother(X, Y) :- sibling(X, Y), male(X).

% Сестра
sister(X, Y) :- sibling(X, Y), female(X).

% Дедушка
grandfather(X, Z) :- parent(Y, Z), father(X, Y).

% Бабушка
grandmother(X, Z) :- parent(Y, Z), mother(X, Y).

% Дядя
uncle(X, Z) :- parent(Y, Z), brother(X, Y).

% Тетя
aunt(X, Z) :- parent(Y, Z), sister(X, Y).