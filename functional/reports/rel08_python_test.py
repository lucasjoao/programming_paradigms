from rel08_python import *
import unittest
import numpy as np


class Testrel08(unittest.TestCase):
    def test_norma(self):
        self.assertEqual(15, norma([12, -9]))

    def test_mult_escalar(self):
        self.assertEqual([4, 8, 12], mult_escalar([2, 4, 6], 2))

    def test_add_vetores(self):
        self.assertEqual([3, 10, 15], add_vetores([0, 5, 9], [3, 5, 6]))

    def test_prod_escalar(self):
        self.assertEqual([4, 20, 100], prod_escalar([4, 5, 10], [1, 4, 10]))

    def test_prod_vetorial(self):
        self.assertNotEqual([10, 10, 10], prod_vetorial([1, 2, 3], [1, 2, 3]))

    def test_angulo_vetores(self):
        self.assertNotEqual(90, angulo_entre_vetores([0, 2], [0, 4]))

    def test_transposicao(self):
        self.assertEqual([[1, 2], [3, 4]], transposicao([[1, 3], [2, 4]]))

    def test_mult_escalar_matriz(self):
        self.assertEqual([[2, 2], [2, 2]],
                         mult_escalar_matriz([[1, 1], [1, 1]], 2))

    def test_add_matriz(self):
        self.assertEqual([[4, 6], [8, 10]],
                         add_matrizes([[10, 3], [7, 6]],
                                      [[-6, 3], [1, 4]]))

    def test_mult_matriz(self):
        self.assertTrue(([[18, 18], [31, 33]] ==
                         mult_matrizes([[2, 2], [3, 4]],
                                       [[5, 3], [4, 6]])).all())

    def test_determinante(self):
        self.assertEqual(-3, determinante([[1, 2, 3], [4, 5, 6], [7, 8, 10]]))

if __name__ == '__main__':
    unittest.main()
