# 1148. Article Views I

## Tabela: Views

A tabela `Views` armazena informações sobre as visualizações de artigos. A estrutura da tabela é a seguinte:

| Column Name | Type | Descrição |
|-------------|------|-----------|
| article_id  | int  | ID do artigo visualizado |
| author_id   | int  | ID do autor do artigo |
| viewer_id   | int  | ID da pessoa que visualizou o artigo |
| view_date   | date | Data da visualização do artigo |

### Observações:

- **Chave Primária:** A tabela não possui uma chave primária (coluna com valores únicos), o que significa que a tabela pode conter linhas duplicadas.
- **Interpretação das Linhas:** Cada linha desta tabela indica que um visualizador (`viewer_id`) visualizou um artigo (`article_id`) escrito por um autor (`author_id`) em uma determinada data (`view_date`).
- **Nota Importante:** Se o `author_id` for igual ao `viewer_id`, isso indica que o autor visualizou seu próprio artigo.

## Objetivo

Escrever uma solução para encontrar todos os autores que visualizaram pelo menos um de seus próprios artigos.

### Requisitos:

- A tabela de resultados deve ser ordenada pelo `id` (neste caso, o `author_id`) em ordem crescente.

## Exemplo

### Entrada:

Considerando a tabela `Views` com os seguintes dados:

| article_id | author_id | viewer_id | view_date  |
|------------|-----------|-----------|------------|
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |

### Saída Esperada:

A saída deve ser uma tabela contendo os IDs (`id`) dos autores que visualizaram pelo menos um de seus próprios artigos, ordenada em ordem crescente:

| id  |
|-----|
| 4   |
| 7   |

### Explicação:

- O autor com `author_id = 4` visualizou seus próprios artigos (`viewer_id = 4`).
- O autor com `author_id = 7` também visualizou seus próprios artigos (`viewer_id = 7`).
- Portanto, os IDs 4 e 7 devem ser retornados e listados em ordem crescente.
