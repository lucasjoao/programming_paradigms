-- parte 1, questao 1
f x = case x of
        0 -> 1
        1 -> 5
        2 -> 2
        _ -> 1

-- parte 1, questao 2
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort lt ++ [x] ++ quicksort ge where
{ lt = [y | y <- xs, y < x]; ge = [y | y <- xs, y >= x] }

-- parte 2, questao 1
[1..1000]

-- parte 2, questao 2
[1,4..99]

-- parte 2, questao 3
[2*2**(x-1) | x <- [1..50]]

-- parte 2, questao 4
fatorial n = product [1..n]
