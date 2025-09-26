% База фактов о семье

% Предикаты: parent(Parent, Child), male(Person), female(Person)

% Определение полов
male(john).
male(mike).
male(dave).
female(lisa).
female(mary).
female(sarah).

% Отношения отец-ребенок
parent(john, mary).
parent(john, mike).
parent(lisa, mary).
parent(lisa, mike).
parent(mike, dave).
parent(sarah, dave).