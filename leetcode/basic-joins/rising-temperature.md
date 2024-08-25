# 197. Rising Temperature

## Tabela: Weather

A tabela `Weather` contém informações sobre a temperatura em dias específicos. A estrutura da tabela é a seguinte:

| Column Name | Type    | Descrição                        |
|-------------|---------|----------------------------------|
| id          | int     | ID único da entrada               |
| recordDate   | date    | Data do registro                  |
| temperature  | int     | Temperatura registrada no dia    |

## Objetivo

Encontrar todos os IDs das datas em que a temperatura foi maior do que no dia anterior.

- Retornar a tabela resultante contendo apenas a coluna `id`.
- A tabela resultante pode ser retornada em qualquer ordem.

## Exemplo

### Entrada:

Considerando a tabela `Weather` com os seguintes dados:

| id | recordDate | temperature |
|----|------------|-------------|
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |

### Saída Esperada:

A saída deve conter IDs de dias onde a temperatura foi maior que no dia anterior:

| id |
|----|
| 2  |
| 4  |

### Explicação:

- Em 2015-01-02, a temperatura foi de 25, que é maior que no dia anterior (10 em 2015-01-01).
- Em 2015-01-04, a temperatura foi de 30, que é maior que no dia anterior (20 em 2015-01-03).

## Soluções

### Abordagem 1: Simples Join

Usamos um `JOIN` para comparar cada data com o dia anterior.

```sql
SELECT W1.id
FROM Weather W1
JOIN Weather W2
ON W1.recordDate = DATE_ADD(W2.recordDate, INTERVAL 1 DAY)
WHERE W1.temperature > W2.temperature;
```

#### Explicação:
- **JOIN**: A tabela `Weather` é unida a si mesma (`W1` e `W2`) para comparar o dia atual com o dia anterior.
- **ON**: A condição `W1.recordDate = DATE_ADD(W2.recordDate, INTERVAL 1 DAY)` garante que estamos comparando um dia com o dia seguinte.
- **WHERE**: Filtra os resultados onde a temperatura do dia atual (`W1.temperature`) é maior que a do dia anterior (`W2.temperature`).

### Abordagem 2: Subconsulta

Usamos uma subconsulta para obter a temperatura do dia anterior.

```sql
SELECT id
FROM Weather w1
WHERE temperature > (
    SELECT temperature
    FROM Weather w2
    WHERE w2.recordDate = DATE_SUB(w1.recordDate, INTERVAL 1 DAY)
);
```

#### Explicação:
- **Subconsulta**: Obtém a temperatura do dia anterior usando `DATE_SUB`.
- **WHERE**: Compara a temperatura do dia atual (`w1.temperature`) com a temperatura do dia anterior.

### Abordagem 3: DATEDIFF

Usa a função `DATEDIFF` para calcular a diferença de dias entre as datas.

```sql
SELECT w1.id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1
  AND w1.temperature > w2.temperature;
```

#### Explicação:
- **DATEDIFF**: Calcula a diferença em dias entre as datas. Verifica se a diferença é exatamente 1 dia.
- **WHERE**: Compara a temperatura do dia atual com a do dia anterior.

### Abordagem 4: CTE e LAG

Usa uma CTE e a função `LAG` para calcular a temperatura do dia anterior.

```sql
WITH q1 AS (
  SELECT 
      *,
      LAG(temperature) OVER (ORDER BY recordDate) AS previous_day_temperature,
      LAG(recordDate) OVER (ORDER BY recordDate) AS previous_Date
  FROM Weather
)

SELECT id
FROM q1
WHERE temperature > previous_day_temperature
AND DATEDIFF(recordDate, previous_Date) = 1;
```

#### Explicação:
- **CTE (q1)**: Calcula a temperatura do dia anterior usando `LAG`.
- **SELECT**: Compara a temperatura do dia atual com a do dia anterior e verifica se a diferença entre as datas é exatamente 1 dia.

Essas abordagens garantem que você obtenha todos os IDs onde a temperatura foi maior do que no dia anterior.
```