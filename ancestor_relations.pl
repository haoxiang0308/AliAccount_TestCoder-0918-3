% 定义父子关系的基本事实
parent(tom, bob).
parent(bob, liz).
parent(liz, ann).
parent(liz, pat).
parent(pat, jim).

% 定义祖父关系：如果X是Y的父亲，且Y是Z的父亲，则X是Z的祖父
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 定义祖母关系：如果X是Y的母亲，且Y是Z的父亲或母亲，则X是Z的祖母
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 定义祖孙关系：如果X是Z的祖父或祖母，则X和Z有祖孙关系
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义性别
male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).

% 定义祖先关系（更广义的祖孙关系）
ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).