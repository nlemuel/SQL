-- Ex2. Faça uma query que apresente o tamanho médio,
-- máximo e mínimo do nome do objeto por categoria

SELECT 
       product_category_name,
       AVG(product_name_lenght) AS AVG_NAME,
       MAX(product_name_lenght) AS MAX_NAME,
       MIN(product_name_lenght) AS MIN_NAME

FROM TB_PRODUCTS

WHERE product_category_name IS NOT NULL

GROUP BY product_category_name  