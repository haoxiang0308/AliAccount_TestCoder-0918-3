% Definição recursiva do fatorial em Prolog

% Caso base: fatorial de 0 é 1
fatorial(0, 1).

% Caso recursivo: fatorial(N) = N * fatorial(N-1)
fatorial(N, Resultado) :-
    N > 0,
    N1 is N - 1,
    fatorial(N1, Resultado1),
    Resultado is N * Resultado1.