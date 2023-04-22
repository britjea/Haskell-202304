data Resistor = Metal Bands | Ceramic Bands deriving Show

newtype Bands = Bands Int deriving (Show, Eq)

toInt :: Bands -> Int
toInt (Bands n) = n

metalResistor :: Bands -> Resistor
metalResistor = Metal

mkBands :: Int -> Maybe Bands
mkBands n
  | n /= 0 = Just (Bands n)
  | otherwise = Nothing

subtractBands :: Bands -> Bands -> Int
subtractBands b1 b2 = abs $ toInt b1 - toInt b2

main :: IO ()
main = do
  case (mkBands 1, mkBands 7) of
    (Just b1, Just b2) -> do
      let resistor1 = metalResistor b1
      let resistor2 = metalResistor b2
      putStrLn $ "Resistor 1: " ++ show resistor1
      putStrLn $ "Resistor 2: " ++ show resistor2
      putStrLn $ "Difference in bands: " ++ show (subtractBands b1 b2)
    _ -> putStrLn "Error: Invalid non-zero integers"
