
//QUERY 1
(SELECT COUNT(*) AS TOTAL_LESSON_MONTH, DATE_TRUNC('month',lesson.date), 
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

//QUERY 2 DONE
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

//QUERY 3 DONE;
List all instructors who has given more than a specific number of lessons during the current month. Sum all lessons, independent of type, and sort the result by the number of given lessons. This query will be used to find instructors risking to work too much, and will be executed daily.
SELECT COUNT(*),person.name 
FROM 
Lesson 
INNER JOIN Instructor 
ON lesson.instructorid = instructor.instructorid 
INNER JOIN Person on person.personid = instructor.personid 
WHERE lesson.date < now() AND EXTRACT(MONTH FROM now()) = EXTRACT(MONTH FROM lesson.date)  
GROUP BY lesson.instructorid, person.name HAVING COUNT(*) >= 2
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
