Select o.Id 'OrderId', o.Date, o.Description, c.Name 'Customer',
		CONCAT(c.City, ', ', c.State) 'Location', ol.Product, ol.Description, ol.Quantity,
		ol.Price, ol.Quantity * ol.Price 'Line Total'
	from Orders o
	join Customers c
		on o.CustomerId = c.Id
	join OrderLines ol
		on o.Id = ol.OrdersId
	where c.City != 'Cleveland'