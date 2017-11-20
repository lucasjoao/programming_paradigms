-- PA com razao 10 e primeiro termo 7
r = 10
a 1 = 7
a n = a 1 + (n - 1) * r

-- soma com forma geral
soma_geral n = n * (a 1 + a n) / 2

-- soma com listas
soma_lista n = sum [a x | x <- [1..n]]

-- produto com forma geral
produto_geral n = r ** n * (gamma (a 1 / r + n) / gamma (a 1 / r)) where
  gamma :: Double -> Double
  gamma n = sqrt(2*pi/n) * ((((1/exp 1) * (n + (1/(12*n - 1/(10*n)))))) ** n)

-- produto com listas
produto_lista n = product [a x | x <- [1..n]]

primeiro = soma_geral 3
segundo = soma_lista 3
terceiro = produto_geral 5
quarto = produto_lista 5

-- main
main = do
  putStrLn (show primeiro)
  putStrLn (show segundo)
  putStrLn (show terceiro)
  putStrLn (show quarto)
