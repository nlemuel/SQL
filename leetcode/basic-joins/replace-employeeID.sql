SELECT a.unique_id AS unique_id,
       b.name AS name 
FROM Employees b 
LEFT JOIN EmployeeUNI a 
ON b.id = a.id