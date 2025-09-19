% Test file for even_checker.pl
:- consult('even_checker.pl').

% Test cases
test_even :-
    is_even(4),
    writeln('4 is even').

test_odd :-
    \+ is_even(5),
    writeln('5 is odd').

test_zero :-
    is_even(0),
    writeln('0 is even').

test_negative :-
    is_even(-2),
    writeln('-2 is even').