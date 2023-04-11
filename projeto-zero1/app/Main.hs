{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeOperators #-}
import Data.Kind

data Nat = Z | S Nat

data Divisor :: Nat -> Data.Kind.Type where

    DZero :: Divisor 'Z
    DPositive :: Double -> Divisor n -> Divisor ('S n)

divide :: Double -> Divisor n -> Double
divide _ DZero = error "Erro: divisão por zero"
divide x (DPositive y _) = x / y


nonZero :: Double -> Maybe (Divisor ('S 'Z))
nonZero 0 = Nothing
nonZero x = Just (DPositive x DZero)

main :: IO ()
main = do
    let x = 10
        myY = nonZero 0
    case fmap (divide x) myY of
        Nothing -> putStrLn "Erro: divisão por zero"
        Just result -> putStrLn $ "Resultado: " ++ show result