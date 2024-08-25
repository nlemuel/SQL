# 595. Big Countries

## Tabela: World

A tabela `World` contém informações sobre países, incluindo o nome, o continente, a área, a população e o PIB (Produto Interno Bruto). A estrutura da tabela é a seguinte:

| Column Name | Type    | Descrição                          |
|-------------|---------|------------------------------------|
| name        | varchar | Nome do país                       |
| continent   | varchar | Continente ao qual o país pertence |
| area        | int     | Área do país em km²                |
| population  | int     | População do país                  |
| gdp         | bigint  | PIB do país                        |

### Observações:

- **Chave Primária:** `name` é a chave primária, garantindo que os nomes dos países sejam únicos.
- **Interpretação das Linhas:** Cada linha desta tabela fornece informações sobre o nome de um país, o continente ao qual ele pertence, sua área, sua população e o valor do seu PIB.

## Definição de País Grande

Um país é considerado grande se:
- Possui uma área de pelo menos 3 milhões de km² (ou seja, 3.000.000 km²), **ou**
- Possui uma população de pelo menos 25 milhões de habitantes (ou seja, 25.000.000 pessoas).

## Objetivo

Escrever uma solução para encontrar o nome, a população e a área dos países grandes.

### Requisitos:

- A tabela de resultados pode ser retornada em qualquer ordem.

## Exemplo

### Entrada:

Considerando a tabela `World` com os seguintes dados:

| name        | continent | area    | population | gdp          |
|-------------|-----------|---------|------------|--------------|
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |

### Saída Esperada:

A saída deve ser uma tabela contendo o nome, a população e a área dos países que atendem aos critérios de país grande:

| name        | population | area    |
|-------------|------------|---------|
| Afghanistan | 25500100   | 652230  |
| Algeria     | 37100000   | 2381741 |

### Explicação:

- **Afghanistan** é considerado grande devido à sua população, que excede 25 milhões de pessoas.
- **Algeria** é considerado grande tanto pela sua população (37 milhões) quanto pela sua área (2.381.741 km²).
- Os demais países na tabela de exemplo não atendem a nenhum dos critérios de país grande.
