{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}

import Data.Singletons
import Data.Singletons.TH

$(singletons [d|
  data Nat = Z | S Nat deriving (Show, Eq)
  |])

type family NonZero (n :: Nat) :: Bool where
  NonZero Z = 'False
  NonZero (S _) = 'True

data Adicao (a :: Nat) (b :: Nat) where
  Adicao :: Sing a -> Sing b -> Adicao a b

criaAdicao
  :: forall a b. (SingI a, SingI b, NonZero a ~ 'True, NonZero b ~ 'True)
  => Adicao a b
criaAdicao = Adicao sing sing

main :: IO ()
main = do
  let soma = criaAdicao @(S (S Z)) @(S Z) -- 2 + 1
  putStrLn "Adição válida criada"
