{-# LANGUAGE GADTs #-}

data Resistor = Metal Bands | Ceramic Bands deriving Show

data Bands where
  B1 :: Bands
  B2 :: Bands
  B3 :: Bands
  B4 :: Bands
  B5 :: Bands
  B6 :: Bands
  B7 :: Bands
  B8 :: Bands
  B9 :: Bands
  deriving (Show)

toInt :: Bands -> Int
toInt B1 = 1
toInt B2 = 2
toInt B3 = 3
toInt B4 = 4
toInt B5 = 5
toInt B6 = 6
toInt B7 = 7
toInt B8 = 8
toInt B9 = 9

metalResistor :: Bands -> Resistor
metalResistor = Metal

subtractBands :: Bands -> Bands -> Int
subtractBands b1 b2 = abs $ toInt b1 - toInt b2

main :: IO ()
main = do
  let resistor1 = metalResistor B5
  let resistor2 = metalResistor B7
  putStrLn $ "Resistor 1: " ++ show resistor1
  putStrLn $ "Resistor 2: " ++ show resistor2
  putStrLn $ "Difference in bands: " ++ show (subtractBands B5 B7)