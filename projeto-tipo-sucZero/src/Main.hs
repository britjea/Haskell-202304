{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}

module Main where

import Data.Kind

data Nat = Zero | Suc Nat

data NatNum (a :: Nat) = UnsafeMkNum {_x :: Nat}

notZero :: NatNum ('Suc s) -> Bool
notZero _ = True

zero = UnsafeMkNum @Zero Zero
one = UnsafeMkNum @(Suc Zero) (Suc Zero)
two = UnsafeMkNum @('Suc (Suc Zero)) (Suc (Suc Zero))

main :: IO ()
main = do
  print $ notZero one
  print $ notZero two
  print $ notZero zero
  -- O código abaixo vai gerar um erro de tipo:
  -- print $ notZero zero

--{-# LANGUAGE DataKinds #-}
--{-# LANGUAGE PolyKinds #-}
--{-# LANGUAGE TypeApplications #-}
--{-# LANGUAGE TypeFamilies #-}
--
--module Main Where
--
--import Data.Kind
--
--data Nat = Zero | Suc Nat
--
--data NatNum (a :: Nat) = UnsafeMkNum {_x :: Nat}
--
--notZero :: NatNum('Su s) -> Bool
--notZero _ = True
--
--zero = UnsafeMkNum @Zero Zero
--one = UnsafeMkNum @(Suc Zero) (Suc Zero)
--two = UnsafeMkNum @('Suc (Suc Zero)) (Suc (Suc Zero))
--
--main :: IO ()
--main = do
--  return $ notZero one
--  return $ notZero two
--  return $ notZero zero
--