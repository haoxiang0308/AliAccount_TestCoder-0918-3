% База фактов о семье

% Предикаты: parent(Parent, Child), male(Person), female(Person)

% Определяем родителей
parent(anna, bob).
parent(anna, claire).
parent(mike, bob).
parent(mike, claire).
parent(bob, dave).
parent(bob, eve).
parent(claire, george).

% Определяем пол
male(mike).
male(bob).
male(dave).
male(george).
female(anna).
female(claire).
female(eve).