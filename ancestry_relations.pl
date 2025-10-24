% 定义父关系 (parent/2)
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖先关系 (ancestor/2)
% 基本情况：如果X是Y的直接父母，则X是Y的祖先
ancestor(X, Y) :- parent(X, Y).

% 递归情况：如果X是Z的父母，且Z是Y的祖先，则X是Y的祖先
ancestor(X, Y) :- 
    parent(X, Z), 
    ancestor(Z, Y).

% 定义祖孙关系 (grandparent/2)
% 如果X是Y的祖先且X和Y之间恰好隔一代，则X是Y的祖父母
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% 定义更广泛的祖孙关系 (可以是祖父、祖母、曾祖父、曾祖母等)
% 即只要X是Y的祖先，且至少隔两代
great_grandparent(X, Y) :-
    ancestor(X, Y),
    parent(X, Z),
    ancestor(Z, Y),
    parent(Z, W),
    ancestor(W, Y),
    !.

% 简单的祖孙关系（仅祖父/祖母到孙子/孙女）
% X是Y的祖父母当且仅当X是Y的父母的父母
grandparent_simple(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% 更通用的祖孙关系，可以处理多代
% 例如：曾祖父母、高祖父母等
descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- 
    parent(Z, X), 
    descendant(Z, Y).

% 祖先关系（包括直接父母）
is_ancestor(X, Y) :- parent(X, Y).
is_ancestor(X, Y) :- 
    parent(X, Z), 
    is_ancestor(Z, Y).

% 祖孙关系（祖先但不是直接父母）
grand_ancestor(X, Y) :-
    is_ancestor(X, Y),
    \+ parent(X, Y).