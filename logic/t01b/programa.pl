:- consult('../t01a/linguagens.pl').

% Questão 1 (resolvida)
lingnaosaopre(L) :- linguagem(L, _), \+predecessora(_, L).

% Questão 2
lingprecomum(L1, L2, Lp) :- linguagem(L1, _), linguagem(L2, _),
                            predecessora(L1, Lp), predecessora(L2, Lp),
                            dif(L1,L2).

% Questão 3
lingprepre(Lpp, Lp, L) :- predecessora(L, Lp), predecessora(Lp, Lpp).

% Questão 4
lingpredecada(Lp, L) :- predecessora(L, Lp), linguagem(L, A), linguagem(Lp, B),
                        X is A - B, X >= 10.

% Questão 5
lingdecada(L, D) :- linguagem(L, A),
                    T is D mod 1900,
                    U is T mod 10,
                    D - U =< A,
                    A =< D - U + 9.

% Questão 6
lingcommultipre(L) :- predecessora(L, A), predecessora(L, B), A \= B.
