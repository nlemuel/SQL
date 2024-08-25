# 1661. Average Time of Process per Machine

## Tabela: Activity

A tabela `Activity` contém informações sobre as atividades dos usuários em um site de fábrica. A estrutura da tabela é a seguinte:

| Column Name    | Type    | Descrição                                                                 |
|----------------|---------|---------------------------------------------------------------------------|
| machine_id     | int     | ID da máquina                                                             |
| process_id     | int     | ID do processo executado na máquina                                        |
| activity_type  | enum    | Tipo de atividade: 'start' para início e 'end' para término                |
| timestamp      | float   | Momento em que a atividade ocorreu, em segundos                           |

### Observações:

- **Chave Primária:** A combinação de `(machine_id, process_id, activity_type)` é a chave primária, garantindo que cada registro seja único.
- **Interpretação das Linhas:** Cada linha desta tabela representa uma atividade (início ou término) de um processo em uma máquina específica, com um timestamp associado.

## Objetivo

Escrever uma solução para encontrar o tempo médio que cada máquina leva para completar um processo.

- O tempo para completar um processo é a diferença entre o timestamp de término (`end`) e o timestamp de início (`start`).
- O tempo médio é calculado dividindo-se o tempo total para completar todos os processos em uma máquina pelo número de processos executados.

### Requisitos:

- A tabela de resultados deve ter `machine_id` e `processing_time`, com o tempo de processamento médio arredondado para três casas decimais.
- A tabela de resultados pode ser retornada em qualquer ordem.

## Exemplo

### Entrada:

Considerando a tabela `Activity` com os seguintes dados:

| machine_id | process_id | activity_type | timestamp |
|------------|------------|---------------|-----------|
| 0          | 0          | start         | 0.712     |
| 0          | 0          | end           | 1.520     |
| 0          | 1          | start         | 3.140     |
| 0          | 1          | end           | 4.120     |
| 1          | 0          | start         | 0.550     |
| 1          | 0          | end           | 1.550     |
| 1          | 1          | start         | 0.430     |
| 1          | 1          | end           | 1.420     |
| 2          | 0          | start         | 4.100     |
| 2          | 0          | end           | 4.512     |
| 2          | 1          | start         | 2.500     |
| 2          | 1          | end           | 5.000     |

### Saída Esperada:

A saída deve ser uma tabela contendo o `machine_id` e o tempo médio de processamento (`processing_time`):

| machine_id | processing_time |
|------------|-----------------|
| 0          | 0.894           |
| 1          | 0.995           |
| 2          | 1.456           |

### Explicação:

- Existem 3 máquinas, cada uma executando 2 processos.
- **Máquina 0:** O tempo médio é calculado como `((1.520 - 0.712) + (4.120 - 3.140)) / 2 = 0.894`.
- **Máquina 1:** O tempo médio é calculado como `((1.550 - 0.550) + (1.420 - 0.430)) / 2 = 0.995`.
- **Máquina 2:** O tempo médio é calculado como `((4.512 - 4.100) + (5.000 - 2.500)) / 2 = 1.456`.

### Solução SQL

A solução SQL para resolver este problema envolve os seguintes passos:

1. Fazer um join da tabela consigo mesma para obter os timestamps de início e término na mesma linha.
2. Calcular a diferença entre os timestamps (`end` - `start`).
3. Agrupar os resultados por `machine_id` e calcular a média das diferenças, arredondando o resultado para três casas decimais.

```sql
SELECT a1.machine_id, 
       ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM Activity a1
JOIN Activity a2
ON a1.process_id = a2.process_id
AND a1.machine_id = a2.machine_id
AND a1.timestamp < a2.timestamp
GROUP BY a1.machine_id;
