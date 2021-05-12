select * from Customers
	where City in (
	select distinct city
	from Customers
	where City like 'Cin%' or City like 'Col%')