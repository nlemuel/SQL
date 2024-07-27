-- lista das categorias por ordem alfabética

SELECT 
        DISTINCT CASE WHEN product_category_name IS null THEN 'outros'
                      -- MAIS PERFORMÁTICO
                      WHEN product_category_name = 'alimentos'
                           OR product_category_name = 'alimentos_bebidas' THEN 'alimentos'
                      -- SEGUNDO EM PERFORMANCE
                      WHEN product_category_name IN ('artes', 'artes_e_artesanato') THEN 'artes'
                      -- PIOR DOS CASOS EM PERFORMANCE,FICA MUITO PESADO
                      WHEN product_category_name LIKE "%artigos%" THEN "artigos"

                      ELSE product_category_name

                 END AS categoria_fillna

FROM tb_products

ORDER BY categoria_fillna