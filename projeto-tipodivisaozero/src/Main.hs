{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeInType #-}
{-# LANGUAGE TypeFamilyDependencies #-}
{-# LANGUAGE TypeApplications #-}

import Prelude hiding (div, fromInteger, error)
import Data.Proxy (Proxy(..))
import GHC.TypeNats (Nat, KnownNat, natVal)
import qualified Data.Type.Equality as T
import GHC.TypeLits (ErrorMessage, TypeError)
--import GHC.TypeLits (type (+), type (-), type (<=), Nat, natVal)
import qualified GHC.TypeLits as T
import GHC.Num (fromInteger)
import GHC.TypeLits (Nat, KnownNat, natVal, type (+), type (-), type (<=))
import Prelude (div)
--import Data.Type.NatSing
import GHC.TypeNats


type family If (c :: Bool) (t :: k) (f :: k) :: k where
  If 'True t f = t
  If 'False t f = f

type family DivisibleByZero (n :: NotZero) (d :: Nat) :: Bool where
  DivisibleByZero 'Positive d = If (1 T.== d) 'False 'True
  DivisibleByZero 'Negative d = If (1 T.== d) 'False 'True

type family DivSafe (n :: NotZero) (d :: Nat) (x :: Int) :: Int where
  DivSafe n d x = If (DivisibleByZero n d) (x T.Div Val d) (Error "divisão por zero")

type family Val (n :: Nat) :: Integer where
  Val 0 = Error "divisão por zero"
  Val n = FromNat n

type family FromNat (n :: Nat) :: Integer where
  FromNat 0 = 0
  FromNat n = 1 + FromNat (n - 1)


data NotZero where
  Positive :: NotZero
  Negative :: NotZero

type Error (msg :: ErrorMessage) = T.TypeError (T.Text msg)

divSafe :: forall n d. (DivisibleByZero n d ~ 'True, KnownNat d) => Int -> NotZero -> Int
divSafe x Positive = DivSafe Positive d x
  where d = natVal @d Proxy
divSafe x Negative = DivSafe Negative d x
  where d = negate (NatVal.Sym (natVal @d) Proxy)

main :: IO ()
main = do
  putStrLn "Digite um número:"
  x <- readLn
  putStrLn "Digite 1 para Positive ou 2 para Negative:"
  opt <- readLn
  let n = if opt == 1 then Positive else Negative
  putStrLn $ "Resultado: " ++ show (DivSafe n d x)
    where d = case n of
                Positive -> 5
                Negative -> -5