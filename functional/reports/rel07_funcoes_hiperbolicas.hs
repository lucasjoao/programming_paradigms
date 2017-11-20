module FuncoesHiperbolicas (FuncH(Sinh, Cosh, Tanh, Coth)) where

data FuncH = Sinh Float
    | Cosh Float
    | Tanh Float
    | Coth Float
    deriving Show

e = 1 + sum([1/product[1..n] | n <- take 10 [1..]])

value :: FuncH -> Float
value(Sinh x) = (e**x - e**(-x))/2
value(Cosh x) = (e**x + e**(-x))/2
value(Tanh x) = (value(Sinh x))/(value(Cosh x))
value(Coth x) = (value(Cosh x))/(value(Sinh x))
