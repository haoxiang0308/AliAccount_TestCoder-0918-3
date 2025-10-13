% База фактов о семье

% Предикаты: parent(Родитель, Ребенок), male(Имя), female(Имя)

% Мужчины
male(george).
male(philip).
male(charles).
male(mark).
male(andrew).
male(edward).
male(william).
male(harry).
male(peter).
male(james).

% Женщины
female(mum).
female(elizabeth).
female(diana).
female(anne).
female(sarah).
female(sophie).
female(kate).
female(meghan).
female(zara).
female(louise).

% Родители (и, следовательно, дети)
parent(mum, elizabeth).
parent(mum, philip).
parent(george, elizabeth).
parent(george, philip).

parent(elizabeth, charles).
parent(elizabeth, anne).
parent(elizabeth, andrew).
parent(elizabeth, edward).
parent(philip, charles).
parent(philip, anne).
parent(philip, andrew).
parent(philip, edward).

parent(diana, william).
parent(diana, harry).
parent(charles, william).
parent(charles, harry).

parent(anne, peter).
parent(anne, zara).
parent(mark, peter).
parent(mark, zara).

parent(andrew, beatrice).
parent(andrew, eugenie).
parent(sarah, beatrice).
parent(sarah, eugenie).

parent(edward, louise).
parent(edward, james).
parent(sophie, louise).
parent(sophie, james).

parent(kate, george).
parent(kate, charlotte).
parent(kate, louis).
parent(william, george).
parent(william, charlotte).
parent(william, louis).

parent(meghan, archie).
parent(harry, archie).