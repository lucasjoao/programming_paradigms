:- consult('linguagens.pl').

% Questão 1 (resolvida)
lingcompre(L) :- predecessora(L, _).

% Questão 2
lingprecompre(L) :- predecessora(_, L), predecessora(L, _).

% Questão 3
lingpreano(Lp, A) :- predecessora(B, Lp), linguagem(B, A).
