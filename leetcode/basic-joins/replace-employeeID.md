# 1378. Replace Employee ID With The Unique Identifier

## Tabelas: Employees e EmployeeUNI

### Employees

A tabela `Employees` contém informações sobre os funcionários da empresa, incluindo seus IDs e nomes. A estrutura da tabela é a seguinte:

| Column Name | Type    | Descrição                |
|-------------|---------|--------------------------|
| id          | int     | ID único do funcionário   |
| name        | varchar | Nome do funcionário       |

### EmployeeUNI

A tabela `EmployeeUNI` contém a correspondência entre o `id` do funcionário e um `unique_id` atribuído a ele. A estrutura da tabela é a seguinte:

| Column Name | Type | Descrição                        |
|-------------|------|----------------------------------|
| id          | int  | ID único do funcionário          |
| unique_id   | int  | Identificador único do funcionário |

## Objetivo

Escrever uma solução para mostrar o `unique_id` de cada funcionário. Se um funcionário não tiver um `unique_id`, mostrar `null` em vez disso.

- A tabela de resultados deve conter as colunas `unique_id` e `name` para cada funcionário.
- A tabela de resultados pode ser retornada em qualquer ordem.

## Exemplo

### Entrada:

Considerando as tabelas `Employees` e `EmployeeUNI` com os seguintes dados:

**Tabela `Employees`:**

| id  | name     |
|-----|----------|
| 1   | Alice    |
| 7   | Bob      |
| 11  | Meir     |
| 90  | Winston  |
| 3   | Jonathan |

**Tabela `EmployeeUNI`:**

| id  | unique_id |
|-----|-----------|
| 3   | 1         |
| 11  | 2         |
| 90  | 3         |

### Saída Esperada:

A saída deve ser uma tabela contendo `unique_id` e `name` para cada funcionário:

| unique_id | name     |
|-----------|----------|
| null      | Alice    |
| null      | Bob      |
| 2         | Meir     |
| 3         | Winston  |
| 1         | Jonathan |

### Explicação:

- Alice e Bob não possuem `unique_id`, então mostramos `null` para eles.
- Meir possui `unique_id` igual a 2.
- Winston possui `unique_id` igual a 3.
- Jonathan possui `unique_id` igual a 1.

## Solução SQL

A solução SQL para resolver este problema envolve os seguintes passos:

1. Realizar um `LEFT JOIN` entre as tabelas `Employees` e `EmployeeUNI` com base na coluna `id`.
2. Selecionar as colunas `unique_id` e `name`.

```sql
SELECT 
    euni.unique_id,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI euni
ON e.id = euni.id;
