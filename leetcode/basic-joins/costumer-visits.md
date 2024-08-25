# 1581. Customer Who Visited but Did Not Make Any Transactions

## Tabelas: Visits e Transactions

### Visits

A tabela `Visits` contém informações sobre os clientes que visitaram o shopping. A estrutura da tabela é a seguinte:

| Column Name  | Type | Descrição                   |
|--------------|------|-----------------------------|
| visit_id     | int  | ID único da visita          |
| customer_id  | int  | ID do cliente               |

### Transactions

A tabela `Transactions` contém informações sobre as transações realizadas durante uma visita. A estrutura da tabela é a seguinte:

| Column Name     | Type | Descrição                                  |
|-----------------|------|--------------------------------------------|
| transaction_id  | int  | ID único da transação                      |
| visit_id        | int  | ID da visita associada à transação         |
| amount          | int  | Valor da transação                         |

## Objetivo

Escrever uma solução para encontrar os IDs dos clientes que visitaram o shopping sem realizar nenhuma transação, e o número de vezes que esses clientes fizeram esse tipo de visita.

- A tabela de resultados deve conter `customer_id` e `count_no_trans`, que representa o número de vezes que o cliente visitou o shopping sem realizar transações.
- A tabela de resultados pode ser retornada em qualquer ordem.

### Requisitos:

1. Selecionar os IDs dos clientes da tabela `Visits`.
2. Contar o número de visitas em que os clientes não fizeram nenhuma transação.
3. Retornar os resultados agrupados por `customer_id`.

## Exemplo

### Entrada:

Considerando as tabelas `Visits` e `Transactions` com os seguintes dados:

**Tabela `Visits`:**

| visit_id | customer_id |
|----------|-------------|
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |

**Tabela `Transactions`:**

| transaction_id | visit_id | amount |
|----------------|----------|--------|
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |

### Saída Esperada:

A saída deve ser uma tabela contendo o `customer_id` e o número de visitas sem transações (`count_no_trans`):

| customer_id | count_no_trans |
|-------------|----------------|
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |

### Explicação:

- **Cliente 23**: Visitou uma vez e fez uma transação.
- **Cliente 9**: Visitou uma vez e fez uma transação.
- **Cliente 30**: Visitou uma vez e não fez nenhuma transação.
- **Cliente 54**: Visitou três vezes; em duas visitas não fez transações, mas em uma visita fez três transações.
- **Cliente 96**: Visitou uma vez e não fez nenhuma transação.

## Solução SQL

A solução SQL para resolver este problema envolve os seguintes passos:

1. Selecionar o `customer_id` da tabela `Visits`.
2. Contar o número de visitas para as quais não existem transações correspondentes na tabela `Transactions`.
3. Agrupar os resultados por `customer_id`.

```sql
SELECT v.customer_id,
       COUNT(v.visit_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id;
