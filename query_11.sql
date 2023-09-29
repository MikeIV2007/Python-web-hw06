--Середній бал, який певний викладач ставить певному студентові.
SELECT t.fullname  AS Teacher, s.fullname AS Students, d.name AS Discipline, ROUND(AVG(g.grade), 2) as avg_grade 
FROM grades g 
LEFT JOIN disciplines d ON d.id  = g.discipline_id  
LEFT JOIN teachers t ON t.id = d.teacher_id
LEFT JOIN students s  ON s.id = g.student_id 
WHERE d.teacher_id = 2 AND s.id = 30
GROUP BY g.discipline_id
ORDER BY d.name;