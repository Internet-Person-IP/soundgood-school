CREATE TABLE Instrument (
 InstrumentID SERIAL NOT NULL PRIMARY KEY,
 Name CHAR(50)
);


CREATE TABLE InstrumentForRent (
 InstrumentRentID SERIAL NOT NULL,
 InstrumentID SERIAL NOT NULL,
 Brand CHAR(50),
 Quantities INT,
 Price DOUBLE PRECISION,

 PRIMARY KEY (InstrumentRentID,InstrumentID),

 FOREIGN KEY (InstrumentID) REFERENCES Instrument (InstrumentID)
);


CREATE TABLE InstrumentLevel (
 InstrumentLevel SERIAL NOT NULL PRIMARY KEY,
 Level CHAR(50),
 InstrumentID SERIAL,

 FOREIGN KEY (InstrumentID) REFERENCES Instrument (InstrumentID)
);


CREATE TABLE LessonPrice (
 PriceID SERIAL NOT NULL PRIMARY KEY,
 Price DOUBLE PRECISION NOT NULL
);


CREATE TABLE LessonType (
 LessonType SERIAL NOT NULL PRIMARY KEY,
 Price INT
);


CREATE TABLE Person (
 PersonID SERIAL NOT NULL PRIMARY KEY,
 PersonNumber VARCHAR(12),
 Name VARCHAR(500),
 Age INT,
 PhoneNumber CHAR(12),
 EmailAdress CHAR(100)
);


CREATE TABLE Sibling (
 SiblingRelation SERIAL NOT NULL PRIMARY KEY
);


CREATE TABLE Student (
 PersonID SERIAL NOT NULL,
 StudentID SERIAL NOT NULL,
 SiblingRelation SERIAL,

 PRIMARY KEY (PersonID,StudentID),

 FOREIGN KEY (PersonID) REFERENCES Person (PersonID),
 FOREIGN KEY (SiblingRelation) REFERENCES Sibling (SiblingRelation)
);


CREATE TABLE StudentInstrumentsSkill (
 PersonID SERIAL NOT NULL,
 StudentID SERIAL NOT NULL,
 InstrumentLevel SERIAL,

 PRIMARY KEY (PersonID,StudentID),

 FOREIGN KEY (PersonID,StudentID) REFERENCES Student (PersonID,StudentID),
 FOREIGN KEY (InstrumentLevel) REFERENCES InstrumentLevel (InstrumentLevel)
);


CREATE TABLE Adress (
 PersonID SERIAL NOT NULL PRIMARY KEY,
 Zip CHAR(10),
 StreetName CHAR(100),
 City CHAR(50),

 FOREIGN KEY (PersonID) REFERENCES Person (PersonID)
);


CREATE TABLE Ensamble (
 Genre CHAR(500),
 Maximum INT,
 Minimum INT,
 LessonType SERIAL,

 FOREIGN KEY (LessonType) REFERENCES LessonType (LessonType)
);


CREATE TABLE Groups (
 Maximum INT,
 Minimum INT,
 LessonType SERIAL,
 InstrumentLevel SERIAL,

 FOREIGN KEY (LessonType) REFERENCES LessonType (LessonType),
 FOREIGN KEY (InstrumentLevel) REFERENCES InstrumentLevel (InstrumentLevel)
);


CREATE TABLE Individual (
 LessonType SERIAL,
 InstrumentLevel SERIAL,

 FOREIGN KEY (LessonType) REFERENCES LessonType (LessonType),
 FOREIGN KEY (InstrumentLevel) REFERENCES InstrumentLevel (InstrumentLevel)
);


CREATE TABLE Instructor (
 PersonID SERIAL NOT NULL,
 InstructorID SERIAL NOT NULL,

 PRIMARY KEY (PersonID,InstructorID),

 FOREIGN KEY (PersonID) REFERENCES Person (PersonID)
);


CREATE TABLE InstructorAvaliability (
 PersonID SERIAL NOT NULL,
 InstructorID SERIAL NOT NULL,
 Time DATE,

 PRIMARY KEY (PersonID,InstructorID),

 FOREIGN KEY (PersonID,InstructorID) REFERENCES Instructor (PersonID,InstructorID)
);


CREATE TABLE InstructorInstruments (
 InstrumentID SERIAL NOT NULL,
 PersonID SERIAL NOT NULL,
 InstructorID SERIAL NOT NULL,

 PRIMARY KEY (InstrumentID,PersonID,InstructorID),

 FOREIGN KEY (InstrumentID) REFERENCES Instrument (InstrumentID),
 FOREIGN KEY (PersonID,InstructorID) REFERENCES Instructor (PersonID,InstructorID)
);


CREATE TABLE InstructorPayment (
 InstructorPaymentID SERIAL NOT NULL,
 PersonID SERIAL NOT NULL,
 InstructorID SERIAL NOT NULL,
 Month CHAR(10),
 Year CHAR(10),
 Amount DOUBLE PRECISION,

 PRIMARY KEY (InstructorPaymentID,PersonID,InstructorID),

 FOREIGN KEY (PersonID,InstructorID) REFERENCES Instructor (PersonID,InstructorID)
);


CREATE TABLE InstrumentCurrentlyRenting (
 PersonID SERIAL NOT NULL,
 StudentID SERIAL NOT NULL,
 InstrumentRentID SERIAL NOT NULL,
 InstrumentID SERIAL NOT NULL,
 DateRented DATE,
 RentTerminated BOOLEAN,

 PRIMARY KEY (PersonID,StudentID,InstrumentRentID,InstrumentID),

 FOREIGN KEY (PersonID,StudentID) REFERENCES Student (PersonID,StudentID),
 FOREIGN KEY (InstrumentRentID,InstrumentID) REFERENCES InstrumentForRent (InstrumentRentID,InstrumentID)
);


CREATE TABLE Lesson (
 LessonID SERIAL NOT NULL,
 LessonType SERIAL NOT NULL,
 Date DATE,
 Place CHAR(50),
 PersonID SERIAL,
 InstructorID SERIAL,

 PRIMARY KEY (LessonID,LessonType),

 FOREIGN KEY (LessonType) REFERENCES LessonType (LessonType),
 FOREIGN KEY (PersonID,InstructorID) REFERENCES Instructor (PersonID,InstructorID)
);


CREATE TABLE StudentFeePerLesson (
 LessonPriceID SERIAL NOT NULL,
 PersonID SERIAL NOT NULL,
 StudentID SERIAL NOT NULL,
 LessonID SERIAL NOT NULL,
 LessonType SERIAL NOT NULL,

 PRIMARY KEY (LessonPriceID,PersonID,StudentID,LessonID,LessonType),

 FOREIGN KEY (PersonID,StudentID) REFERENCES Student (PersonID,StudentID),
 FOREIGN KEY (LessonID,LessonType) REFERENCES Lesson (LessonID,LessonType)
);


CREATE TABLE StudentsInLesson (
 PersonID SERIAL NOT NULL,
 StudentID SERIAL NOT NULL,
 LessonID SERIAL NOT NULL,
 LessonType SERIAL NOT NULL,

 PRIMARY KEY (PersonID,StudentID,LessonID,LessonType),

 FOREIGN KEY (PersonID,StudentID) REFERENCES Student (PersonID,StudentID),
 FOREIGN KEY (LessonID,LessonType) REFERENCES Lesson (LessonID,LessonType)
);


