newtype Counter a = MkCounter [(a, Int)]

countWords :: Counter String
countWords = MkCounter [("Oi", 10), ("Olá", 15), ("Mundo", 25)]

evidences :: Counter Bool
evidences = MkCounter [(True, 10), (True, 15), (True, 10), (False, 15)]

checkFacts :: Counter Bool -> Double
checkFacts counts = trues / falses
  where
    trues  = fromIntegral $ filterAndGroup id  counts
    falses = fromIntegral $ filterAndGroup not counts

filterAndGroup :: (a -> Bool) -> Counter a -> Int
filterAndGroup p (MkCounter xs) = foldr countIf 0 xs
  where
    countIf (x, c) acc
      | p x       = c + acc
      | otherwise = acc
main :: IO ()
main = do
  putStrLn "countWords:"
  --print countWords
  putStrLn "evidences:"
  --print evidences
  putStrLn "checkFacts:"
  print $ checkFacts evidences
