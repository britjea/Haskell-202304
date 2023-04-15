{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE GADTs #-}

module Main (main) where

import GHC.TypeLits (TypeError, ErrorMessage(..))

data Divisor (n :: Bool) where
    Zero :: Divisor 'False
    NonZero :: Double -> Divisor 'True

division :: Double -> Divisor 'True -> Either String Double
division x (NonZero y) = Right (x / y)

main :: IO ()
main = do
    putStrLn "Digite o dividendo:"
    input1 <- getLine
    let dividendo = read input1 :: Double

    putStrLn "Digite o divisor:"
    input2 <- getLine
    let divisorValue = read input2 :: Double
        divisor = if divisorValue == 0
                  then error "Erro em tempo de compilação: divisão por zero!"
                  else NonZero divisorValue

    case division dividendo divisor of
        Left errorMessage -> putStrLn errorMessage
        Right result -> putStrLn $ "O resultado da divisão é: " ++ show result
