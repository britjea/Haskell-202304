data Resistor = Metal Bands | Ceramic Bands deriving Show
type Bands = Int 

metalResistor :: Bands -> Resistor 
metalResistor n 
  | n < 4 || n > 8 = error "Esse numero não esta na condição desejada.: "
  | otherwise      = Metal n

main :: IO ()
main = do
  let resistor = metalResistor 1
  print resistor
