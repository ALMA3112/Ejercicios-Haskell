
import Data.List (minimumBy)
import Data.Ord (comparing)

-- Función para resolver las Torres de Hanoi con 3 estacas
hanoi :: Int -> [(Int, Int)]
hanoi 1 = [(1, 3)]  -- Caso base: mover un disco de la estaca 1 a la estaca 3
hanoi n = 
  let 
    movimientos1 = hanoi (n-1)
    movimiento2 = (1, 3)
    movimientos3 = map (\(a, b) -> (if a == 3 then 2 else if a == 2 then 3 else a, 
                                    if b == 3 then 2 else if b == 2 then 3 else b)) (hanoi (n-1))
  in 
    movimientos1 ++ [movimiento2] ++ movimientos3

-- Función para resolver las Torres de Hanoi con 4 estacas
hanoi4 :: Int -> [(Int, Int)]
hanoi4 1 = [(1, 4)]  -- Caso base: mover un disco de la estaca 1 a la estaca 4
hanoi4 n = 
  let 
    k = optimalK n
    movimientos1 = hanoi4 k
    movimientos2 = map (\(a, b) -> (if a == 4 then 1 else a, if b == 4 then 2 else b)) (hanoi (n-k))
    movimientos3 = map (\(a, b) -> (if a == 1 then 3 else a, if b == 2 then 4 else b)) (hanoi4 k)
  in 
    movimientos1 ++ movimientos2 ++ movimientos3

-- Función para calcular el k óptimo para la división de discos
optimalK :: Int -> Int
optimalK n = fst $ minimumBy (comparing snd) [(k, 2 * hanoi4Moves k + 2^(n-k) - 1) | k <- [1..n-1]]

-- Función para calcular el número de movimientos para 4 estacas
hanoi4Moves :: Int -> Int
hanoi4Moves 0 = 0
hanoi4Moves 1 = 1
hanoi4Moves n = minimum [2 * hanoi4Moves k + 2^(n-k) - 1 | k <- [1..n-1]]

-- Función main para ejecutar el programa
main :: IO ()
main = do
  putStrLn "Torres de Hanoi con 3 estacas (5 discos):"
  let moves3 = hanoi 5
  print moves3
  putStrLn $ "Número de movimientos: " ++ show (length moves3)
  
  putStrLn "\nTorres de Hanoi con 4 estacas (5 discos):"
  let moves4 = hanoi4 5
  print moves4
  putStrLn $ "Número de movimientos: " ++ show (length moves4)