module Main (main) where
division :: Double -> Double -> Either String Double
division _ 0 = Left "Erro: divisão por zero!"
division x y = Right (x / y)

main :: IO ()
main = do
  putStrLn "Digite o dividendo:"
  input1 <- getLine
  let dividendo = read input1 :: Double
  
  putStrLn "Digite o divisor:"
  input2 <- getLine
  let divisor = read input2 :: Double
  
  case division dividendo divisor of
    Left errorMessage -> putStrLn errorMessage
    Right result -> putStrLn $ "O resultado da divisão é: " ++ show result
