from math import sqrt, acos
import numpy as np


# parte 1, operacoes aritmeticas com vetores
def norma(vetor):
    return sqrt(sum(i ** 2 for i in vetor))


def mult_escalar(vetor, escalar):
    return [escalar * i for i in vetor]


def add_vetores(v1, v2):
    # implementacao para v1 e v2 de mesmo tamanho
    return [i + j for i, j in zip(v1, v2)]


def prod_escalar(v1, v2):
    # implementacao para v1 e v2 de mesmo tamanho
    return [i * j for i, j in zip(v1, v2)]


def prod_vetorial(a, b):
    # implementacao para v1 (a) e v2 (b) no espaço R3
    resultado = []
    resultado.append( a[1]  * b[2] - b[1] * a[2])
    resultado.append(-a[0]  * b[2] + b[0] * a[2])
    resultado.append( a[0]  * b[1] - b[0] * a[1])
    return resultado


def angulo_entre_vetores(v1, v2):
    return acos(sum(prod_escalar(v1, v2)) / (norma(v1) * norma(v2)))


# parte 2, operacoes com matrizes
def transposicao(matriz):
    return [list(x) for x in zip(*matriz)]


def mult_escalar_matriz(matriz, escalar):
    return [mult_escalar(linha, escalar) for linha in matriz]


def add_matrizes(m1, m2):
    return [add_vetores(l1, l2) for l1, l2 in zip(m1, m2)]


def mult_matrizes(m1, m2):
    # return [prod_escalar(l1, l2) for l1, l2 in zip(m1, m2)]
    np_m1 = np.matrix(m1)
    np_m2 = np.matrix(m2)
    return np_m1 * np_m2


def determinante(matriz):
    # por sarrus e somente para matriz 3x3
    aei = matriz[0][0] * matriz[1][1] * matriz[2][2]
    bfg = matriz[0][1] * matriz[1][2] * matriz[2][0]
    cdh = matriz[0][2] * matriz[1][0] * matriz[2][1]
    ceg = matriz[0][2] * matriz[1][1] * matriz[2][0]
    afh = matriz[0][0] * matriz[1][2] * matriz[2][1]
    bdi = matriz[0][1] * matriz[1][0] * matriz[2][2]
    return (aei + bfg + cdh) - (ceg + afh + bdi)


def inversa(matriz):
    # Uma matriz quadrada, cujo determinante e diferente de zero e dita
    # inversıvel e o produto de uma matriz pela sua inversa e a matriz
    # identidade
    # 1. Achar a matriz de determinantes menores;
    # 2. Achar a matriz de cofatores;
    # 3. Achar a matriz adjunta;
    # 4. Inversa = 1/det × adjunta.
    pass
