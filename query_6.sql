--Знайти список студентів у певній групі.
SELECT s.fullname  AS Students, gr.name  AS Group_name
FROM students s  
LEFT JOIN [groups] gr ON gr.id  = s.group_id 
WHERE gr.id = 3
ORDER BY s.fullname;