{-# LANGUAGE GADTs #-}
{-# language StandaloneDeriving #-}
{-# language MultiParamTypeClasses #-}
{-# language ConstraintKinds #-}
{-# language FunctionalDependencies #-}
--{-# LANGUAGE StandalonekindSignatures #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# language StandaloneDeriving #-}

type Nome = String
data PessoaTipo = Fisica | Juridica

data Pessoa (t :: PessoaTipo) where
  Pessoa :: Nome -> Pessoa t

criaFisica :: Nome ->  Pessoa Fisica
criaFisica = Pessoa

criaJuridica :: Nome -> Pessoa Juridica
criaJuridica = Pessoa

todoMundoEBemVindo :: Pessoa a -> Nome
todoMundoEBemVindo (Pessoa nome) = nome

apenasPessoasFisicas :: Pessoa Fisica -> Nome
apenasPessoasFisicas (Pessoa nome) = nome

apenasPessoasJuridicas :: Pessoa Juridica -> Nome
apenasPessoasJuridicas (Pessoa nome) = nome

main :: IO ()
main = do
  let pessoaFisica = criaFisica "João"
  let pessoaJuridica = criaJuridica "Empresa XYZ"

  putStrLn $ "Pessoa Física: " ++ (apenasPessoasFisicas pessoaFisica)
  putStrLn $ "Pessoa Jurídica: " ++ (apenasPessoasJuridicas pessoaJuridica)

  putStrLn $ "Pessoa Física (bem-vindo): " ++ (todoMundoEBemVindo pessoaFisica)
  putStrLn $ "Pessoa Jurídica (bem-vindo): " ++ (todoMundoEBemVindo pessoaJuridica)