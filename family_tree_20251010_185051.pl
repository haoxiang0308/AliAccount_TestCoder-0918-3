% База фактов Prolog о семье
% Предикаты: parent(Parent, Child), male(Person), female(Person)

% Определение родительских связей
parent(иван, мария).
parent(иван, алексей).
parent(ольга, мария).
parent(ольга, алексей).
parent(алексей, дмитрий).
parent(алексей, анастасия).
parent(екатерина, дмитрий).
parent(екатерина, анастасия).

% Определение полов
male(иван).
male(алексей).
male(дмитрий).

female(ольга).
female(мария).
female(екатерина).
female(анастасия).