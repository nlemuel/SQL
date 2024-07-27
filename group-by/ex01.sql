SELECT 
       product_category_name,
       AVG(product_description_lenght) AS AVG_DESCRIPTION,
       MAX(product_description_lenght) AS MAX_DESCRIPTION,
       MIN(product_description_lenght) AS MIN_DESCRIPTION

FROM TB_PRODUCTS

WHERE product_category_name IS NOT NULL

GROUP BY product_category_name