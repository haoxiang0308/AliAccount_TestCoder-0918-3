% 定义父子关系的示例事实
parent(tom, bob).
parent(bob, liz).
parent(bob, pat).
parent(pat, ann).
parent(pat, jim).

% 定义祖父关系：如果X是Y的父亲，且Y是Z的父亲，则X是Z的祖父
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义祖母关系：如果X是Y的母亲，且Y是Z的父亲或母亲，则X是Z的祖母
% 假设我们有更具体的性别信息，这里grandparent可以表示祖父或祖母

% 更通用的祖孙关系：X是Z的祖先（至少隔一代）
ancestor(X, Z) :-
    parent(X, Z).

ancestor(X, Z) :-
    parent(X, Y),
    ancestor(Y, Z).

% 测试查询示例:
% ?- grandparent(tom, liz).  % 应该返回true
% ?- grandparent(tom, ann).  % 应该返回true
% ?- grandparent(bob, ann).  % 应该返回true