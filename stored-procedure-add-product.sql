create or alter procedure AddProduct
	@PartNbr varchar(30) = '',
	@Name varchar(30) = '',
	@Price decimal(11,2) = 0,
	@Unit varchar(30) = '',
	@PhotoPath varchar(255),
	@VendorName varchar(30) = ''
as
begin
	if @PartNbr = '' or @Name = '' or @Price = 0
	or @Unit = '' or @VendorName = ''
	begin
		print 'Required data not provided!'
		return -1;
	end;

	if not exists (Select 1 from Vendors where Name = @VendorName)
	begin
		print 'Vendor not found!'
		return -2;
	end;

	if exists (Select 1 from Products where PartNbr = @PartNbr)
	begin
		print 'Part Number already exists!'
		return -3;
	end;

Insert into Products
	(PartNbr, Name, Price, Unit, PhotoPath, VendorId)
	values(@PartNbr, @Name, @Price, @Unit, @PhotoPath,
			(Select Id from Vendors where Name = @VendorName))
	return 0;
end;
go

exec AddProduct '186341', 'The Collector', 36, 'Single', null, 'Bilgewater Logistics'

Select * from Products