# 1068. Product Sales Analysis I

## Tabelas: Sales e Product

### Sales

A tabela `Sales` contém informações sobre as vendas de produtos em determinados anos. A estrutura da tabela é a seguinte:

| Column Name | Type | Descrição |
|-------------|------|-----------|
| sale_id     | int  | ID único da venda |
| product_id  | int  | ID do produto vendido |
| year        | int  | Ano da venda |
| quantity    | int  | Quantidade vendida |
| price       | int  | Preço por unidade do produto |

### Product

A tabela `Product` contém informações sobre os produtos. A estrutura da tabela é a seguinte:

| Column Name  | Type    | Descrição |
|--------------|---------|-----------|
| product_id   | int     | ID único do produto |
| product_name | varchar | Nome do produto |

## Objetivo

Escrever uma solução para reportar o `product_name`, `year` e `price` para cada `sale_id` na tabela `Sales`.

- A tabela de resultados deve conter `product_name`, `year`, e `price` para cada venda.
- A tabela de resultados pode ser retornada em qualquer ordem.

## Exemplo

### Entrada:

Considerando as tabelas `Sales` e `Product` com os seguintes dados:

**Tabela `Sales`:**

| sale_id | product_id | year | quantity | price |
|---------|------------|------|----------|-------|
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |

**Tabela `Product`:**

| product_id | product_name |
|------------|--------------|
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |

### Saída Esperada:

A saída deve ser uma tabela contendo o `product_name`, `year`, e `price` para cada venda:

| product_name | year | price |
|--------------|------|-------|
| Nokia        | 2008 | 5000  |
| Nokia        | 2009 | 5000  |
| Apple        | 2011 | 9000  |

### Explicação:

- Para o `sale_id = 1`, o produto "Nokia" foi vendido por 5000 no ano de 2008.
- Para o `sale_id = 2`, o produto "Nokia" foi vendido por 5000 no ano de 2009.
- Para o `sale_id = 7`, o produto "Apple" foi vendido por 9000 no ano de 2011.

## Solução SQL

A solução SQL para resolver este problema envolve os seguintes passos:

1. Realizar um `JOIN` entre as tabelas `Sales` e `Product` com base na coluna `product_id`.
2. Selecionar as colunas `product_name`, `year` e `price` para cada venda.

```sql
WITH SaleDetails AS (
    SELECT 
        s.sale_id,
        p.product_name,
        s.year,
        s.price
    FROM Sales s
    JOIN Product p
    ON s.product_id = p.product_id
)

SELECT 
    product_name,
    year,
    price
FROM SaleDetails;
