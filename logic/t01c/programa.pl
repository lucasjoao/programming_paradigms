:- consult('../t01a/linguagens.pl').

% Questão 1 (resolvida)
qano(A, N) :- findall(L, linguagem(L, A), La), length(La, N).

% Questão 2
qsaopre(L, N) :- findall(L, predecessora(L, _), La), length(La, N).

% Questão 3
qsaopre(N) :- findall(L, predecessora(_, L), La),
              list_to_set(La, S),
              length(S, N).

% Questão 4
qtempre(N) :- findall(L, predecessora(L, _), La),
              list_to_set(La, S),
              length(S, N).

% Questão 5
lingdecada(L, D) :- linguagem(L, A),
                    T is D mod 1900,
                    U is T mod 10,
                    D - U =< A,
                    A =< D - U + 9.
qdecada(D, N) :- findall(L, lingdecada(L, D), La), length(La, N).

% Questão 6
lingtotal(L, A1, A2) :- linguagem(L, A),
                        A1 =< A,
                        A =< A2.
qtotal(A1, A2, N) :- findall(L, lingtotal(L, A1, A2), La), length(La, N).
