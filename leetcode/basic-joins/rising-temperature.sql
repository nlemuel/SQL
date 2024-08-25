WITH HTemp AS (
    SELECT 
        w1.id 
    FROM 
        Weather w1 
    JOIN 
        Weather w2
    ON 
        w1.recordDate = date_add(w2.recordDate, INTERVAL 1 day)
    WHERE 
        w1.temperature > w2.temperature
)
SELECT 
    *
FROM 
    Htemp;