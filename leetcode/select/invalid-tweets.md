# 1683. Invalid Tweets

## Tabela: Tweets

A tabela `Tweets` contém informações sobre os tweets em um aplicativo de mídia social. A estrutura da tabela é a seguinte:

| Column Name | Type    | Descrição                               |
|-------------|---------|-----------------------------------------|
| tweet_id    | int     | ID do tweet                             |
| content     | varchar | Conteúdo do tweet                       |

### Observações:

- **Chave Primária:** `tweet_id` é a chave primária, garantindo que os IDs dos tweets sejam únicos.
- **Interpretação das Linhas:** Cada linha desta tabela representa um tweet, identificado por seu `tweet_id`, e contém o texto do tweet no campo `content`.

## Definição de Tweet Inválido

Um tweet é considerado inválido se o número de caracteres utilizados no conteúdo (`content`) do tweet for estritamente maior que 15.

## Objetivo

Escrever uma solução para encontrar os IDs dos tweets inválidos.

### Requisitos:

- A tabela de resultados pode ser retornada em qualquer ordem.

## Exemplo

### Entrada:

Considerando a tabela `Tweets` com os seguintes dados:

| tweet_id | content                          |
|----------|----------------------------------|
| 1        | Vote for Biden                   |
| 2        | Let us make America great again! |

### Saída Esperada:

A saída deve ser uma tabela contendo os IDs dos tweets que são inválidos:

| tweet_id |
|----------|
| 2        |

### Explicação:

- **Tweet 1** tem um comprimento de 14 caracteres, portanto, é um tweet válido.
- **Tweet 2** tem um comprimento de 32 caracteres, excedendo o limite de 15 caracteres, portanto, é um tweet inválido.
