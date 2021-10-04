# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.6

* System dependencies:
  - rails 5.2.6

* Configuration
  - 

* Database creation
  - Command: 
    rails db:migrate

* Database population
  - Command:
    rails db:seed

* Deployed Application instructions:
  - URL: https://desafio-conecta.herokuapp.com/
  - 

* API Routes:
  Produtos 

  Rota: /products
  > GET: 
    - Descrição: Retorna lista de produtos

  > POST:
    - JSON: 
      {
        "product": {
          "name": "Lampada",
          "description": "é de vidro",
          "price": 12.99,
          "quantity": 2
        }
      }
    - Descrição: Cria um registro de um novo produto e inicializa o seu estoque

  Rota: /products/product_id
  > GET:
    - Descrição: Retorna o produto com id
  
  > PUT/PATCH
    -  JSON: 
      {
        "product": {
          "name": "Lampada",
          "description": "é de vidro",
          "price": 12.99,
        }
      }
    - Descrição: Atualiza o produto com id
  
  > DELETE
    - Descrição: Deleta o produto com id

  Estoque
  Rota: /products/product_id/stock
  > PUT
    - JSON:
    {
      "stock": {
        "quantity": 10,
        "action": "exit"
	    }
    }
    - Descrição: Atuliza a quantidade do produto com id em estoque segundo a action que pode ser para "entry" ou "exit" (entrada e saida, respectivamente)

  Usuário
  Rota: /users
  > GET
    - Descrição: Retorna lista de usuário cadastrados
  
  > POST
    - JSON:
    {
      "user": {
        "name": "Nome",
        "email": "email@exemplo.com",
        "password": "123456",
        "role": "admin",
        "cpf": "11111111111"
      }
    }
    - Descrição: Registra um usuário novo no sistema. A role do usuário pode ser "admin" ou "employee" e dá acesso a diferentes recursos do sistema. O cpf deve ser uma string de tamanha igual a 11.

  Rota: /users/user_id
  > GET
    - Descrição: Retorna o usuário com id

  > PUT/PATCH
    - JSON: 
    {
      "user": {
        "name": "Nome",
        "email": "email@exemplo.com",
        "password": "123456",
        "role": "admin",
        "cpf": "11111111111"
      }
    }
    - Descrição: Atualiza o usuário com id
  
  > DELETE
    - Descrição: Deleta o usuário com id






