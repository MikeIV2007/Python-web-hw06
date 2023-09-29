--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT s.fullname AS Students, ROUND(AVG(g.grade), 2) as avg_grade
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
GROUP BY s.fullname
ORDER BY avg_grade DESC
LIMIT 5;

--Знайти студента із найвищим середнім балом з певного предмета.
SELECT s.fullname AS Student, d.name AS Discipline, ROUND(AVG(g.grade), 2) as avg_grade
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN disciplines d ON d.id  = g.discipline_id  
WHERE d.id  = 2
GROUP BY s.fullname 
ORDER BY avg_grade DESC
LIMIT 1; 

--Знайти середній бал у групах з певного предмета.
SELECT d.name AS Disciplines, gr.name AS Groups, ROUND(AVG(g.grade), 2) as avg_grade
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN disciplines d ON d.id  = g.discipline_id 
LEFT JOIN [groups] gr ON gr.id  = s.group_id 
WHERE d.id  = 7
GROUP BY gr.name, d.name
ORDER BY avg_grade DESC;

--Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT ROUND(AVG(g.grade), 2) as avg_grade
FROM grades g 

--Знайти які курси читає певний викладач.
SELECT  d.name AS Discipline_name, t.fullname AS Teacher_name
FROM disciplines d
JOIN teachers t  ON t.id  = d.teacher_id 
WHERE t.id  = 5
ORDER BY d.name;

--Знайти список студентів у певній групі.
SELECT s.fullname  AS Students, gr.name  AS Group_name
FROM students s  
LEFT JOIN [groups] gr ON gr.id  = s.group_id 
WHERE gr.id = 3
ORDER BY s.fullname;

--Знайти оцінки студентів у окремій групі з певного предмета.
SELECT s.fullname  AS Students, gr.name AS Group_name, d.name AS Discipline, g.grade 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN disciplines d ON d.id  = g.discipline_id 
LEFT JOIN [groups] gr ON gr.id  = s.group_id 
WHERE d.id  = 6 AND gr.id = 3
GROUP BY s.fullname 
ORDER BY s.fullname;

--Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT t.fullname  AS Teacher, d.name AS Discipline, ROUND(AVG(g.grade), 2) as avg_grade 
FROM grades g 
LEFT JOIN disciplines d ON d.id  = g.discipline_id  
LEFT JOIN teachers t ON t.id = d.teacher_id
WHERE d.teacher_id = 4
GROUP BY g.discipline_id
ORDER BY d.name;

--Знайти список курсів, які відвідує студент.
SELECT d.name AS Discipline, s.fullname  AS Student
FROM disciplines d
LEFT JOIN grades g  ON g.discipline_id  = d.id 
LEFT JOIN students s ON s.id = g.student_id 
WHERE s.id  = 6 
GROUP BY d.name
ORDER BY d.name;

--Список курсів, які певному студенту читає певний викладач.
SELECT d.name AS Discipline, s.fullname AS Students, t.fullname AS Teacher 
FROM disciplines d
LEFT JOIN grades g  ON g.discipline_id  = d.id 
LEFT JOIN students s ON s.id = g.student_id
LEFT JOIN teachers t ON t.id = d.teacher_id 
WHERE s.id  = 45
GROUP BY d.name
ORDER BY d.name;

--extra
--Середній бал, який певний викладач ставить певному студентові.
SELECT t.fullname  AS Teacher, s.fullname AS Students, d.name AS Discipline, ROUND(AVG(g.grade), 2) as avg_grade 
FROM grades g 
LEFT JOIN disciplines d ON d.id  = g.discipline_id  
LEFT JOIN teachers t ON t.id = d.teacher_id
LEFT JOIN students s  ON s.id = g.student_id 
WHERE d.teacher_id = 2 AND s.id = 30
GROUP BY g.discipline_id
ORDER BY d.name;

--Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT s.fullname  AS Students, gr.name AS Group_name, d.name AS Discipline, g.grade 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN disciplines d ON d.id  = g.discipline_id 
LEFT JOIN [groups] gr ON gr.id  = s.group_id 
WHERE (d.id  = 4 AND gr.id = 2) AND g.date_of = "2024-06-19"
GROUP BY s.fullname 
ORDER BY s.fullname;

