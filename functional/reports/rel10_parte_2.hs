-- funcoes auxiliares
a // b = do
  a <- x
  b <- y
      if b == 0 then
          Nothing
      else
          Just (a/b)

add x y = do
  x <- a
  y <- b
  return (a+b)

-- funcao principal
resist x y = let
  one = return 1
  r1 = return x
  r2 = return y
  in one // (add (one // r1) (one // r2))

-- verificacoes
primeiro resist 0 1
segundo resist 10 10

-- main
main = do
  putStrLn (show primeiro)
  putStrLn (show segundo)
