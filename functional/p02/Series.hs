-- calcula soma de uma serie finita de numeros impares
somaImpar n = map(\x -> sum [1,3..x])  [1,3..n]
totalSomaImpar n = last(somaImpar n)

-- calcula soma de uma serie finita de numeros pares
somaPar n = map(\x -> sum [2,4..x]) [2,4..n]
totalSomaPar n = last(somaPar n)

-- calcula soma de uma serie finita de numeros quadrados de inteiros
somaQuadrados n = map(\x -> sum [y**2 | y <- [0..x]]) [0..n]
totalSomaQuadrados n = last(somaQuadrados n)

-- calcula soma de uma serie finita de numeros quadrados de impares
somaQuadradosImpares n = map(\x -> sum [y**2 | y <- [1,3..x]]) [1,3..n]
totalSomaQuadradosImpares n = last(somaQuadradosImpares n)

-- calcula o valor do inteiro 2 pela soma dos termos de uma serie infinita
quaseDois n = sum(map(\x -> 2 / (x * x + x)) (take n [1..]))

-- calcula o valor do euler pela soma dos termos de uma serie infinita
quaseEuler n = 1 + sum(map(\x -> 1 / product[1..x]) (take n [1..]))
