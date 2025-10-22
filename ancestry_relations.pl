% 定义父子关系的基本事实
parent(john, mary).
parent(john, tom).
parent(mary, alice).
parent(mary, bob).
parent(tom, lisa).
parent(alice, kate).

% 定义祖父关系规则：X是Z的祖父，如果X是Y的父亲且Y是Z的父亲
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 定义祖母关系规则：X是Z的祖母，如果X是Y的母亲且Y是Z的母亲
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 定义祖父或祖母关系（统称祖父母关系）
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义孙子/孙女关系（统称孙辈关系）
grandchild(Z, X) :-
    grandparent(X, Z).

% 定义男性和女性的基本事实
male(john).
male(tom).
male(bob).
female(mary).
female(alice).
female(lisa).
female(kate).