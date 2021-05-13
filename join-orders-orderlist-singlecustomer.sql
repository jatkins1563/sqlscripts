Select c.Name, o.Date, o.Description, ol.Product,
		ol.Description, ol.Quantity, ol.Price,
		ol.Quantity * ol.Price 'Line Total'
from Customers c
	join Orders o on c.Id = o.CustomerId
	join OrderLines ol on o.Id = ol.OrdersId
		Where c.Name = 'John Atkins'