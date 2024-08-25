-- lista das categorias por ordem alfabética

SELECT 
        DISTINCT CASE WHEN product_category_name IS NULL 'outros'
                      
                      ELSE product_category_name
                 END AS categoria_fillna

FROM tb_products

ORDER BY categoria_fillna