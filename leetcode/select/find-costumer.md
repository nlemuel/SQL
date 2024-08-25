# 584. Find Customer Referee

## Tabela: Customer

A tabela `Customer` contém informações sobre os clientes, incluindo o ID do cliente, seu nome e o ID do cliente que os indicou. A estrutura da tabela é a seguinte:

| Column Name | Type    | Descrição                              |
|-------------|---------|----------------------------------------|
| id          | int     | ID do cliente                          |
| name        | varchar | Nome do cliente                        |
| referee_id  | int     | ID do cliente que indicou este cliente |

### Observações:

- **Chave Primária:** `id` é a chave primária, garantindo que os IDs dos clientes sejam únicos.
- **Interpretação das Linhas:** Cada linha desta tabela indica o ID de um cliente, seu nome e o ID do cliente que o indicou (`referee_id`). Se `referee_id` for `null`, significa que o cliente não foi indicado por ninguém.

## Objetivo

Escrever uma solução para encontrar os nomes dos clientes que **não** foram indicados pelo cliente com `id = 2`.

### Requisitos:

- A tabela de resultados pode ser retornada em qualquer ordem.

## Exemplo

### Entrada:

Considerando a tabela `Customer` com os seguintes dados:

| id | name | referee_id |
|----|------|------------|
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |

### Saída Esperada:

A saída deve ser uma tabela contendo os nomes dos clientes que **não** foram indicados pelo cliente com `id = 2`:

| name |
|------|
| Will |
| Jane |
| Bill |
| Zack |

### Explicação:

- **Will, Jane, Bill e Zack** não foram indicados pelo cliente com `id = 2`. Portanto, seus nomes aparecem na saída.
- **Alex** e **Mark** foram indicados pelo cliente com `id = 2`, então seus nomes não são incluídos na saída.
