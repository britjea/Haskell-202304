division :: Double -> Double -> Either String Double
division _ 0 = Left "Erro: divisão por zero!"
division x y = Right (x / y)