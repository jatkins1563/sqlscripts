Create table Customers
(
	Id int PRIMARY KEY identity (1,1),
	Code varchar(10) not null unique,
	Name varchar(30) not null,
	Sales decimal(9,2) not null Default(0) check (Sales >= 0),
	Active bit not null Default(1),
	Created datetime not null Default(getdate())
);

Insert Customers (Code, Name)
	Values
	('DEM', 'Demacia Holdings LLC'),
	('NOX', 'Noxus Enterprises'),
	('PIL', 'Piltover Research Group');

Select * from Customers

Alter table Customers
	add Updated datetime null;