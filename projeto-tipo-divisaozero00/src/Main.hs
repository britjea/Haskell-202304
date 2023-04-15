division :: Double -> Double -> Either String Double
division _ 0 = Left "Erro: divisão por zero!"
division x y = Right (x / y)

main :: IO ()
main = do
    let resultado = division 10 0
    case resultado of
        Left mensagem -> putStrLn mensagem
        Right valor -> print valor 
