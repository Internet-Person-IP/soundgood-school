CREATE TABLE Instrument (
 InstrumentID SERIAL NOT NULL PRIMARY KEY,
 Name CHAR(10)
);


CREATE TABLE InstrumentForRent (
 InstrumentRentID SERIAL NOT NULL PRIMARY KEY,
 Brand CHAR(50),
 Quantities INT,
 InstrumentID SERIAL,
 Price DOUBLE PRECISION,

 FOREIGN KEY (InstrumentID) REFERENCES Instrument (InstrumentID)
);


CREATE TABLE InstrumentLevel (
 InstrumentLevel SERIAL NOT NULL PRIMARY KEY,
 Level CHAR(10),
 InstrumentID SERIAL,

 FOREIGN KEY (InstrumentID) REFERENCES Instrument (InstrumentID)
);


CREATE TABLE LessonPrice (
 PriceID SERIAL NOT NULL PRIMARY KEY,
 Price DOUBLE PRECISION NOT NULL
);


CREATE TABLE LessonType (
 LessonType SERIAL NOT NULL PRIMARY KEY,
 Price DOUBLE PRECISION NOT NULL
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
 StudentID SERIAL NOT NULL PRIMARY KEY,
 PersonID SERIAL NOT NULL,
 SiblingDiscount BIT(1),
 SiblingRelation CHAR(10),

 FOREIGN KEY (PersonID) REFERENCES Person (PersonID),
 FOREIGN KEY (SiblingRelation) REFERENCES Sibling (SiblingRelation)
);


CREATE TABLE StudentInstrumentsSkill (
 StudentID SERIAL,
 InstrumentLevel SERIAL,

 FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
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
 Genre CHAR(10),
 Maximum CHAR(10),
 Minimum CHAR(10),
 LessonType SERIAL,

 FOREIGN KEY (LessonType) REFERENCES LessonType (LessonType)
);


CREATE TABLE Groups (
 Maximum CHAR(10),
 Minimum CHAR(10),
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
 InstructorID SERIAL NOT NULL PRIMARY KEY,
 PersonID SERIAL,

 FOREIGN KEY (PersonID) REFERENCES Person (PersonID)
);


CREATE TABLE InstructorAvaliability (
 InstructorID SERIAL NOT NULL PRIMARY KEY,
 Time DATE,

 FOREIGN KEY (InstructorID) REFERENCES Instructor (InstructorID)
);


CREATE TABLE InstructorInstruments (
 InstrumentID SERIAL,
 InstructorID SERIAL NOT NULL,

 FOREIGN KEY (InstrumentID) REFERENCES Instrument (InstrumentID),
 FOREIGN KEY (InstructorID) REFERENCES Instructor (InstructorID)
);


CREATE TABLE InstructorPayment (
 InstructorPaymentID SERIAL NOT NULL,
 InstructorID SERIAL NOT NULL,
 Month CHAR(10),
 Year CHAR(10),
 Amount CHAR(10),

 PRIMARY KEY (InstructorPaymentID,InstructorID),

 FOREIGN KEY (InstructorID) REFERENCES Instructor (InstructorID)
);


CREATE TABLE InstrumentCurrentlyRenting (
 InstrumentRentID SERIAL NOT NULL,
 StudentID SERIAL NOT NULL,
 DateRented DATE,

 FOREIGN KEY (InstrumentRentID) REFERENCES InstrumentForRent (InstrumentRentID),
 FOREIGN KEY (StudentID) REFERENCES Student (StudentID)
);


CREATE TABLE Lesson (
 LessonID SERIAL NOT NULL PRIMARY KEY,
 InstructorID SERIAL,
 Date DATE,
 Place CHAR(50),
 LessonType SERIAL,

 FOREIGN KEY (InstructorID) REFERENCES Instructor (InstructorID),
 FOREIGN KEY (LessonType) REFERENCES LessonType (LessonType)
);


CREATE TABLE StudentFeePerLesson (
 LessonPriceID SERIAL NOT NULL PRIMARY KEY,
 LessonID SERIAL,
 StudentID SERIAL,

 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID),
 FOREIGN KEY (StudentID) REFERENCES Student (StudentID)
);


CREATE TABLE StudentsInLesson (
 StudentID SERIAL NOT NULL,
 LessonID SERIAL,

 FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
 FOREIGN KEY (LessonID) REFERENCES Lesson (LessonID)
);


