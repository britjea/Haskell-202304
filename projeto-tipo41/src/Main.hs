type Nome = String
data Fisica
data Juridica
data Pessoa t = Pessoa Nome

-- Funciona como esperado!
criaFisica :: Nome -> Pessoa Fisica
criaFisica = Pessoa

-- Esse aqui também
criaEmpresa :: Nome -> Pessoa Juridica
criaEmpresa = Pessoa

-- Isso aqui também é válido! Neste caso o contexto da chamada
-- determina quem é `a`
criaPessoa :: Nome -> Pessoa a
criaPessoa = Pessoa

