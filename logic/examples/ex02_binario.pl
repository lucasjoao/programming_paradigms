digito(0).
digito(1).

binario(N) :- N = (A,B,C), digito(A), digito(B), digito(C).
