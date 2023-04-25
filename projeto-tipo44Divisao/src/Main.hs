{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}

import Data.Singletons.Prelude
import Data.Singletons.TH

$(singletons [d|
  data Nat = Z | S Nat deriving (Show, Eq)
  |])

type family NonZero (n :: Nat) :: Bool where
  NonZero Z = 'False
  NonZero (S _) = 'True

data Divisao (num :: Nat) (den :: Nat) where
  Divisao :: Sing num -> Sing den -> Divisao num den

criaDivisao
  :: forall num den. (SingI num, SingI den, NonZero den ~ 'True)
  => Divisao num den
criaDivisao = Divisao sing sing

main :: IO ()
main = do
  let div1 = criaDivisao @(S (S Z)) @(S Z) -- 2 / 1
  putStrLn "Divisão válida criada"
