--Знайти які курси читає певний викладач.
SELECT  d.name AS Discipline_name, t.fullname AS Teacher_name
FROM disciplines d
JOIN teachers t  ON t.id  = d.teacher_id 
WHERE t.id  = 5
ORDER BY d.name;