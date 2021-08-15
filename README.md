# ignite-elixir-t4-chapter4-relacionamento-entidades-Template-00
Desafio: Relacionamento de entidades -Ignite Trilha Elixir - Turma 03 - Chapter IV

# 💻 Sobre o desafio

Nesse desafio, você deverá implementar uma nova feature na aplicação feita no desafio: https://github.com/bruguedes/ignite-elixir-t3-chapter3-crud-refeicoes-diarias-diarias.
Agora a aplicação deve possuir uma tabela `users` e esses usuários devem possuir uma relação *one-to-many* com 
a tabela `meals` (já feita no primeiro desafio do capítulo) onde cada usuário tem a sua própria lista de refeições diárias.

ROTAS PARA USUÁRIO
    Criando usuário:
        POST : http://localhost:4000/api/users
        {
        "cpf" : "12345678912",
        "email": "bruguedes@gmail.com",
        "name":"Bruno Guedes"
        } 

    Atualizando usuário:
        PUT : http://localhost:4000/api/users/:id
        {
            "cpf": "cpf",
            "email": "email,
            "name": "name"
        }   
    Buscando usuário: 
        GET : http://localhost:4000/api/users/:id

    Deletando usuário: 
        DELETE : http://localhost:4000/api/users/:id

ROTAS PARA REFEIÇÕES
    Criando usuário:
        POST : http://localhost:4000/api/meals
        {
            "calories" : "350",
            "date" : "2021-07-30",
            "time" : "12:00:00",
            "description" : "Frango com arroz integral",
            "user_id" : "c890dfa9-a56a-41cc-aa76-9ca333ca7b5b"
        } 

    Atualizando usuário:
        PUT : http://localhost:4000/api/meals/:id
         {
            "calories" : "calories",
            "date" : "date",
            "time" : "time",
            "description" : "description",
        }   
    Buscando usuário: 
        GET : http://localhost:4000/api/meals/:id

    Deletando usuário: 
        DELETE : http://localhost:4000/api/meals/:id
