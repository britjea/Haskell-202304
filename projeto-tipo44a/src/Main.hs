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
type Telefone = String
type Idade = Int
type CPF = String

data PessoaTipo = Fisica | Juridica

data Pessoa (t :: PessoaTipo) where
  PessoaFisica :: Nome -> Telefone -> Idade -> CPF -> Pessoa Fisica
  PessoaJuridica :: Nome -> Pessoa Juridica

criaFisica :: Nome -> Telefone -> Idade -> CPF -> Pessoa Fisica
criaFisica = PessoaFisica

criaJuridica :: Nome -> Pessoa Juridica
criaJuridica = PessoaJuridica

getNome :: Pessoa a -> Nome
getNome (PessoaFisica nome _ _ _) = nome
getNome (PessoaJuridica nome) = nome

getTelefone :: Pessoa Fisica -> Telefone
getTelefone (PessoaFisica _ telefone _ _) = telefone

getIdade :: Pessoa Fisica -> Idade
getIdade (PessoaFisica _ _ idade _) = idade

getCPF :: Pessoa Fisica -> CPF
getCPF (PessoaFisica _ _ _ cpf) = cpf

main :: IO ()
main = do
  let pessoaFisica = criaFisica "João" "11987654321" 30 "123.456.789-00"
  let pessoaJuridica = criaJuridica "Empresa XYZ"

  putStrLn $ "Pessoa Física: " ++ (getNome pessoaFisica)
  putStrLn $ "Telefone: " ++ (getTelefone pessoaFisica)
  putStrLn $ "Idade: " ++ (show $ getIdade pessoaFisica)
  putStrLn $ "CPF: " ++ (getCPF pessoaFisica)

  putStrLn $ "Pessoa Jurídica: " ++ (getNome pessoaJuridica)
