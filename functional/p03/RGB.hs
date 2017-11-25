import Data.Char
import System.Environment
import System.IO

-- main
main::IO ()
main = do
  args <- getArgs
  case args of
      [input] -> do
          processaArquivo input

-- funcao que separa o rgb em camadas
separaRgb (b:g:r:[]) = ([b], [g], [r])
separaRgb (b:g:[]) = ([b], [g], [0])
separaRgb (b:[]) = ([b], [0], [0])
separaRgb (b:g:r:rest) =
  let (bs, gs, rs) = separaRgb rest
  in (b:bs, g:gs, r:rs)

-- funcao que pega o ponto flutuante de uma divisao
pontoFlutuante :: Int -> Float
pontoFlutuante i = fromIntegral i / 256

-- tupla -> lista
toList :: (a, a , a) -> [a]
toList (x, y, z) = [x, y, z]

-- funcao principal que processa o arquivo
processaArquivo input = do
  toString <- readFile input

  let nomeArquivo = take(length(input) - 4) input
  let nomeSaida = map(nomeArquivo++) ["_blue.out", "_green.out", "_red.out"]

  outputs <- sequence [openFile arquivo WriteMode | arquivo <- nomeSaida]

  let deep = snd (splitAt 54 (map ord toString))

  let rgb = toList (separaRgb (map pontoFlutuante deep))
  sequence [hPrint file color | (file, color) <- zip outputs rgb]

  sequence [hClose arquivo | arquivo <- outputs]
  return()
