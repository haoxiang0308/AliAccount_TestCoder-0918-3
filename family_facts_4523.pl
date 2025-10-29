% База фактов о семье (Family facts database in Russian)

% Мужчины (Males)
male(иван).
male(павел).
male(андрей).
male(михаил).
male(олег).

% Женщины (Females)
female(мария).
female(анна).
female(екатерина).
female(ольга).
female(дарья).

% Родители (Parents)
% parent(родитель, ребенок)
parent(иван, андрей).
parent(иван, екатерина).
parent(мария, андрей).
parent(мария, екатерина).
parent(павел, миша).
parent(анна, миша).
parent(андрей, олег).
parent(дарья, олег).
parent(ольга, дарья).

% Брак (Marriage)
married(иван, мария).
married(павел, анна).
married(андрей, ольга).

% Правила (Rules)
father(Father, Child) :- male(Father), parent(Father, Child).
mother(Mother, Child) :- female(Mother), parent(Mother, Child).
son(Child, Parent) :- male(Child), parent(Parent, Child).
daughter(Child, Parent) :- female(Child), parent(Parent, Child).
grandfather(Grandfather, Grandchild) :- male(Grandfather), parent(Grandfather, X), parent(X, Grandchild).
grandmother(Grandmother, Grandchild) :- female(Grandmother), parent(Grandmother, X), parent(X, Grandchild).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(Brother, Sibling) :- male(Brother), sibling(Brother, Sibling).
sister(Sister, Sibling) :- female(Sister), sibling(Sister, Sibling).