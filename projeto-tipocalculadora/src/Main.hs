import Text.Read (readMaybe)
import Numeric (showFFloat)

main :: IO ()
main = do
  putStrLn "Digite um número:"
  num1 <- readLn :: IO Double
  putStrLn "Digite outro número:"
  num2 <- readLn :: IO Double
  putStrLn "Escolha uma operação: "
  putStrLn "1 - Adição"
  putStrLn "2 - Subtração"
  putStrLn "3 - Multiplicação"
  putStrLn "4 - Divisão"
  putStrLn "5 - Potência"
  putStrLn "6 - Raiz Quadrada"
  op <- getLine
  let mOp = readMaybe op :: Maybe Int
      result = case mOp of
                 Just 1 -> num1 + num2
                 Just 2 -> num1 - num2
                 Just 3 -> num1 * num2
                 Just 4 -> num1 / num2
                 Just 5 -> num1 ** num2
                 Just 6 -> sqrt num1
                 Just _ -> error "Opção inválida"
                 Nothing -> error "Opção inválida"
  handleOption result

handleOption :: Double -> IO ()
handleOption result = putStrLn $ "Resultado: " ++ showFFloat (Just 2) result ""
