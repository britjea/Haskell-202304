import Data.Char
import Data.List
import Control.Monad
import System.IO

type Board = [[Char]]

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStrLn "Bem-vindo ao Jogo da Velha!"
    putStrLn "As posições são numeradas de 1 a 9. Boa sorte!"
    gameLoop emptyBoard 'X'

emptyBoard :: Board
emptyBoard = replicate 3 (replicate 3 ' ')

displayBoard :: Board -> IO ()
displayBoard board = putStrLn . unlines . intersperse divider $ map showRow board
  where
    divider = replicate 9 '-'
    showRow row = "| " ++ intercalate " | " (map showCell row) ++ " |"
    showCell ' ' = " "
    showCell c   = [c]

isValidMove :: Board -> Int -> Bool
isValidMove board pos = inRange && cellEmpty
  where
    inRange = pos >= 1 && pos <= 9
    cellEmpty = board !! row !! col == ' '
    (row, col) = divMod (pos - 1) 3

makeMove :: Board -> Int -> Char -> Board
makeMove board pos mark = newBoard
  where
    newBoard = take row board ++ [newRow] ++ drop (row + 1) board
    newRow = take col (board !! row) ++ [mark] ++ drop (col + 1) (board !! row)
    (row, col) = divMod (pos - 1) 3

gameLoop :: Board -> Char -> IO ()
gameLoop board player = do
    displayBoard board
    putStr $ "Jogador " ++ [player] ++ ", faça sua jogada (1-9): "
    move <- readLn
    if not (isValidMove board move)
      then do
        putStrLn "Jogada inválida, tente novamente."
        gameLoop board player
      else do
        let newBoard = makeMove board move player
        if isWinner newBoard player
          then do
            putStrLn $ "Parabéns, jogador " ++ [player] ++ " ganhou!"
            displayBoard newBoard
          else if isFull newBoard
            then do
              putStrLn "Empate!"
              displayBoard newBoard
            else gameLoop newBoard (otherPlayer player)

otherPlayer :: Char -> Char
otherPlayer 'X' = 'O'
otherPlayer 'O' = 'X'

isWinner :: Board -> Char -> Bool
isWinner board player = any fullRow rows || any fullRow cols || fullRow diag1 || fullRow diag2
  where
    rows = board
    cols = transpose board
    diag1 = zipWith (!!) board [0..]
    diag2 = zipWith (!!) board [2,1,0]
    fullRow = all (== player)

isFull :: Board -> Bool
isFull = all (all (/= ' '))