# PokeRails

## Desafio Pokémon para Desenvolvedores

Uma aplicação web básica que irá ao inserir um nome de cidade, ela retorna a temperatura e um Pokémon de acordo com um faixa de temperatura.

## Tecnologias utilizadas

* Docker: 18.09.6-ce

* Docker-compose: 1.24.0

* Ruby: 2.6.3

* Rails: 5.2.3

* Gem figaro para configuração.

* Gem faraday para requisições.

* Gem poke-api-v2 para retorno das informações dos pokémons.

* Bootstrap com Jquery para front.

## Orientações para execução

### Passo 1 - Clone o repositório

Com o git instalado, faça o clone do repositório:

```
git clone https://github.com/herberthudson/PokeRails.git
```

### Passo 2 - Configuração da APPID

Deve-se obter uma Api key em https://openweathermap.org/api.

Após isso, criar o arquivo application.yml em PokeRails/config/ com o seguinte conteudo:

```
APPID: SUA_API_KEY
```

Não se esquece de atualizar com sua API KEY

### Passo 3 - Construção do ambiente 

Com o docker e docker-compose instalados e executando na máquina, vamos construir o ambiente, acesso o diretório do repositório e execute no terminal:

```
docker-compose build 
```

### Passo 4 - Iniciando a aplicação

Com o terminal aberto no diretório e realizado a construção do ambiente, vamos iniciar, para isso, execute no terminal:

```
docker-compose up
```

Após terminar o processo, no navegador, iremos acessar o seguinte endereço: http://localhost:3000

Pronto! Divirta-se!


