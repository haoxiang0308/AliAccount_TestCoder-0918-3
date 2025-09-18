#!/usr/bin/swipl -q -g main -f

% Load our predicate
:- consult('9ayfUVCBCy.pl').

% Test cases
main :-
    write('Testing is_even predicate:\n'),
    
    % Test even numbers
    write('Testing even numbers:\n'),
    test_even(4),
    test_even(0),
    test_even(-2),
    
    % Test odd numbers
    write('\nTesting odd numbers:\n'),
    test_odd(3),
    test_odd(1),
    test_odd(-1),
    
    halt.

test_even(N) :-
    (is_even(N) -> 
        format('~w is correctly identified as even~n', [N])
    ; 
        format('ERROR: ~w should be even but was not identified as such~n', [N])
    ).

test_odd(N) :-
    (is_even(N) -> 
        format('ERROR: ~w should be odd but was identified as even~n', [N])
    ; 
        format('~w is correctly identified as odd~n', [N])
    ).