{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Main (main) where
--3.1 https://www.youtube.com/watch?v=FyXzRcbOThA
--3.2 https://www.youtube.com/watch?v=VoflHCNgz-4
f :: Int -> Int
f x = length $ show x <> " Unidades"

--newtype Money = MkMoney Int

--instance Num Money where
--  (MkMoney x) + (MkMoney y) = MkMoney $ x + y
--  (MkMoney x) - (MkMoney y) = MkMoney $ x - y
--  (MkMoney x) * (MkMoney y) = MkMoney $ x * y
--  negate (MkMoney x) = MkMoney (negate x)
--  abs (MkMoney x) = MkMoney (signum x)
--  fromInteger x = MkMoney (fromInteger x)
--instance Eq Money where
--  (MkMoney x) == (MkMoney y) = x == y
--
--instance Ord Money where
--  (MkMoney x) <= (MkMoney y) = x <= y
type Money = Int

withdraw :: Money -> Money -> Money
withdraw account qty
  | account < qty = error "Nao pode"
  | otherwise     = account - qty

main :: IO ()
main = do
  putStrLn "hello world"
