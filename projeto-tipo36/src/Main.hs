data Stream a = a :> Stream a deriving Show

stream :: Int -> Stream Int
stream x = x :> stream (x +1)

toListUntil :: Int -> Stream a -> [a]
toListUntil 0 _ = []
toListUntil n(x :> xs) = x : toListUntil (n-1) xs

main :: IO()
main = do
  putStrLn "Jean PIerre"


