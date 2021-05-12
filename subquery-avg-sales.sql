select *
from Customers
where Sales < (
	select AVG(Sales)
	from Customers
	)