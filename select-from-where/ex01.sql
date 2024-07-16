-- Ex1: Quantos produtos temos da categoria 'artes'?

-- contagem 

SELECT 
      COUNT(*) AS qtde_linhas,
      COUNT(product_id) AS qtde_produtos,
      COUNT(DISTINCT product_id) AS qtde_produtos_distintos,
      COUNT(DISTINCT product_category_name) AS qtde_categorias_distintas

FROM tb_products

WHERE product_category_name = 'artes'