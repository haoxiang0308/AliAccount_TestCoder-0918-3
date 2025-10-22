% База фактов о семье на языке Prolog

% Факты: родительские отношения
parent(alex, bob).
parent(alex, clara).
parent(betty, bob).
parent(betty, clara).
parent(charlie, diana).
parent(charlie, elena).
parent(diana, frank).
parent(diana, grace).
parent(elena, heather).
parent(elena, ian).

% Факты: муж/жена
husband(alex, betty).
husband(charlie, diana_f).
husband(david, grace).
wife(betty, alex).
wife(diana_f, charlie).
wife(grace, david).

% Правила: мужчина и женщина
male(alex).
male(charlie).
male(frank).
male(ian).
male(david).

female(betty).
female(clara).
female(diana).
female(elena).
female(grace).
female(heather).

% Правила: отец и мать
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).

% Правило: муж
spouse(X, Y) :- husband(X, Y); wife(X, Y).

% Правила: брат и сестра
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).

% Правила: дедушка и бабушка
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandfather(X, Z) :- grandparent(X, Z), male(X).
grandmother(X, Z) :- grandparent(X, Z), female(X).

% Правила: дети
children(X, Y) :- parent(X, Y).