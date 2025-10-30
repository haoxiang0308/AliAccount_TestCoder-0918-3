% 定义父子关系的示例事实
parent(tom, bob).
parent(bob, liz).
parent(bob, pat).
parent(pat, ann).
parent(pat, jim).

% 定义祖孙关系规则
grandparent(X, Z) :- 
    parent(X, Y), 
    parent(Y, Z).

% 定义祖先关系规则（更通用的情况）
ancestor(X, Z) :- 
    parent(X, Z).

ancestor(X, Z) :- 
    parent(X, Y), 
    ancestor(Y, Z).