# 1757. Recyclable and Low Fat Products

## Tabela: Products

A tabela `Products` contém informações sobre produtos, incluindo se eles são baixos em gordura e se são recicláveis. A estrutura da tabela é a seguinte:

| Column Name | Type    | Descrição                                              |
|-------------|---------|--------------------------------------------------------|
| product_id  | int     | ID do produto                                          |
| low_fats    | enum    | Indica se o produto é baixo em gordura ('Y' para sim, 'N' para não) |
| recyclable  | enum    | Indica se o produto é reciclável ('Y' para sim, 'N' para não)       |

### Observações:

- **Chave Primária:** `product_id` é a chave primária, garantindo que os IDs dos produtos sejam únicos.
- **Interpretação das Linhas:** Cada linha desta tabela representa um produto, identificado por seu `product_id`, e contém informações sobre se o produto é baixo em gordura e se é reciclável.

## Objetivo

Escrever uma solução para encontrar os IDs dos produtos que são tanto baixos em gordura quanto recicláveis.

### Requisitos:

- A tabela de resultados pode ser retornada em qualquer ordem.

## Exemplo

### Entrada:

Considerando a tabela `Products` com os seguintes dados:

| product_id  | low_fats | recyclable |
|-------------|----------|------------|
| 0           | Y        | N          |
| 1           | Y        | Y          |
| 2           | N        | Y          |
| 3           | Y        | Y          |
| 4           | N        | N          |

### Saída Esperada:

A saída deve ser uma tabela contendo os IDs dos produtos que são tanto baixos em gordura quanto recicláveis:

| product_id  |
|-------------|
| 1           |
| 3           |

### Explicação:

- **Produto 1** e **Produto 3** são tanto baixos em gordura (`low_fats = 'Y'`) quanto recicláveis (`recyclable = 'Y'`).
- Os outros produtos não atendem a ambos os critérios simultaneamente e, portanto, não são incluídos na saída.
