% 定义父关系（示例数据）
parent(tom, bob).
parent(tom, liz).
parent(bob, pat).
parent(bob, jim).
parent(pat, ann).
parent(pat, ben).

% 定义祖父关系规则：X是Z的祖父，如果X是Y的父亲，且Y是Z的父亲
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 定义祖母关系规则：X是Z的祖母，如果X是Y的母亲，且Y是Z的父母之一
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 定义祖父母关系规则（不区分性别）：X是Z的祖父母，如果X是Y的父母，且Y是Z的父母
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义男性（示例数据）
male(tom).
male(bob).
male(jim).
male(pat).

% 定义女性（示例数据）
female(liz).
female(ann).
female(ben).