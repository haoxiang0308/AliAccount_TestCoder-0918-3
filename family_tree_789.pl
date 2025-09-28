% База фактов о семье

% Предикат 'parent(Parent, Child)' означает, что Parent - родитель Child
parent(ann, bob).
parent(ann, pat).
parent(ann, jim).
parent(pat, liz).
parent(bob, ann).
parent(bob, pat).
parent(bob, jim).
parent(jim, liz).

% Предикат 'female(Person)' означает, что Person - женщина
female(ann).
female(liz).
female(pat).

% Предикат 'male(Person)' означает, что Person - мужчина
male(bob).
male(jim).

% Правило 'mother(Mother, Child)' означает, что Mother - мать Child
mother(Mother, Child) :-
    parent(Mother, Child),
    female(Mother).

% Правило 'grandparent(Grandparent, Grandchild)' означает, что Grandparent - дедушка/бабушка Grandchild
grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

% Правило 'sibling(X, Y)' означает, что X и Y - братья или сестры
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.