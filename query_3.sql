--Знайти середній бал у групах з певного предмета.
SELECT d.name AS Disciplines, gr.name AS Groups, ROUND(AVG(g.grade), 2) as avg_grade
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN disciplines d ON d.id  = g.discipline_id 
LEFT JOIN [groups] gr ON gr.id  = s.group_id 
WHERE d.id  = 7
GROUP BY gr.name, d.name
ORDER BY avg_grade DESC;