### Sintaxe Fundamental

1. **SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY**:
   - **SELECT**: Utilizado para escolher as colunas que deseja visualizar.
   - **FROM**: Especifica a tabela de onde os dados serão retirados.
   - **WHERE**: A cláusula WHERE é usada para filtrar linhas com base em condições específicas antes de qualquer agrupamento de dados. Ela é aplicada às linhas da tabela, e é usada para selecionar apenas as linhas que atendem a uma condição específica.
***Quando usar***: Utilize WHERE quando precisar filtrar dados brutos antes de qualquer agregação, ou seja, antes de qualquer operação de agrupamento com GROUP BY.
Exemplo:

```sql
SELECT coluna1, coluna2
FROM tabela
WHERE coluna1 = 'valor';
```
Nesse exemplo, o WHERE filtra as linhas da tabela para incluir apenas aquelas onde coluna1 é igual a 'valor'.
   - **GROUP BY**: Agrupa linhas que têm valores em comum em colunas específicas.
   - **HAVING**: A cláusula HAVING é usada para filtrar grupos de dados depois que uma agregação foi aplicada. Ela é semelhante ao WHERE, mas é usada para filtrar os resultados de uma operação de GROUP BY com base em condições aplicadas aos resultados de funções de agregação.
***Quando usar***: Utilize HAVING para filtrar resultados após uma agregação, especialmente quando a condição se refere a uma função agregada, como COUNT(), SUM(), AVG(), etc.
Exemplo:

```sql
Copiar código
SELECT coluna1, COUNT(*)
FROM tabela
GROUP BY coluna1
HAVING COUNT(*) > 5;
```

Neste exemplo, o HAVING filtra os grupos de linhas que foram agrupados por coluna1, incluindo apenas aqueles onde o número de linhas (COUNT(*)) é maior que 5.
   - **ORDER BY**: Ordena o resultado por uma ou mais colunas.

   ```sql
   SELECT coluna1, coluna2
   FROM tabela
   WHERE condição
   GROUP BY coluna1
   HAVING condição
   ORDER BY coluna1 ASC/DESC;
   ```

### Tipos de Joins e Aplicações

1. **INNER JOIN**: Retorna apenas as linhas onde há uma correspondência em ambas as tabelas.
   ```sql
   SELECT *
   FROM tabela1
   INNER JOIN tabela2 ON tabela1.coluna = tabela2.coluna;
   ```

2. **LEFT JOIN (ou LEFT OUTER JOIN)**: Retorna todas as linhas da tabela da esquerda e as correspondentes da tabela da direita. Se não houver correspondência, NULL é retornado para as colunas da tabela da direita.
   ```sql
   SELECT *
   FROM tabela1
   LEFT JOIN tabela2 ON tabela1.coluna = tabela2.coluna;
   ```

3. **RIGHT JOIN (ou RIGHT OUTER JOIN)**: Semelhante ao LEFT JOIN, mas retorna todas as linhas da tabela da direita.
   ```sql
   SELECT *
   FROM tabela1
   RIGHT JOIN tabela2 ON tabela1.coluna = tabela2.coluna;
   ```

4. **FULL OUTER JOIN**: Retorna todas as linhas quando há correspondência em uma das tabelas.
   ```sql
   SELECT *
   FROM tabela1
   FULL OUTER JOIN tabela2 ON tabela1.coluna = tabela2.coluna;
   ```

5. **CROSS JOIN**: Retorna o produto cartesiano das tabelas. Todas as combinações possíveis são retornadas.
   ```sql
   SELECT *
   FROM tabela1
   CROSS JOIN tabela2;
   ```

### Funções de Agregação

1. **COUNT**: Conta o número de linhas.
   ```sql
   SELECT COUNT(*)
   FROM tabela;
   ```

2. **SUM**: Soma os valores de uma coluna.
   ```sql
   SELECT SUM(coluna)
   FROM tabela;
   ```

3. **MIN**: Retorna o menor valor de uma coluna.
   ```sql
   SELECT MIN(coluna)
   FROM tabela;
   ```

4. **MAX**: Retorna o maior valor de uma coluna.
   ```sql
   SELECT MAX(coluna)
   FROM tabela;
   ```

5. **AVG**: Calcula a média dos valores de uma coluna.
   ```sql
   SELECT AVG(coluna)
   FROM tabela;
   ```

### CASE, COALESCE

1. **CASE**: Estrutura condicional para retornar valores diferentes com base em condições.
   ```sql
   SELECT 
   CASE 
      WHEN condição1 THEN resultado1
      WHEN condição2 THEN resultado2
      ELSE resultado3
   END
   FROM tabela;
   ```

2. **COALESCE**: Retorna o primeiro valor não nulo em uma lista de argumentos.
   ```sql
   SELECT COALESCE(coluna1, 'valor padrão')
   FROM tabela;
   ```

### Subqueries

- **Subqueries**: Consultas dentro de outras consultas. Podem ser usadas em SELECT, FROM, WHERE, etc.
  ```sql
  SELECT *
  FROM tabela
  WHERE coluna IN (SELECT coluna FROM outra_tabela WHERE condição);
  ```

### Window Functions

- As **window functions** são funções que operam sobre um conjunto de linhas relacionadas e retornam um valor para cada linha. Ao contrário das funções de agregação normais, as window functions não agrupam os resultados em uma única linha; elas mantêm as linhas individuais enquanto executam cálculos que podem depender de outras linhas.

Aqui estão algumas das principais window functions e o que elas fazem:

### 1. `ROW_NUMBER()`
Atribui um número sequencial único a cada linha dentro da partição de um conjunto de resultados, começando em 1.

**Uso Comum**: Enumerar linhas em uma tabela ou partição.

**Exemplo**:
```sql
SELECT coluna,
       ROW_NUMBER() OVER (PARTITION BY categoria ORDER BY data) AS num_linha
FROM tabela;
```

### 2. `RANK()`
Atribui uma classificação às linhas dentro da partição de um conjunto de resultados. Linhas com valores iguais na coluna de ordenação recebem o mesmo `RANK()`, mas a classificação seguinte será o valor esperado da sequência, causando "lacunas" nos números de classificação.

**Uso Comum**: Classificar linhas com empates.

**Exemplo**:
```sql
SELECT coluna,
       RANK() OVER (PARTITION BY categoria ORDER BY pontuacao DESC) AS rank
FROM tabela;
```

### 3. `DENSE_RANK()`
Similar ao `RANK()`, mas sem criar lacunas na sequência de classificação. Linhas com valores iguais recebem o mesmo `DENSE_RANK()`, mas o próximo número de classificação é incrementado em 1.

**Uso Comum**: Classificar linhas com empates, sem lacunas na classificação.

**Exemplo**:
```sql
SELECT coluna,
       DENSE_RANK() OVER (PARTITION BY categoria ORDER BY pontuacao DESC) AS dense_rank
FROM tabela;
```

### 4. `NTILE(n)`
Distribui as linhas dentro de uma partição em um número específico de grupos, definidos pelo argumento `n`. Cada grupo recebe um número de grupo de 1 a `n`.

**Uso Comum**: Dividir dados em quartis, decis, ou outro número de grupos iguais.

**Exemplo**:
```sql
SELECT coluna,
       NTILE(4) OVER (ORDER BY pontuacao) AS quartil
FROM tabela;
```

### 5. `LAG()`
Permite acessar o valor de uma linha anterior à linha atual, dentro da mesma partição. Isso é útil para calcular a diferença entre linhas consecutivas.

**Uso Comum**: Comparar valores de uma linha com a linha anterior.

**Exemplo**:
```sql
SELECT coluna,
       LAG(coluna_valor, 1) OVER (ORDER BY data) AS valor_anterior
FROM tabela;
```

### 6. `LEAD()`
Funciona de maneira oposta ao `LAG()`. Ele acessa o valor de uma linha posterior à linha atual, dentro da mesma partição.

**Uso Comum**: Comparar valores de uma linha com a linha seguinte.

**Exemplo**:
```sql
SELECT coluna,
       LEAD(coluna_valor, 1) OVER (ORDER BY data) AS valor_proximo
FROM tabela;
```

### 7. `FIRST_VALUE()`
Retorna o valor da primeira linha de uma janela de partição.

**Uso Comum**: Recuperar o valor inicial de uma partição.

**Exemplo**:
```sql
SELECT coluna,
       FIRST_VALUE(coluna_valor) OVER (PARTITION BY categoria ORDER BY data) AS primeiro_valor
FROM tabela;
```

### 8. `LAST_VALUE()`
Retorna o valor da última linha de uma janela de partição.

**Uso Comum**: Recuperar o valor final de uma partição.

**Exemplo**:
```sql
SELECT coluna,
       LAST_VALUE(coluna_valor) OVER (PARTITION BY categoria ORDER BY data) AS ultimo_valor
FROM tabela;
```

### 9. `CUME_DIST()`
Calcula a distribuição acumulada de uma linha dentro de uma partição. É a proporção de linhas com valores menores ou iguais ao valor da linha atual.

**Uso Comum**: Analisar a distribuição acumulada dos dados.

**Exemplo**:
```sql
SELECT coluna,
       CUME_DIST() OVER (PARTITION BY categoria ORDER BY pontuacao DESC) AS cumulativo
FROM tabela;
```

### 10. `PERCENT_RANK()`
Calcula o percentual de ranking de uma linha em relação ao total de linhas na partição. É semelhante ao `RANK()`, mas retorna um valor entre 0 e 1.

**Uso Comum**: Avaliar a posição percentual de uma linha em uma partição.

**Exemplo**:
```sql
SELECT coluna,
       PERCENT_RANK() OVER (PARTITION BY categoria ORDER BY pontuacao DESC) AS percent_rank
FROM tabela;
```

As window functions são particularmente úteis para análises que exigem a comparação de linhas de dados dentro de um conjunto, como cálculos de diferenças, classificação e percentuais acumulados.

### Common Table Expressions (CTE)

- **CTE**: Subquery temporária nomeada que pode ser referenciada dentro de uma consulta.
  ```sql
  WITH CTE_Nome AS (
     SELECT coluna
     FROM tabela
     WHERE condição
  )
  SELECT *
  FROM CTE_Nome;
  ```

### Manipulação de Data e Timestamp

1. **Extração de partes de data**:
   ```sql
   SELECT EXTRACT(YEAR FROM data_coluna) AS ano
   FROM tabela;
   ```

2. **Formatação de data**:
   ```sql
   SELECT TO_CHAR(data_coluna, 'DD-MM-YYYY') AS data_formatada
   FROM tabela;
   ```

3. **Diferença entre datas**:
   ```sql
   SELECT data_fim - data_inicio AS diferenca
   FROM tabela;
   ```
