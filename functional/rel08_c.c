#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#define tamanho(x) (sizeof(x) / sizeof((x)[0])) + 1

// gcc rel08_c.c -std=c11 -lm -w (-w nao eh uma boa ideia, rs)

// parte 1, operacoes aritmeticas com vetores
float norma(float* vetor) {
  float soma = 0;
  int tamanho = tamanho(vetor);
  int i;
  for (i = 0; i < tamanho; i++) {
    soma += pow(vetor[i], 2);
  }
  return sqrt(soma);
}

float* mult_escalar(float* vetor, float escalar) {
  int i;
  int tamanho = tamanho(vetor);
  for (i = 0; i < tamanho; i++) {
    vetor[i] *= escalar;
  }
  return vetor;
}

float* add_vetores(const float* v1, const float* v2) {
  // implementacao para v1 e v2 no R2
  int i;
  int tamanho_v1 = tamanho(v1);
  float resultado[] = {0, 0};
  for (i = 0; i < tamanho_v1; i++) {
    resultado[i] = v1[i] + v2[i];
  }
  return resultado;
}

float* prod_escalar(float* v1, float* v2) {
  // implementacao para v1 e v2 no R2
  int i;
  int tamanho_v1 = tamanho(v1);
  float resultado[] = {0, 0};
  for (i = 0; i < tamanho_v1; i++) {
    resultado[i] = v1[i] * v2[i];
  }
  return resultado;
}

float* prod_vetorial(float* v1, float* v2) {
  // implementacao para v1 e v2 no espaço R3
  float result[] = {0, 0, 0};
  result[0] = (v1[1]*v2[2]) - (v2[1]*v1[2]);
  result[1] = (v1[0]*v2[2]) + (v2[0]*v1[2]);
  result[2] = (v1[0]*v2[1]) - (v2[0]*v1[1]);
  return result;
}

float angulo_entre_vetores(float* v1, float* v2) {
  // FIXME - precisa um somatorio pro prod_escalar
  // return acos(prod_escalar(v1, v2) / (norma(v1) * norma(v2)));
  return 0;
}

// parte 2, operacoes com matrizes
void transposicao(int linha, int coluna, int m[linha][coluna]) {
  int i, j, aux;
  for (i = 0; i < linha; i++) {
    for (j = 0; j < coluna; j++) {
      if(i != j) {
        aux = m[i][j];
        m[i][j] = m[j][i];
        m[j][i] = aux;
      }
    }
  }
}

void mult_escalar_matriz(int linha, int coluna, int m[linha][coluna], int e) {
  int i, j;
  for (i = 0; i < linha; i++) {
    for (j = 0; j < coluna; j++) {
      m[linha][coluna] *= e;
    }
  }
}

int** add_matrizes(int linha, int coluna, int m1[linha][coluna],
                   int m2[linha][coluna]) {
  int i, j;
  int resultado[i][j];
  for (i = 0; i < linha; i++) {
    for (j = 0; j < coluna; j++) {
      resultado[i][j] = m1[i][j] + m2[i][j];
    }
  }
  return resultado;
}

int** mult_matrizes(int linha, int coluna, int m1[linha][coluna],
                    int m2[linha][coluna]) {
  int i, j, k;
  int mult[linha][coluna];
  for (i = 0; i < linha; i++) {
    for (j = 0; j < coluna; j++) {
      mult[linha][coluna] = 0;
      for(k = 0; k < coluna; k++) {
        mult[linha][coluna] += m1[linha][coluna] * m2[coluna][linha];
      }
    }
  }
}

int determinante(int m[3][3]) {
  // por sarrus e somente para matriz 3x3
  int diag =  m[0][0] * m[1][1] * m[2][2] +
              m[0][2] * m[1][2] * m[2][0] +
              m[0][2] * m[1][0] * m[2][1];

  int neg =   m[2][0] * m[1][1] * m[0][2] -
              m[2][1] * m[1][2] * m[0][0] -
              m[2][2] * m[1][0] * m[0][1];

  return diag - neg;
}

int** inversa(int matriz[3][3]) {
  // Uma matriz quadrada, cujo determinante e diferente de zero e dita
  // inversıvel e o produto de uma matriz pela sua inversa e a matriz
  // identidade
  // 1. Achar a matriz de determinantes menores;
  // 2. Achar a matriz de cofatores;
  // 3. Achar a matriz adjunta;
  // 4. Inversa = 1/det × adjunta.
  return 0;
}

int main() {
  return 0;
}
