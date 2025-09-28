% База фактов о семье

% Предикаты: parent(Parent, Child), male(Person), female(Person)
% Отношения: mother(Mother, Child), father(Father, Child), sibling(X, Y)

% Определение родителей
parent(ann, james).
parent(ann, kate).
parent(fred, james).
parent(fred, kate).
parent(james, liz).
parent(james, pat).
parent(kate, anna).
parent(pat, ted).
parent(ted, will).

% Определение полов
male(fred).
male(james).
male(pat).
male(ted).
male(will).

female(ann).
female(kate).
female(liz).
female(anna).

% Правила
mother(Mother, Child) :- parent(Mother, Child), female(Mother).
father(Father, Child) :- parent(Father, Child), male(Father).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.