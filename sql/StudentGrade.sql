use master
go 
 create database StudentGradeDB
 go 
 use StudentGradeDB
 go

 create table BOOKS(
	BookID int not null,
	BookTitle varchar(15) not null,
	BookLevel int not null,
	BookNumPages int not null,
	constraint [PK_BOOKS] primary key (BookID),
	constraint [CHK_BOOKNUMPAGES] check (BookNumPages >= 10 and BookNumPages <= 400)
 )

 create table GRADE_SUPERVISORS(
	GradeSupervisorID int not null,
	GradeSupervisorName varchar(15),
	constraint [PK_GRADE_SUPERVISORS] primary key (GradeSupervisorID)
 )

 create table GRADE_TABLE(
	GradeTableID int not null,
	CurrentGrade int not null,
	GradeMinReadLevel int not null,
	GradeSupervisorID int not null,
	constraint [PK_GRADE_TABLE] primary key (GradeTableID),
	constraint [FK_GRADE_TABLE_GRADE_SUPERVISORS] foreign key (GradeSupervisorID) references GRADE_SUPERVISORS(GradeSupervisorID),
	constraint [CHK_CurrentGrade] check (CurrentGrade >= 1 and CurrentGrade <= 8)
 )

 create table STUDENTS(
	StudentID int not null,
	FirstName varchar(15) not null,
	LastName varchar(15) not null,
	StudentAge int not null,
	GradeTableID int not null,
	constraint [PK_STUDENTS] primary key (StudentID),
	constraint [CHK_StudentAge] check (StudentAge >= 6 and StudentAge <= 14)
 )

 create table STUDENTS_HAS_BOOKS(
	StudentID int not null,
	BookID int not null,
	constraint [PK_STUDENTS_HAS_BOOKS] primary key (StudentID,BookID),
	constraint [FK_STUDENTS_HAS_BOOKS_STUDENTS] foreign key (StudentID) references STUDENTS(StudentID),
	constraint [FK_STUDENTS_HAS_BOOKS_BOOKS] foreign key (BookID) references BOOKS(BookID)
 )

