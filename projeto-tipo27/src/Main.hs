{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiWayIf #-}

module Main (main) where
import Data.List
--https://www.youtube.com/watch?v=cJ3n7p0YdMU
data Grama
data Kilograma
data Onça
data Libra
data Pedra

class Unidade u where
  sigla :: String
  fator :: Floating a => a

instance Unidade Grama where
  sigla = "g"
  fator = 1

instance Unidade Kilograma where
  sigla = "kg"
  fator = 1000

instance Unidade Onça where
  sigla = "oz"
  fator = 28.35

instance Unidade Libra where
  sigla = "lb"
  fator = 453.59

instance Unidade Pedra where
  sigla = "st"
  fator = 14 * fator @Libra

class Conv a b where
  conv :: Floating f => f -> f

instance (Unidade a, Unidade b) => Conv a b where
  conv x = x * fator @a / fator @b

convOzLibra :: Floating f => f -> f
convOzLibra x = conv @Onça @Libra x

data Proxy a = Proxy

convProxy :: forall a b f. (Unidade a, Unidade b, Floating f) => Proxy a -> Proxy b -> f -> f
convProxy _ _ = conv @a @b 

aplicaPara :: forall b. String -> (forall a. Unidade a => Maybe (Proxy a -> b)) -> Maybe b
aplicaPara u f = 
  if | sigla @Grama     == u -> jfp @Grama
     | sigla @Kilograma == u -> jfp @Kilograma
     | sigla @Onça      == u -> jfp @Onça
     | sigla @Libra     == u -> jfp @Libra
     | sigla @Pedra     == u -> jfp @Pedra
     | otherwise             -> Nothing
  where
    jfp :: forall u. Unidade u = Maybe b
    jfp = f <*> pure (Proxy @u)

converteUsuario :: forall f. (Floating f) =>
	       String -> String -> f -> Maybe f
converteUsuario orig dest val =
  aplicaPara dest (aplicaPara orig (Just convProxy)) <*> pure val

--converteUsuario :: Floating f -> String -> String -> f Maybe f 
--converteUsuario orig dest val =
--  aplicaPara dest (aplicaPara orig(Just convProxy)) <*> pure val



converteUnidadeParaTipo :: Unidade u => String -> Proxy u 
converteUnidadeParaTipo "g" = Proxy Grama :: Proxy Grama


main :: IO ()
main = do
  putStrLn "hello world"
