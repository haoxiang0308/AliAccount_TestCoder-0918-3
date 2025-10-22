% 定义父子关系
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖父关系：如果X是Y的父亲，Y是Z的父亲，则X是Z的祖父
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 定义祖母关系：如果X是Y的母亲，Y是Z的父亲，则X是Z的祖母
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 定义祖父或祖母关系（统称祖父母关系）
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义孙子/孙女关系（反向的祖父母关系）
grandchild(Z, X) :-
    grandparent(X, Z).

% 定义男性
male(tom).
male(bob).
male(jim).
male(pat).

% 定义女性
female(liz).
female(ann).

% 查询示例:
% ?- grandparent(tom, ann).  % 询问tom是否是ann的祖父母
% ?- grandfather(tom, ann).  % 询问tom是否是ann的祖父
% ?- grandmother(liz, jim).  % 询问liz是否是jim的祖母
% ?- grandchild(ann, tom).   % 询问ann是否是tom的孙辈