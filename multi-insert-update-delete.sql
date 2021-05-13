Insert into Customers (Name, City, State, Sales, Active)
	Values
	('ACME MFG CO 1', 'Cincinnati', 'OH', 1000, 1),
	('ACME MFG CO 2', 'Cincinnati', 'OH', 2000, 0),
	('ACME MFG CO 3', 'Cincinnati', 'OH', 3000, 1);

Update Customers Set
	Name = 'Acme Mfg Co 0',
	Sales = 0
	Where Name = 'ACME MFG CO'

Select * from Customers
	Where Name like 'ACME MFG CO%'

Delete from Customers
	Where Name = 'ACME MFG CO 3'
