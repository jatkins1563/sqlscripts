Insert into Customers (Name, City, State, Sales, Active)
	Values ('John Atkins', 'Tampa', 'FL', 0, 1)

Select * from Customers
	Where Name = 'John Atkins'

Select * from Orders

Insert into Orders (CustomerId, Date, Description)
	Values (
		(
		Select Id from Customers
			Where Name = 'John Atkins'
		),
		'2021-05-13',
		'My 28th order'
		)

Select * from OrderLines

Insert into OrderLines (OrdersId, Product, Description, Quantity, Price)
	Values
	((Select Id from Orders Where CustomerId =(Select Id from Customers Where Name = 'John Atkins'))
	, 'Widget', 'John''s Order', 1, 9.99),
	(
		(
			Select Id from Orders
				Where CustomerId =
			(
				Select Id from Customers
					Where Name = 'John Atkins'
			)
		), 'Thing', 'John''s Order', 3, 24.99
	),
	(
		(
			Select Id from Orders
				Where CustomerId =
			(
				Select Id from Customers
					Where Name = 'John Atkins'
			)
		), 'Goober', 'John''s Order', 2, 29.99
	);