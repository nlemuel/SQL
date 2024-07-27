-- TUDO ISSO AQUI:
SELECT CASE WHEN tel1 IS NOT NULL THEN tel1
            WHEN tel2 IS NOT NULL THEN tel2
            WHEN cel1 IS NOT NULL THEN cel1
            WHEN cel2 IS NOT NULL THEN cel2
            ELSE 0
        END AS telefone,
-- PODE SER TRANSFORMADO EM APENAS UM COALESCE:
        COALESCE(tel1, tel2, cel1, cel2) AS telefone

FROM contatos