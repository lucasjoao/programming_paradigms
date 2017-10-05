:- consult('../t01a/linguagens.pl').

% Questão 1 (resolvida)
lingmaisantiga_aux([], _, L, L).
lingmaisantiga_aux([H|T], A1, L1, L) :- linguagem(H, A2), A1 =< A2,
                                        lingmaisantiga_aux(T, A1, L1, L).
lingmaisantiga_aux([H|T], A1, _ , L) :- linguagem(H, A2), A1 >= A2,
                                        lingmaisantiga_aux(T, A2, H, L).

lingmaisantiga(L) :- findall(L1, linguagem(L1, _), Lista),
                     lingmaisantiga_aux(Lista, 9999, _, L).

% Questão 2
lingmaisrecente_aux([], _, L, L).
lingmaisrecente_aux([H|T], A1, L1, L) :- linguagem(H, A2), A1 >= A2,
                                         lingmaisrecente_aux(T, A1, L1, L).
lingmaisrecente_aux([H|T], A1, _ , L) :- linguagem(H, A2), A1 =< A2,
                                         lingmaisrecente_aux(T, A2, H, L).

lingmaisrecente(L) :- findall(L1, linguagem(L1, _), Lista),
                      lingmaisrecente_aux(Lista, 0, _, L).

% Do t01c
qsaopre(L, N) :- findall(L, predecessora(L, _), La), length(La, N).
% Questão 3
lingcommaispre_aux([], _, L, L).
lingcommaispre_aux([H|T], N1, L1, L) :- qsaopre(H, N2), N1 >= N2,
                                        lingcommaispre_aux(T, N1, L1, L).
lingcommaispre_aux([H|T], N1, _ , L) :- qsaopre(H, N2), N1 =< N2,
                                        lingcommaispre_aux(T, N2, H, L).

lingcommaispre(L) :- findall(L1, linguagem(L1, _), Lista),
                     lingcommaispre_aux(Lista, 0, _, L).

% Questão 4
qsaosucessoras(L, N) :- findall(L, predecessora(_, L), La), length(La, N).
linginfluente_aux([], _, L, L).
linginfluente_aux([H|T], N1, L1, L) :- qsaosucessoras(H, N2), N1 >= N2,
                                       linginfluente_aux(T, N1, L1, L).
linginfluente_aux([H|T], N1, _ , L) :- qsaosucessoras(H, N2), N1 =< N2,
                                       linginfluente_aux(T, N2, H, L).

linginfluente(L) :- findall(L1, linguagem(L1, _), Lista),
                    linginfluente_aux(Lista, 0, _, L).

% Do t01c
qano(A, N) :- findall(L, linguagem(L, A), La), length(La, N).
% Questão 5
linganocriativo_aux([], _, A, A).
linganocriativo_aux([H|T], N1, L1, L) :- qano(H, N2), N1 >= N2,
                                         linganocriativo_aux(T, N1, L1, L).
linganocriativo_aux([H|T], N1, _ , L) :- qano(H, N2), N1 =< N2,
                                         linganocriativo_aux(T, N2, H, L).

linganocriativo(A) :- findall(A1, linguagem(_, A1), Lista),
                      linganocriativo_aux(Lista, 0, _, A).

% Do t01c
lingdecada(L, D) :- linguagem(L, A),
                    T is D mod 1900,
                    U is T mod 10,
                    D - U =< A,
                    A =< D - U + 9.
qdecada(D, N) :- findall(L, lingdecada(L, D), La), length(La, N).
% Questão 6
lingdecadacriativa_aux([], _, A, A).
lingdecadacriativa_aux([H|T], N1, L1, L) :- qdecada(H, N2), N1 >= N2,
                                            lingdecadacriativa_aux(T, N1, L1, L).
lingdecadacriativa_aux([H|T], N1, _ , L) :- qdecada(H, N2), N1 =< N2,
                                            lingdecadacriativa_aux(T, N2, H, L).

lingdecadacriativa(A) :- findall(A1, linguagem(_, A1), Lista),
                         lingdecadacriativa_aux(Lista, 0, _, A).

% Questão 7
linglistapre_aux(L, Lista, Lp) :- predecessora(L, Pre),
                                  linglistapre_aux(Pre, [Lista|[Pre]], Lp).
linglistapre_aux(L, Lista, Lp) :- not(predecessora(L, _)),
                                  flatten(Lista, Lp).

linglistapre(L, Lp) :- linglistapre_aux(L, [], Lp).
