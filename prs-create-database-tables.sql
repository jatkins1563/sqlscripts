use master;
drop database if exists PrsDb;
Create database PrsDb;
go
Use PrsDb;

Create table Users
(
	Id int PRIMARY KEY identity(1,1),
	Username varchar(30) not null unique,
	Password varchar(30) not null,
	Firstname varchar(30) not null,
	Lastname varchar(30) not null,
	Phone varchar(12),
	Email varchar(255),
	IsReviewer bit not null default(0),
	IsAdmin bit not null default(0)
);

Create table Vendors
(
	Id int PRIMARY KEY identity(1,1),
	Code varchar(30) not null unique,
	Name varchar(30) not null,
	Address varchar(30) not null,
	City varchar(30) not null,
	State char(2) not null,
	Zip char(5) not null,
	Phone varchar(12),
	Email varchar(255),
);

Create table Products
(
	Id int PRIMARY KEY identity(1,1),
	PartNbr varchar(30) not null unique,
	Name varchar(30) not null,
	Price decimal(11,2) not null,
	Unit varchar(30) not null,
	PhotoPath varchar(255),
	VendorId int not null FOREIGN KEY REFERENCES Vendors(Id)
);

Create table Requests
(
	Id int PRIMARY KEY identity(1,1),
	Description varchar(80) not null,
	Justification varchar(80) not null,
	RejectionReason varchar(80),
	DeliveryMode varchar(20) not null Default('Pickup'),
	Status varchar(10) not null Default('New'),
	Total decimal(11,2) not null Default(0),
	UserId int not null FOREIGN KEY REFERENCES Users(Id),
);

Create table RequestLines
(
	Id int PRIMARY KEY identity(1,1),
	RequestId int not null FOREIGN KEY REFERENCES Requests(Id),
	ProductId int not null FOREIGN KEY REFERENCES Products(Id),
	Quantity int not null Default(1)
);

Insert Users (Username, Password, Firstname, Lastname, Phone, Email)
	Values
	('Spellthief', 'elemental', 'Luxanna', 'Crownguard', '888-123-4567', 'finalesfunkeln@demacia.com'),
	('Spintowin', 'sunfirelife', 'Garen', 'Crownguard', '888-123-1234', 'checkbush@demacia.com'),
	('Mageseeker', 'unchained', 'Sylas', 'Dregbourne', '888-123-9999', 'myultnow@demacia.com');

Insert Vendors (Code, Name, Address, City, State, Zip)
	Values
	('DEM', 'Demacia Holdings LLC', '81 Crownguard Way', 'Orlando', 'FL', '31013'),
	('NOX', 'Noxus Global Enterprises', '1 Citadel Blvd', 'Daytona', 'FL', '30634'),
	('PIL', 'Piltover Research Group', '637 Yordle Run', 'Clearwater', 'FL', '33519');

Insert Products (PartNbr, Name, Price, Unit, VendorId)
	Values
	('184593', 'Thornmail', 32, 'Single',
		(
			Select Id from Vendors
				where Code = 'NOX'
		)
	),
	('185274', 'Randuin''s Omen', 30, 'Single',
		(
			Select Id from Vendors
				where Code = 'DEM'
		)
	),
	('186302', 'Hextech GLP-800', 34, 'Single',
		(
			Select Id from Vendors
				where Code = 'PIL'
		)
	);