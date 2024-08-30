## Ejercicios Haskell
  # Tarjeta de credito
   ```Haskell
      main :: IO ()
      main = do
      putStrLn "Ingrese un número: "
      input <- getLine
      let number = read input :: Integer
    
      putStrLn "Lista de dígitos:"
      print $ toDigits number
    
      putStrLn "Lista de dígitos en orden inverso:"
      print $ toDigitsRev number
    
      putStrLn "Duplica cada segundo dígito comenzando desde la derecha:"
      print $ doubleEveryOther (toDigits number)
    
      putStrLn "Suma de los dígitos:"
      print $ sumDigits (doubleEveryOther (toDigits number))
    
      putStrLn "¿Es un número de tarjeta válido?"
      print $ validate number
   ```
  # Torres de Hanoi (Con el ejercicio 6 resuelto)
  ```Haskell
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
  ```
