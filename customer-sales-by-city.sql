select city, sum(sales)
	from Customers
		group by City
		having sum(sales) > 600000