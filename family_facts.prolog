% База фактов о семье (Family facts database in Prolog)

% Мужчины (Males)
male(alex).
male(bob).
male(charlie).
male(david).
male(edward).

% Женщины (Females)
female(anna).
female(beth).
female(clara).
female(diana).
female(elena).

% Родители (Parents)
parent(alex, bob).      % alex - родитель bob (alex is parent of bob)
parent(anna, bob).      % anna - родитель bob (anna is parent of bob)
parent(alex, clara).    % alex - родитель clara
parent(anna, clara).    % anna - родитель clara
parent(bob, david).     % bob - родитель david
parent(beth, david).    % beth - родитель david
parent(bob, elena).     % bob - родитель elena
parent(beth, elena).    % beth - родитель elena

% Супруги (Spouses)
spouse(alex, anna).
spouse(anna, alex).
spouse(bob, beth).
spouse(beth, bob).

% Правила (Rules)

% Ребенок (Child): Y - ребенок X, если X - родитель Y
child(Y, X) :- parent(X, Y).

% Сын (Son): Y - сын X, если X - родитель Y и Y - мужчина
son(Y, X) :- parent(X, Y), male(Y).

% Дочь (Daughter): Y - дочь X, если X - родитель Y и Y - женщина
daughter(Y, X) :- parent(X, Y), female(Y).

% Брат (Brother): Y - брат X, если у них один родитель и Y - мужчина и Y ≠ X
brother(Y, X) :- parent(Z, X), parent(Z, Y), male(Y), Y \= X.

% Сестра (Sister): Y - сестра X, если у них один родитель и Y - женщина и Y ≠ X
sister(Y, X) :- parent(Z, X), parent(Z, Y), female(Y), Y \= X.

% Дедушка (Grandfather): X - дедушка Y, если X - родитель Z и Z - родитель Y и X - мужчина
grandfather(X, Y) :- parent(X, Z), parent(Z, Y), male(X).

% Бабушка (Grandmother): X - бабушка Y, если X - родитель Z и Z - родитель Y и X - женщина
grandmother(X, Y) :- parent(X, Z), parent(Z, Y), female(X).

% Дядя (Uncle): X - дядя Y, если X - брат родителя Y
uncle(X, Y) :- parent(Z, Y), brother(X, Z).

% Тетя (Aunt): X - тетя Y, если X - сестра родителя Y
aunt(X, Y) :- parent(Z, Y), sister(X, Z).