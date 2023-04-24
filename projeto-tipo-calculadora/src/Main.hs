-- Definindo a classe de tipo Calculadora
class Calculadora a where
    somar :: a -> a -> a
    subtrair :: a -> a -> a
    multiplicar :: a -> a -> a
    dividir :: a -> a -> a

-- Instância da classe Calculadora para o tipo Int
instance Calculadora Int where
    somar x y = x + y
    subtrair x y = x - y
    multiplicar x y = x * y
    dividir x y = x `div` y

-- Instância da classe Calculadora para o tipo Float
instance Calculadora Float where
    somar x y = x + y
    subtrair x y = x - y
    multiplicar x y = x * y
    dividir x y = x / y

-- Instância da classe Calculadora para o tipo Double
instance Calculadora Double where
    somar x y = x + y
    subtrair x y = x - y
    multiplicar x y = x * y
    dividir x y = x / y

main :: IO ()
main = do
    let resultadoSomaInt = somar (10 :: Int) (2 :: Int)
    let resultadoSomaFloat = somar (10.0 :: Float) (2.0 :: Float)
    let resultadoSomaDouble = somar (10.0 :: Double) (2.0 :: Double)

    let resultadoSubtracaoInt = subtrair (10 :: Int) (2 :: Int)
    let resultadoSubtracaoFloat = subtrair (10.0 :: Float) (2.0 :: Float)
    let resultadoSubtracaoDouble = subtrair (10.0 :: Double) (2.0 :: Double)

    let resultadoMultiplicacaoInt = multiplicar (10 :: Int) (2 :: Int)
    let resultadoMultiplicacaoFloat = multiplicar (10.0 :: Float) (2.0 :: Float)
    let resultadoMultiplicacaoDouble = multiplicar (10.0 :: Double) (2.0 :: Double)

    let resultadoDivisaoInt = dividir (10 :: Int) (2 :: Int)
    let resultadoDivisaoFloat = dividir (10.0 :: Float) (2.0 :: Float)
    let resultadoDivisaoDouble = dividir (10.0 :: Double) (2.0 :: Double)

    putStrLn $ "Resultado da soma Int: " ++ show resultadoSomaInt
    putStrLn $ "Resultado da soma Float: " ++ show resultadoSomaFloat
    putStrLn $ "Resultado da soma Double: " ++ show resultadoSomaDouble

    putStrLn $ "Resultado da subtração Int: " ++ show resultadoSubtracaoInt
    putStrLn $ "Resultado da subtração Float: " ++ show resultadoSubtracaoFloat
    putStrLn $ "Resultado da subtração Double: " ++ show resultadoSubtracaoDouble

    putStrLn $ "Resultado da multiplicação Int: " ++ show resultadoMultiplicacaoInt
    putStrLn $ "Resultado da multiplicação Float: " ++ show resultadoMultiplicacaoFloat
    putStrLn $ "Resultado da multiplicação Double: " ++ show resultadoMultiplicacaoDouble

    putStrLn $ "Resultado da divisão Int: " ++ show resultadoDivisaoInt
    putStrLn $ "Resultado da divisão Float: " ++ show resultadoDivisaoFloat
    putStrLn $ "Resultado da divisão Double: " ++ show resultadoDivisaoDouble

