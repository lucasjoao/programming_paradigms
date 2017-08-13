% cores disponiveis
cor(azul).
cor(verde).
cor(amarelo).
cor(vermelho).

% regra
coloracao(A,B,C,D,E) :-
  cor(A),cor(B),cor(C),cor(D),cor(E),
  A\=B, A\=C, A\=D, B\=C, B\=E, C\=D, C\=E, D\=E.
