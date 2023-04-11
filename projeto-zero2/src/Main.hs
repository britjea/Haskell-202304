{-# LANGUAGE DataKinds #-}
import Data.Vector.Sized (Vector, singleton, (>:))
import qualified Data.Vector.Sized

data Divisor :: Nat -> Type where
  DCons :: Double -> Vector n Double -> Divisor n
  DZero :: Divisor 'Z

(/?) :: Double -> Divisor n -> Maybe (Vector n Double)
_ /? DZero = Nothing
x /? (DCons y ys) = Just $ singleton (x / y) >: ys

nonZero :: Double -> Maybe (Divisor ('S 'Z))
nonZero 0 = Nothing
nonZero x = Just $ DCons x (singleton 1)

main :: IO ()
main = do
  let x = 10
      myY = nonZero 0
  case fmap (x /?) myY of
    Nothing -> putStrLn "Erro: divisão por zero"
    Just Nothing -> putStrLn "Erro: divisão por zero"
    Just (Just result) -> putStrLn $ "Resultado: " ++ show result
