select c.Name 'Customer', c.City, c.State,	o.Description 'Order',
	ol.Description 'Product', ol.Quantity, ol.Price,
	ol.Quantity * ol.Price 'Line Total'
from Orders o
	join OrderLines ol on o.Id = ol.OrdersId
	join Customers c on c.Id = o.CustomerId