// VIEW FOR Q1 and Q2
CREATE or REPLACE VIEW all_lessons AS 
SELECT 
E.lessontype as Ensamble ,I.lessontype as Individual ,G.lessontype as Groups, L.date
FROM 
Lesson as L
FULL OUTER JOIN Ensamble AS E
ON E.lessontype = L.lessontype
FULL OUTER JOIN Individual as I
ON I.lessontype = L.lessontype
FULL OUTER JOIN Groups as G
ON G.lessontype = L.lessontype;

//MATERIALIZED VIEW Q3
CREATE MATERIALIZED VIEW lessons_for_instructor AS
(SELECT lesson.instructorid ,person.name, lesson.date
FROM 
Lesson 
INNER JOIN Instructor 
ON lesson.instructorid = instructor.instructorid 
INNER JOIN Person on person.personid = instructor.personid
GROUP BY lesson.instructorid, person.name, lesson.date)
WITH DATA; 

//QUERY 1
(SELECT COUNT(*) AS TOTAL_LESSON_MONTH, DATE_TRUNC('month',L.date) AS Date, 
COUNT(L.Ensamble),
COUNT(L.Individual),
COUNT(L.Groups)
FROM 
(SELECT 
* 
FROM 
all_lessons
) as L
WHERE EXTRACT(YEAR FROM L.date) = 2021
GROUP BY DATE_TRUNC('month',L.date));


//QUERY 2 DONE
(SELECT CAST(COUNT(*) AS DOUBLE PRECISION)/12 AS Avg_Lesson_per_Month,
CAST(COUNT(L.Ensamble) AS DOUBLE PRECISION)/12 AS Ensamble,
CAST(COUNT(L.Individual) AS DOUBLE PRECISION)/12 AS Individual,
CAST(COUNT(L.Groups) AS DOUBLE PRECISION)/12 AS groups
FROM 
(SELECT 
* 
FROM 
all_lessons
) as L
WHERE EXTRACT(YEAR FROM L.date) = 2021);


//QUERY 3 DONE;
//List all instructors who has given more than a specific number of lessons during the current month. Sum all lessons, independent of type, and sort the result by the number of given lessons. This query will be used to find instructors risking to work too much, and will be executed daily.
SELECT COUNT(*),L.name 
FROM 
(SELECT * FROM lessons_for_instructor) as L
WHERE L.date < now() AND EXTRACT(MONTH FROM now()) = EXTRACT(MONTH FROM L.date)  
GROUP BY L.instructorid, L.name 
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) DESC;


//QUERY 4 DONE;
(SELECT (ensamble.maximum - COUNT(*)) AS SeatsLeft, lesson.lessonid
FROM StudentsInLesson 
INNER JOIN Lesson 
ON studentsinlesson.lessonid = lesson.lessonid 
INNER JOIN Ensamble 
ON ensamble.lessontype = lesson.lessontype
WHERE lesson.date < (select date_trunc('week', current_date + 7))
AND lesson.date > (select date_trunc('week', current_date))
GROUP BY studentsinlesson.lessonid, ensamble.maximum, lesson.lessonid
HAVING COUNT(*) < ensamble.maximum);


/*
QUERY 1 OLD
(SELECT COUNT(*) AS TOTAL_LESSON_MONTH, DATE_TRUNC('month',lesson.date) AS Date, 
COUNT(ensamble.lessontype) AS Ensamble,
COUNT(individual.lessontype) AS Individual,
COUNT(groups.lessontype) AS groups
FROM 
Lesson 
FULL OUTER JOIN Ensamble
ON ensamble.lessontype = lesson.lessontype
FULL OUTER JOIN Individual
ON individual.lessontype = lesson.lessontype
FULL OUTER JOIN Groups
ON groups.lessontype = lesson.lessontype
WHERE EXTRACT(YEAR FROM lesson.date) = 2021
GROUP BY DATE_TRUNC('month',lesson.date));


QUERY 2 OLD
(SELECT CAST(COUNT(*) AS DOUBLE PRECISION)/12 AS TOTAL_LESSON_MONTH, DATE_TRUNC('month',lesson.date), 
CAST(COUNT(ensamble.lessontype) AS DOUBLE PRECISION)/12 AS Ensamble,
CAST(COUNT(individual.lessontype) AS DOUBLE PRECISION)/12 AS Individual,
CAST(COUNT(groups.lessontype) AS DOUBLE PRECISION)/12 AS groups
FROM 
Lesson 
FULL OUTER JOIN Ensamble
ON ensamble.lessontype = lesson.lessontype
FULL OUTER JOIN Individual
ON individual.lessontype = lesson.lessontype
FULL OUTER JOIN Groups
ON groups.lessontype = lesson.lessontype
WHERE EXTRACT(YEAR FROM lesson.date) = 2021
GROUP BY DATE_TRUNC('month',lesson.date));


QUERY 2 NEW OLD 

(SELECT CAST(COUNT(*) AS DOUBLE PRECISION)/12 AS Avg_Lesson_per_Month, 
CAST(COUNT(ensamble.lessontype) AS DOUBLE PRECISION)/12 AS Ensamble,
CAST(COUNT(individual.lessontype) AS DOUBLE PRECISION)/12 AS Individual,
CAST(COUNT(groups.lessontype) AS DOUBLE PRECISION)/12 AS groups
FROM 
Lesson 
FULL OUTER JOIN Ensamble
ON ensamble.lessontype = lesson.lessontype
FULL OUTER JOIN Individual
ON individual.lessontype = lesson.lessontype
FULL OUTER JOIN Groups
ON groups.lessontype = lesson.lessontype);


QUERY 3 OLD 

SELECT COUNT(*),person.name 
FROM 
Lesson 
INNER JOIN Instructor 
ON lesson.instructorid = instructor.instructorid 
INNER JOIN Person on person.personid = instructor.personid 
WHERE lesson.date < now() AND EXTRACT(MONTH FROM now()) = EXTRACT(MONTH FROM lesson.date)  
GROUP BY lesson.instructorid, person.name 
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) DESC;
*/