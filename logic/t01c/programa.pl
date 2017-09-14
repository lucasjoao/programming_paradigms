:- consult('../t01a/linguagens.pl').

% Questão 1 (resolvida)
qano(A, N) :- findall(L, linguagem(L, A), La), length(La, N).

% Questão 2
qsaopre(L, N) :- findall(L, predecessora(L, _), La), length(La, N).

% Questão 3
qsaopre(N) :- findall(L, predecessora(_, L), La), length(La, N).

% Questão 4
qtempre(N) :- true.

% Questão 5
qdecada(D, N) :- true.

% Questão 6
qtotal(A1, A2, N) :- true.
