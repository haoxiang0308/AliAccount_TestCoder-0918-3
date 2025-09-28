% База фактов о семье

% Предикат 'parent(Parent, Child)' означает, что Parent - родитель Child
parent(ann, bob).
parent(ann, pat).
parent(bob, jim).
parent(pat, liz).
parent(pat, ann).

% Пол
male(bob).
male(jim).
female(ann).
female(pat).
female(liz).

% Правила
% X - отец Y, если X - родитель Y и X - мужчина
father(X, Y) :- parent(X, Y), male(X).

% X - мать Y, если X - родитель Y и X - женщина
mother(X, Y) :- parent(X, Y), female(X).

% X - брат Y, если у X и Y один родитель и X - мужчина, и X != Y
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \= Y.

% X - сестра Y, если у X и Y один родитель и X - женщина, и X != Y
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y.

% X - дедушка Y, если X - родитель Z и Z - родитель Y, и X - мужчина
grandfather(X, Y) :- parent(X, Z), parent(Z, Y), male(X).

% X - бабушка Y, если X - родитель Z и Z - родитель Y, и X - женщина
grandmother(X, Y) :- parent(X, Z), parent(Z, Y), female(X).

% X - потомок Y, если Y - родитель X, или Y - родитель Z и Z - потомок X
descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- parent(Y, Z), descendant(X, Z).