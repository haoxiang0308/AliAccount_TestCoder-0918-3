# Prolog Even Number Checker

This repository contains a simple Prolog predicate to check if a number is even.

## File Description

- `even_checker.pl`: Contains the `is_even/1` predicate that succeeds if the input number is even.

## Usage

To use this predicate, load the file in a Prolog interpreter:

```prolog
?- [even_checker].
?- is_even(4).
true.

?- is_even(5).
false.
```

## Predicate Definition

```prolog
is_even(X) :-
    X mod 2 =:= 0.
```

This predicate uses the modulo operator (`mod`) to check if a number is divisible by 2 with no remainder.