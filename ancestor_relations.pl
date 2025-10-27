% 定义父子关系的基本事实
parent(tom, bob).
parent(bob, liz).
parent(liz, jim).
parent(jim, ann).
parent(pat, jim).
parent(bob, ann).
parent(pat, ann).

% 定义祖父关系规则
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 定义祖母关系规则
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 定义祖父或祖母（即祖父母）关系规则
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义男性和女性的基本事实
male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).

% 定义祖先关系（递归定义）
ancestor(X, Z) :-
    parent(X, Z).

ancestor(X, Z) :-
    parent(X, Y),
    ancestor(Y, Z).

% 定义后代关系
descendant(X, Z) :-
    ancestor(Z, X).