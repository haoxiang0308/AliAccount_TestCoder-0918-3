% База фактов о семье (Family facts database in Prolog)

% Мужчины (Males)
male(иван).
male(андрей).
male(сергей).
male(павел).
male(михаил).

% Женщины (Females)
female(мария).
female(ольга).
female(екатерина).
female(анна).
female(дарья).

% Родители (Parents)
% Иван - родитель Андрея и Ольги
parent(иван, андрей).
parent(иван, ольга).

% Мария - родитель Андрея и Ольги
parent(мария, андрей).
parent(мария, ольга).

% Андрей - родитель Екатерины
parent(андрей, екатерина).

% Ольга - родитель Павла
parent(ольга, павел).

% Сергей - родитель Дарьи
parent(сергей, дарья).

% Анна - родитель Дарьи
parent(анна, дарья).

% Браки (Marriages)
married(иван, мария).
married(мария, иван).
married(сергей, анна).
married(анна, сергей).

% Правила (Rules)

% Ребенок (Child)
child(X, Y) :- parent(Y, X).

% Отношения (Relationships)
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).

% Брат (Brother)
brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y), X \= Y.

% Сестра (Sister)
sister(X, Y) :- female(X), parent(Z, X), parent(Z, Y), X \= Y.

% Дедушка (Grandfather)
grandfather(X, Z) :- male(X), parent(X, Y), parent(Y, Z).

% Бабушка (Grandmother)
grandmother(X, Z) :- female(X), parent(X, Y), parent(Y, Z).

% Дядя (Uncle)
uncle(X, Z) :- male(X), parent(Y, Z), brother(X, Y).
uncle(X, Z) :- male(X), parent(Y, Z), (married(X, W), sister(W, Y); married(W, X), sister(W, Y)).

% Тетя (Aunt)
aunt(X, Z) :- female(X), parent(Y, Z), sister(X, Y).
aunt(X, Z) :- female(X), parent(Y, Z), (married(X, W), brother(W, Y); married(W, X), brother(W, Y)).