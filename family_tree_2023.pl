% Определения родителей
parent(tom, bob).
parent(pam, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Определение пола
male(tom).
male(bob).
male(jim).
female(pam).
female(liz).
female(ann).
female(pat).

% Правила
% X - отец Y, если X - родитель Y и X - мужчина
father(X, Y) :- parent(X, Y), male(X).

% X - мать Y, если X - родитель Y и X - женщина
mother(X, Y) :- parent(X, Y), female(X).

% X - сын Y, если X - родитель Y и Y - мужчина
son(X, Y) :- parent(Y, X), male(X).

% X - дочь Y, если X - родитель Y и Y - женщина
daughter(X, Y) :- parent(Y, X), female(X).

% X - брат Y, если у X и Y один и тот же родитель и X - мужчина, и X не Y
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \= Y.

% X - сестра Y, если у X и Y один и тот же родитель и X - женщина, и X не Y
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y.

% X - дедушка Y, если X - родитель Z и Z - родитель Y и X - мужчина
grandfather(X, Y) :- parent(X, Z), parent(Z, Y), male(X).

% X - бабушка Y, если X - родитель Z и Z - родитель Y и X - женщина
grandmother(X, Y) :- parent(X, Z), parent(Z, Y), female(X).