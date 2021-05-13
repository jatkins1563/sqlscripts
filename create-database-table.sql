--Create Database Bootcamp;

Create Table Students (
	Id int PRIMARY KEY identity(1,1),
	FirstName varchar(30) not null,
	LastName varchar(30) not null,
	Address varchar(50) not null,
	City varchar(50) not null,
	State char(2) not null,
	Zip int not null,
	AssessmentScore int not null
);

Create Table Assessments (
	Id int PRIMARY KEY identity(1,1),
	StudentId int not null FOREIGN KEY references Students(Id),
	Topic varchar(30) not null,
	Score int not null
);


Insert into Students (FirstName, LastName, Address, City, State, Zip, AssessmentScore)
	Values
	('John',
	'Atkins',
	'3944 Tumble Wood Trail, Apt 103',
	'Tampa',
	'FL',
	'33613',
	96
	);

Insert into Assessments (StudentId, Topic, Score)
	Values
	(
		(
		Select Id from Students
			Where FirstName = 'John' and LastName = 'Atkins'
		),
		'Git/GitHub',
		110
	);
