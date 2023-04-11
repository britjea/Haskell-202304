{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE  FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
module Main (main) where
import Data.List

somar :: Num a => a -> a -> a
somar a b = a + b

len :: [a] -> Int
len [] = 0
len (_:xs) = 1 + len xs

first :: [a] -> a
first [] = error "lista nao pode estar vazia"
first (x:_) = x

segredo :: Num a => a
segredo = 42

foo :: [Int] -> [Char] -> (Int, Char)
foo xs ys = (first xs, first ys)

bar :: Int -> Int
bar x = x + segredo

baz :: Float
baz = segredo

-- (a - f função qq)  (b - x valor qq) (c y valor qq)
-- 
aplicaEDevolvePar :: forall b c. (Num b, Num c) => (forall a. Num a => a -> a) -> b -> c -> (b, c)
aplicaEDevolvePar f x y = (f x, f y)

doIt :: (Int, Float)
doIt = aplicaEDevolvePar (^2) 42 3.1415

concatena :: (Show b, Show c) =>
	     (forall a. Show a => a -> String) -> b -> c -> String
concatena toString str1 str2 = toString str1 ++ "-" ++ toString str2

chamaConcatena :: String
chamaConcatena = concatena (\x -> "<" ++ show x ++ ">") "senha" 12345

--Type Class https://www.youtube.com/watch?v=DbEOrCD_fpQ
--Visible Type Applications - Desenvolvimento Orientado a Tipos https://www.youtube.com/watch?v=eQ2ZOEzgOmM
class Tipavel a  where
  nomeTipo :: a -> String

instance Tipavel Int where
  nomeTipo _ = "Int"
instance Tipavel Integer where
  nomeTipo _ = "Integer"
instance Tipavel Float where
  nomeTipo _ = "É um Float"
instance Tipavel Double where
  nomeTipo _ = "É um Double"
instance Tipavel Char where
  nomeTipo _ = "É um Char"

isTipoInteiro :: Tipavel a => a -> Bool
isTipoInteiro x = nomeTipo x `elem` ["Int", "Integer"]


-- data type https://www.youtube.com/watch?v=eQ2ZOEzgOmM   nos 13 minutos
data Unidade = Grama | Kilograma | Onça | Libra | Pedra deriving (Enum)

fator :: Floating f => Unidade -> f
fator = \case
  Grama     -> 1
  Kilograma -> 1000
  Onça      -> 28.35
  Libra     -> 453.59
  Pedra     -> 14 * fator Libra

sigla :: Unidade -> String
sigla = \case
  Grama     -> "g"
  Kilograma -> "kg"
  Onça      -> "oz"
  Libra     -> "lb"
  Pedra     -> "st"


conv :: Floating f =>  Unidade -> Unidade -> f -> f
conv u0 u1 x = x * fator u0 / fator u1

convOzLibra :: Floating f => f -> f
convOzLibra = conv Onça Libra

converteUsuario :: Floating f => String -> String -> f -> Maybe f
converteUsuario orig dest val =
    conv <$> buscaUnidade orig <*> buscaUnidade dest <*> pure val
    where
        unidades = enumFrom  (toEnum 0) :: [Unidade]
        buscaUnidade x = find ((x ==) . sigla) unidades

main :: IO ()
main = do
    let str = "Hello world"
    print $ str ++ " "
