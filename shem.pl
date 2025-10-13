% База фактов о семье на языке Prolog

% Предикаты для обозначения родительских отношений
% parent(X, Y) означает, что X - родитель Y
parent(adam, cain).
parent(adam, abel).
parent(adam, seth).
parent(eve, cain).
parent(eve, abel).
parent(eve, seth).

parent(cain, enoch).
parent(abel, methuselah). % Допустим, у Авеля был сын Метушала
parent(seth, enos).
parent(enos, cainan).
parent(cainan, mahalalel).
parent(mahalalel, jared).
parent(jared, enoch2). % Второй Енох, сын Иареда
parent(enoch2, methuselah2). % Второй Метушала, сын Еноха
parent(methuselah2, lamech).
parent(lamech, noah).
parent(noah, shem).
parent(noah, ham).
parent(noah, japheth).

% Предикаты для обозначения пола
% male(X) означает, что X - мужчина
male(adam).
male(cain).
male(abel).
male(seth).
male(enoch).
male(methuselah).
male(enos).
male(cainan).
male(mahalalel).
male(jared).
male(enoch2).
male(methuselah2).
male(lamech).
male(noah).
male(shem).
male(ham).
male(japheth).

% female(X) означает, что X - женщина
female(eve).

% Производные предикаты

% father(X, Y) означает, что X - отец Y
father(X, Y) :- parent(X, Y), male(X).

% mother(X, Y) означает, что X - мать Y
mother(X, Y) :- parent(X, Y), female(X).

% child(X, Y) означает, что X - ребенок Y
child(X, Y) :- parent(Y, X).

% son(X, Y) означает, что X - сын Y
son(X, Y) :- child(X, Y), male(X).

% daughter(X, Y) означает, что X - дочь Y
daughter(X, Y) :- child(X, Y), female(X).

% sibling(X, Y) означает, что X и Y - братья или сестры
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% brother(X, Y) означает, что X - брат Y
brother(X, Y) :- sibling(X, Y), male(X).

% sister(X, Y) означает, что X - сестра Y
sister(X, Y) :- sibling(X, Y), female(X).

% uncle(X, Y) означает, что X - дядя Y (брат родителя)
uncle(X, Y) :- parent(Z, Y), brother(X, Z).

% aunt(X, Y) означает, что X - тетя Y (сестра родителя или жена дяди)
aunt(X, Y) :- parent(Z, Y), sister(X, Z).
% aunt(X, Y) :- parent(Z, Y), brother(W, Z), wife(X, W). % Второй вариант, требует предиката wife/2

% grandparent(X, Y) означает, что X - бабушка или дедушка Y
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% ancestor(X, Y) означает, что X - предок Y (рекурсивное определение)
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).