module Main (main) where

data MyDouble = MyDouble Double

division :: MyDouble -> MyDouble -> Either String Double
division _ (MyDouble 0) = Left "Erro: divisão por zero!"
division (MyDouble x) (MyDouble y) = Right (x / y)

main :: IO ()
main = do
  putStrLn "Digite o dividendo:"
  input1 <- getLine
  let dividendo = MyDouble (read input1 :: Double)
  
  putStrLn "Digite o divisor:"
  input2 <- getLine
  let divisor = MyDouble (read input2 :: Double)
  
  case division dividendo divisor of
    Left errorMessage -> putStrLn errorMessage
    Right result -> putStrLn $ "O resultado da divisão é: " ++ show result
