% База фактов о семье (Family facts database in Prolog)

% Мужчины
male(alex).
male(bob).
male(charlie).
male(david).
male(edward).

% Женщины
female(anna).
female(beth).
female(catherine).
female(diana).
female(elena).

% Родители
parent(alex, bob).      % alex - родитель bob
parent(alex, catherine). % alex - родитель catherine
parent(anna, bob).      % anna - родитель bob
parent(anna, catherine). % anna - родитель catherine
parent(bob, david).     % bob - родитель david
parent(bob, elena).     % bob - родитель elena
parent(beth, david).    % beth - родитель david
parent(beth, elena).    % beth - родитель elena

% Браки
married(alex, anna).
married(bob, beth).

% Правила
father(Father, Child) :-
    male(Father),
    parent(Father, Child).

mother(Mother, Child) :-
    female(Mother),
    parent(Mother, Child).

grandparent(GrandParent, GrandChild) :-
    parent(GrandParent, Parent),
    parent(Parent, GrandChild).

grandfather(GrandFather, GrandChild) :-
    male(GrandFather),
    grandparent(GrandFather, GrandChild).

grandmother(GrandMother, GrandChild) :-
    female(GrandMother),
    grandparent(GrandMother, GrandChild).

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

brother(Brother, Sibling) :-
    male(Brother),
    sibling(Brother, Sibling).

sister(Sister, Sibling) :-
    female(Sister),
    sibling(Sister, Sibling).

% Дяди и тети
uncle(Uncle, Person) :-
    male(Uncle),
    parent(Parent, Person),
    sibling(Uncle, Parent).

aunt(Aunt, Person) :-
    female(Aunt),
    parent(Parent, Person),
    sibling(Aunt, Parent).