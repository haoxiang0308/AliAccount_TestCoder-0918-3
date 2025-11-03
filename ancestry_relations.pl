% 定义父子/父女关系的基本事实
parent(tom, bob).
parent(bob, liz).
parent(bob, pat).
parent(pat, ann).
parent(pat, jim).
parent(mary, liz).
parent(mary, pat).

% 定义祖父关系
grandfather(X, Z) :- parent(X, Y), parent(Y, Z), male(X).

% 定义祖母关系
grandmother(X, Z) :- parent(X, Y), parent(Y, Z), female(X).

% 定义孙子/孙女关系（从祖父母角度）
grandson(X, Z) :- parent(X, Y), parent(Y, Z), male(Z).

% 定义孙女关系（从祖父母角度）
granddaughter(X, Z) :- parent(X, Y), parent(Y, Z), female(Z).

% 定义祖先关系（更通用的规则）
ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

% 定义祖孙关系（祖父或祖母与孙辈的关系）
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% 性别定义
male(tom).
male(bob).
male(jim).
female(mary).
female(liz).
female(pat).
female(ann).