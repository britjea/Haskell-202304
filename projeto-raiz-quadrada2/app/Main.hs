{-# LANGUAGE CPP #-}

module Main where

quadrada :: (Ord a, Floating a) => a -> Maybe a
quadrada a
  | a < 0     = error "Argumento negativo não é permitido"
  | otherwise = Just (sqrt a)

main :: IO ()
main = do
    let x = -4.0
    case quadrada x of
        Just r -> putStrLn $ "A raiz quadrada de " ++ show x ++ " é " ++ show r
        Nothing -> putStrLn $ "Não é possível calcular a raiz quadrada de " ++ show x ++ " (número negativo)"