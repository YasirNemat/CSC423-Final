DROP TABLE AvailableCourses;
DROP TABLE Enrollments;
DROP TABLE Sections;
DROP TABLE Tutors;
DROP TABLE Students;


CREATE TABLE Tutors (
    TutorID int PRIMARY KEY CHECK(LENGTH(TutorID)=8),
    FirstName varchar(255),
    LastName varchar(255),
    Street varchar(255),
    City varchar(255),
    ZipCode int,
    PhoneNo int
);

CREATE TABLE Sections (
    SectionID int PRIMARY KEY CHECK(LENGTH(SectionID)=8),
    Places int CHECK(Places>0),
    StartMonth varchar(255),
    EndMonth varchar(255),
    DayOfWeek varchar(255) CHECK(DayOfWeek='Monday' OR DayOfWeek='Tuesday' OR DayOfWeek='Wednesday' OR DayOfWeek='Thursday' OR DayOfWeek='Friday' OR DayOfWeek='Saturday' OR DayOfWeek='Sunday'), 
    TimeOfDay varchar(255) CHECK(TimeOfDay='Morning' OR TimeOfDay='Evening'),
    TutorID int,
    FOREIGN KEY(TutorID) REFERENCES Tutors(TutorID)
);

CREATE TABLE Students (
    StudentID int PRIMARY KEY CHECK(LENGTH(StudentID)=8),
    FirstName varchar(255),
    LastName varchar(255),
    Street varchar(255),
    City varchar(255),
    ZipCode int,
    PhoneNo int
);

CREATE TABLE AvailableCourses (
    SectionID int,
    CourseName varchar(255),
    FOREIGN KEY(SectionID) REFERENCES Sections(SectionID)
);

CREATE TABLE Enrollments (
    StudentID int,
    SectionID int,
    FeePaid varchar(255) CHECK(FeePaid='Paid' OR FeePaid='Unpaid'),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(SectionID) REFERENCES Sections(SectionID)
);

INSERT INTO Tutors
(TutorID, FirstName, LastName, Street, City, ZipCode, PhoneNo)
values
(11111111, 'Mary', 'Jane', '1111 Generic Ave', 'BigCity', '11122', 9541112222);

INSERT INTO Tutors
(TutorID, FirstName, LastName, Street, City, ZipCode, PhoneNo)
values
(22222222, 'Simon', 'Says', '2222 Basic Blvd', 'SmallCity', '22233', 7542223333);

INSERT INTO Tutors
(TutorID, FirstName, LastName, Street, City, ZipCode, PhoneNo)
values
(33333333, 'Bob', 'Builder', '3333 Simple Street', 'BigCity', '33344', 9543334444);

INSERT INTO Tutors
(TutorID, FirstName, LastName, Street, City, ZipCode, PhoneNo)
values
(44444444, 'Danny', 'David', '4444 Generic Ave', 'BigCity', '11122', 9544445555);

INSERT INTO Tutors
(TutorID, FirstName, LastName, Street, City, ZipCode, PhoneNo)
values
(55555555, 'Marco', 'Polo', '5555 Basic Blvd', 'SmallCity', '33344', 7545556666);

INSERT INTO Sections
(SectionID, Places, StartMonth, EndMonth, DayOfWeek, TimeOfDay, TutorID)
values
(11122334, 10, 'October', 'March', 'Monday', 'Evening', 55555555);

INSERT INTO Sections
(SectionID, Places, StartMonth, EndMonth, DayOfWeek, TimeOfDay, TutorID)
values
(11223344, 15, 'October', 'March', 'Monday', 'Evening', 11111111);

INSERT INTO Sections
(SectionID, Places, StartMonth, EndMonth, DayOfWeek, TimeOfDay, TutorID)
values
(44455678, 15, 'October', 'March', 'Wednesday', 'Evening', 22222222);

INSERT INTO Sections
(SectionID, Places, StartMonth, EndMonth, DayOfWeek, TimeOfDay, TutorID)
values
(23456789, 15, 'October', 'December', 'Tuesday', 'Evening', 33333333);

INSERT INTO Sections
(SectionID, Places, StartMonth, EndMonth,  DayOfWeek, TimeOfDay, TutorID)
values
(35790123, 10, 'October', 'December', 'Wednesday', 'Evening', 44444444);

INSERT INTO AvailableCourses
(SectionID, courseName)
values
(11122334, 'Spanish 1');

INSERT INTO AvailableCourses
(SectionID, courseName)
values
(11223344, 'Spanish 1');

INSERT INTO AvailableCourses
(SectionID, courseName)
values
(44455678, 'Spanish 1');

INSERT INTO AvailableCourses
(SectionID, courseName)
values
(23456789, 'Introduction to Digging Up Your Ancestors');

INSERT INTO AvailableCourses
(SectionID, courseName)
values
(35790123, 'Introduction to Digging Up Your Ancestors');

INSERT INTO Students
(StudentID, FirstName, LastName, Street, City, ZipCode, PhoneNo)
values
(11111111, 'Joseph', 'Jo', '1111 Generic Ave', 'BigCity', '11122', 9542221111);

INSERT INTO Students
(StudentID, FirstName, LastName, Street, City, ZipCode, PhoneNo)
values
(22222222, 'Conny', 'Springfield', '2222 Basic Blvd', 'SmallCity', '22233', 7543332222);

INSERT INTO Students
(StudentID, FirstName, LastName, Street, City, ZipCode, PhoneNo)
values
(33333333, 'Eren', 'Jaegar', '3333 Simple Street', 'BigCity', '33344', 9544443333);

INSERT INTO Students
(StudentID, FirstName, LastName, Street, City, ZipCode, PhoneNo)
values
(44444444, 'Annie', 'Lionheart', '4444 Generic Ave', 'BigCity', '11122', 9545554444);

INSERT INTO Students
(StudentID, FirstName, LastName, Street, City, ZipCode, PhoneNo)
values
(55555555, 'Hughie', 'Jackman', '5555 Generic Ave', 'BigCity', '11122', 9547778888);

INSERT INTO Enrollments
(StudentID, SectionID, FeePaid)
values
(11111111, 11122334, 'Paid');

INSERT INTO Enrollments
(StudentID, SectionID, FeePaid)
values
(22222222, 11223344, 'Paid');

INSERT INTO Enrollments
(StudentID, SectionID, FeePaid)
values
(33333333, 44455678, 'Unpaid');

INSERT INTO Enrollments
(StudentID, SectionID, FeePaid)
values
(44444444, 23456789, 'Paid');

INSERT INTO Enrollments
(StudentID, SectionID, FeePaid)
values
(55555555, 35790123, 'Unpaid');