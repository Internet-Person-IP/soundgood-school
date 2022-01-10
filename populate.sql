
/*
Person:
{{12345, Doktor Mugg, 48},
{23456, Elon Musk, 34},
{34567, Din Mamma, 85},
{45678, Snusmumriken, 23},
{56789, Spöket Laban, 237},
{67891, Pär Gässle, 64},
{78912, Lilla Bocken Bruse, 11},
{89123, Mellan Bocken Bruse, 17},
{91234, Stora Bocken Bruse, 23}}


DROP DATABASE sound;
CREATE DATABASE sound;
\c sound 
\i School1.sql 
\i populate.sql 
*/

/*All persons*/
INSERT INTO Person (PersonNumber, Name, Age, PhoneNumber, EmailAdress) VALUES ('12345', 'Doktor Mugg', 20, '98340233240', 'drmug@gmail.com');/*Instructor*/
INSERT INTO Person (PersonNumber, Name, Age, PhoneNumber, EmailAdress) VALUES ('23456', 'Elon Musk', 50, '967059687969', 'elon_musk@gmail.com');/*Instructor*/
INSERT INTO Person (PersonNumber, Name, Age, PhoneNumber, EmailAdress) VALUES ('34567', 'Skogsmulle', 25, '96705437969', 'skogsmulle@gmail.com');/*Instructor*/
INSERT INTO Person (PersonNumber, Name, Age, PhoneNumber, EmailAdress) VALUES ('45678', 'Snusmumriken', 23, '967654987969', 'snusmumriken@gmail.com');
INSERT INTO Person (PersonNumber, Name, Age, PhoneNumber, EmailAdress) VALUES ('56789', 'Spöket Laban', 237, '967659687969', 'laban@gmail.com');
INSERT INTO Person (PersonNumber, Name, Age, PhoneNumber, EmailAdress) VALUES ('67891', 'Pär Gessle', 64, '967059643269', 'gessle@gmail.com');
INSERT INTO Person (PersonNumber, Name, Age, PhoneNumber, EmailAdress) VALUES ('78912', 'Lilla Bocken Bruse', 25, '912359687969', 'lille@gmail.com');
INSERT INTO Person (PersonNumber, Name, Age, PhoneNumber, EmailAdress) VALUES ('89123', 'Mellan Bocken Bruse', 25, '966539687969', 'mellan@gmail.com');
INSERT INTO Person (PersonNumber, Name, Age, PhoneNumber, EmailAdress) VALUES ('91234', 'Stora Bocken Bruse', 25, '967076487969', 'stora@gmail.com');


/*
{{12345, 123},
{23456, 234},
{34567, 345}}
*/
/*Creating students and instructors

*/
INSERT INTO Instructor (PersonID) VALUES (1);
INSERT INTO Instructor (PersonID) VALUES (2);
INSERT INTO Instructor (PersonID) VALUES (3);


INSERT INTO Sibling (SiblingRelation) VALUES (0);
INSERT INTO Sibling (SiblingRelation) VALUES (1);

INSERT INTO Student (PersonID, SiblingRelation) VALUES (4,0);
INSERT INTO Student (PersonID, SiblingRelation) VALUES (5,0);
INSERT INTO Student (PersonID, SiblingRelation) VALUES (6,0);
INSERT INTO Student (PersonID, SiblingRelation) VALUES (7,1);
INSERT INTO Student (PersonID, SiblingRelation) VALUES (8,1);
INSERT INTO Student (PersonID, SiblingRelation) VALUES (9,1);




-- //Creating Instuments
INSERT INTO Instrument (Name) VALUES ('Piano');
INSERT INTO Instrument (Name) VALUES ('Kyrkorgel');
INSERT INTO Instrument (Name) VALUES ('Gitarr');
INSERT INTO Instrument (Name) VALUES ('Trummor');
INSERT INTO Instrument (Name) VALUES ('Vuvuzela');

--instrument nivån som finns
INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('beginner', 1);
INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('intermediate', 1);
INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('advanced', 1);

INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('beginner', 2);
INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('intermediate', 2);
INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('advanced', 2);

INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('beginner', 3);
INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('intermediate', 3);
INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('advanced', 3);

INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('beginner', 4);
INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('intermediate', 4);
INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('advanced', 4);

INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('beginner', 5);
INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('intermediate', 5);
INSERT INTO InstrumentLevel (Level, InstrumentID) VALUES ('advanced', 5);


-- //instument instructorn spelar
/*
InstructorInstruments:
{{98765, 12345, 123},
{98765, 23456, 234},
{87654, 12345, 123},
{87654, 23456, 234},
{87654, 34567, 345},
{76543, 34567, 345},
{65432, 12345, 123},
{65432, 23456, 234},
{65432, 34567, 345},
{54321, 12345, 123},
{54321, 34567, 345}}
*/
INSERT INTO InstructorInstruments (InstrumentID, PersonID, InstructorID) VALUES (1,1,1);
INSERT INTO InstructorInstruments (InstrumentID, PersonID, InstructorID) VALUES (2,2,2);
INSERT INTO InstructorInstruments (InstrumentID, PersonID, InstructorID) VALUES (3,3,3);
INSERT INTO InstructorInstruments (InstrumentID, PersonID, InstructorID) VALUES (4,1,1);
INSERT INTO InstructorInstruments (InstrumentID, PersonID, InstructorID) VALUES (5,2,2);
INSERT INTO InstructorInstruments (InstrumentID, PersonID, InstructorID) VALUES (2,3,3);
INSERT INTO InstructorInstruments (InstrumentID, PersonID, InstructorID) VALUES (3,1,1);
INSERT INTO InstructorInstruments (InstrumentID, PersonID, InstructorID) VALUES (4,2,2);
INSERT INTO InstructorInstruments (InstrumentID, PersonID, InstructorID) VALUES (5,3,3);

-- //InstrumentForRent
/*
{{98, 98765, Acme, 1},
{99, 98765, Acne, 5}
{87, 87654, Acme, 3},
{76, 76543, Acme, 5378},
{65, 65432, Acme, 12},
{54, 54321, Acme, 8}}
*/
INSERT INTO InstrumentForRent (InstrumentID, Brand, Quantities, Price) VALUES (1,'Acme', 1, 500); 
INSERT INTO InstrumentForRent (InstrumentID, Brand, Quantities, Price) VALUES (1,'Bcme', 5, 300);
INSERT INTO InstrumentForRent (InstrumentID, Brand, Quantities, Price) VALUES (2,'Bcme', 2, 700);
INSERT INTO InstrumentForRent (InstrumentID, Brand, Quantities, Price) VALUES (3,'Bcme', 5, 150);
INSERT INTO InstrumentForRent (InstrumentID, Brand, Quantities, Price) VALUES (4,'Bcme', 3, 350);
INSERT INTO InstrumentForRent (InstrumentID, Brand, Quantities, Price) VALUES (5,'Acme', 5378, 20);

-- //LessonType med ett pris
INSERT INTO LessonType(Price) VALUES (300); -- 1. Piano Advanced
INSERT INTO LessonType(Price) VALUES (200); -- 2. Piano Beginner
INSERT INTO LessonType(Price) VALUES (300); -- 3. Kyrkorgel beginner
INSERT INTO LessonType(Price) VALUES (100); -- 4. Vuvuzela beginner
INSERT INTO LessonType(Price) VALUES (300); -- 5. Gitarr Intermediate
INSERT INTO LessonType(Price) VALUES (200); -- 6. Gitarr Beginner Group
INSERT INTO LessonType(Price) VALUES (300); -- 7. Trummor Advanced
INSERT INTO LessonType(Price) VALUES (150); -- 8. Ensamble Rock
INSERT INTO LessonType(Price) VALUES (100); -- 9. Ensamble Jazz
INSERT INTO LessonType(Price) VALUES (50); -- 10. Group Vuvuzela beginner

-- insert Individual
INSERT INTO Individual (InstrumentLevel, LessonType) VALUES (3,1);
INSERT INTO Individual (InstrumentLevel, LessonType) VALUES (1,2);
INSERT INTO Individual (InstrumentLevel, LessonType) VALUES (4,3);
INSERT INTO Individual (InstrumentLevel, LessonType) VALUES (13,4);
INSERT INTO Individual (InstrumentLevel, LessonType) VALUES (8,5);
INSERT INTO Individual (InstrumentLevel, LessonType) VALUES (12,7);
-- //insert into esamble
INSERT INTO Ensamble (Genre, Maximum, Minimum, LessonType) VALUES ('Rock', 10,3,8);
INSERT INTO Ensamble (Genre, Maximum, Minimum, LessonType) VALUES ('Jazz', 8,3,9);

-- Insert into group
INSERT INTO Groups (InstrumentLevel, Maximum, Minimum, LessonType) VALUES (13, 11,2,10);
INSERT INTO Groups (InstrumentLevel, Maximum, Minimum, LessonType) VALUES (7, 6,2,6);

-- //Create a lesson 2020
INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (1, 1, '2020-09-12', 'S2',1);

INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (3, 3, '2020-10-01', 'D2',6);
INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (3, 3, '2020-10-01', 'D2',10);

INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (1, 1, '2020-11-01', 'D2',6);
INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (3, 3, '2020-11-03', 'Q2',6);

--lesson 2021
INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (1, 1, '2021-03-02', 'D2',8);
INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (1, 1, '2021-03-08', 'P2',8);
INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (1, 1, '2021-03-12', 'S2',8);

INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (2, 2, '2021-04-01', 'D2',9);
INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (2, 2, '2021-04-06', 'D2',9);
INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (2, 2, '2021-04-05', 'D2',9);
INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (2, 2, '2021-05-15', 'D2',7);
INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (3, 3, '2021-04-06', 'D2',9);
INSERT INTO Lesson (InstructorID, PersonID, Date, Place, LessonType) VALUES (3, 3, '2021-04-10', 'D2',8);
-- Create lessons for 2020

-- //Creating an Instrument for rent
--INSERT INTO InstrumentForRent (Brand, Quantities, InstrumentID, Price) VALUES ('YAMAHA', 10, 1, 50);


-- //Creating InstrumentToRent
--INSERT INTO InstrumentCurrentlyRenting (StudentID, DateRented) VALUES (1, '2019-12-01');

--lesson 1 OK
INSERT INTO StudentsInLesson (PersonID,StudentID, LessonID, LessonType) VALUES (4,1,1,1);
-- lesson 2 OK
INSERT INTO StudentsInLesson (PersonID ,StudentID, LessonID, LessonType) VALUES (5,2,2,6);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (6,3,2,6);
INSERT INTO StudentsInLesson (PersonID,StudentID, LessonID, LessonType) VALUES (7,4,2,6);
--lesson 3 OK
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (8,5,3,10);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (9,6,3,10);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (4,1,3,10);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (5,2,3,10);

--lesson 4
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (8,5,4,6);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (9,6,4,6);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (4,1,4,6);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (5,2,4,6);

--lesson 5
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (8,5,5,6);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (9,6,5,6);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (4,1,5,6);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (5,2,5,6);

--lesson 6 
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (4,1,6,8);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (5,2,6,8);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (6,3,6,8);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (7,4,6,8);

--lesson 7
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (4,1,7,8);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (5,2,7,8);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (6,3,7,8);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (7,4,7,8);

-- lesson 8
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (4,1,8,8);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (5,2,8,8);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (6,3,8,8);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (7,4,8,8);

--lesson 9
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (4,1,9,9);

--lesson 10

INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (4,1,10,9);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (5,2,10,9);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (6,3,10,9);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (7,4,10,9);

--lesson 11
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (4,1,11,9);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (5,2,11,9);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (6,3,11,9);
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (7,4,11,9);

--lesson 12
INSERT INTO StudentsInLesson (PersonID, StudentID, LessonID, LessonType) VALUES (6,3,12,7);


/*
Grupprum

QUERY 1 //Materialized Views
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

QUERY 2 DONE
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


(SELECT *,CAST(NULL as INT),CAST (NULL as INT) FROM Lesson INNER JOIN Individual ON lesson.lessontype=individual.lessontype) 
UNION
(SELECT * FROM Lesson INNER JOIN Groups ON lesson.lessontype=groups.lessontype)
UNION
(SELECT * FROM Lesson INNER JOIN Ensamble ON lesson.lessontype=ensamble.lessontype);


mydate > now() 
YEAR(lesson.date) = YEAR(SELECT GETDATE()) AND MONTH(lesson.date) = MONTH(SELECT GETDATE()) AND DAY(lesson.date) <= DAY(SELECT GETDATE())


QUERY 3 DONE;
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

SELECT * FROM Ensamble JOIN Lesson ON lesson.lessontype = ensamble.lessontype WHERE lesson.date < (select date_trunc('week', current_date + 7)) AND lesson.date > (select date_trunc('week', current_date));

QUERY 4 DONE; SHOULD BE A VIEW
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
*/

/*
Show all relevant InstrumentsForRent
SELECT * FROM InstrumentForRent 
INNER JOIN Instrument ON instrumentforrent.instrumentid = instrument.instrumentid 
WHERE instrument.name = 'Piano';

Show which InstrumentCurrentlyRenting is and who is renting it

SELECT * FROM  InstrumentCurrentlyRenting INNER JOIN Person ON person.personid = intrumentcurrentlyrend 
Insert into
INSERT INTO InstrumentCurrentlyRenting (PersonID, StudentID, InstrumentRentID, InstrumentID) VALUES ()

Terminate the rental that you created


TEST QUERY 3
SELECT COUNT(*),person.name                                                                                               
FROM                                                                
Lesson                                                                  
INNER JOIN Instructor 
ON lesson.instructorid = instructor.instructorid 
INNER JOIN Person on person.personid = instructor.personid 
WHERE lesson.date < now() AND EXTRACT(MONTH FROM CAST('2021-04-01' AS DATE)) = EXTRACT(MONTH FROM lesson.date)  
GROUP BY lesson.instructorid, person.name HAVING COUNT(*) >= 1;


TEST QUERY 4 
SELECT COUNT(*),person.name                                                                                               
FROM                                                                
Lesson                                                                  
INNER JOIN Instructor 
ON lesson.instructorid = instructor.instructorid 
INNER JOIN Person on person.personid = instructor.personid 
WHERE lesson.date < now() AND EXTRACT(MONTH FROM CAST('2021-04-01' AS DATE)) = EXTRACT(MONTH FROM lesson.date)  
GROUP BY lesson.instructorid, person.name HAVING COUNT(*) >= 1;

*/