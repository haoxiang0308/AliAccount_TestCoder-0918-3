% 定义父母关系的基本事实
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖父关系规则：X是Y的祖父，如果X是Z的父亲且Z是Y的父亲，或者X是Z的父亲且Z是Y的母亲
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 定义祖母关系规则：X是Y的祖母，如果X是Z的母亲且Z是Y的父亲或母亲
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 定义祖孙关系规则：X是Z的祖父母，如果X是Y的父母且Y是Z的父母
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义男性和女性的基本事实（用于祖父/祖母关系）
male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).