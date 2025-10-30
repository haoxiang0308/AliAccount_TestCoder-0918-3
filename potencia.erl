-module(potencia).
-export([potencia/2]).

% Función recursiva para calcular la potencia de un número
% potencia(Base, Exponente) -> Resultado
potencia(_, 0) -> 1;  % Cualquier número elevado a 0 es 1
potencia(Base, 1) -> Base;  % Cualquier número elevado a 1 es él mismo
potencia(Base, Exponente) when Exponente > 1 ->
    Base * potencia(Base, Exponente - 1);  % Caso recursivo para exponentes positivos
potencia(Base, Exponente) when Exponente < 0 ->
    1 / potencia(Base, -Exponente).  % Caso para exponentes negativos