% База фактов о семье

% Предикаты: parent(Parent, Child), male(Person), female(Person)
% parent(X, Y) означает, что X - родитель Y

% Отношения родитель-ребенок
parent(anna, bob).
parent(anna, claire).
parent(david, bob).
parent(david, claire).
parent(bob, eve).
parent(bob, fred).
parent(claire, gina).

% Пол
male(david).
male(bob).
male(fred).
female(anna).
female(claire).
female(eve).
female(gina).