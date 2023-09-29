--Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT s.fullname  AS Students, gr.name AS Group_name, d.name AS Discipline, g.grade 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN disciplines d ON d.id  = g.discipline_id 
LEFT JOIN [groups] gr ON gr.id  = s.group_id 
WHERE (d.id  = 4 AND gr.id = 2) AND g.date_of = "2024-06-19"
GROUP BY s.fullname 
ORDER BY s.fullname;