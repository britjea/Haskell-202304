data NonZero

 NonZero a where
  NonZero :: Double -> NonZero { value :: Double | value /= 0}

division :: Double -> NonZero Double -> Double
division x (NonZero y) = x / y

main :: IO ()
main = do
    let resultado = division 10 (NonZero 2) 
    print resultado
