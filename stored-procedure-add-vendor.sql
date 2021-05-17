create or alter procedure AddVendor
	@Code varchar(30),
	@Name varchar(30) = '',
	@Address varchar(30) = '',
	@City varchar(30) = '',
	@State char(2) = '',
	@Zip char(5) = '',
	@Phone varchar(12) = null,
	@Email varchar(255) = null

as
begin
	if @Code = '' or @Name = '' or @Address = ''
	or @City = '' or @State = '' or @Zip = ''
	begin
		print 'Required data not provided!'
		return -1;
	end;
	
	if exists (Select 1 from Vendors where Code = @Code)
	begin
		print 'Vendor code already exists!';
		return -2;
	end;

Insert into Vendors
	(Code, Name, Address, City, State, Zip, Phone, Email)
	values
		(@Code, @name, @Address, @City, @State, @Zip, @Phone, @Email)
	return 0;
end;
go

exec AddVendor 'BLG1', 'Hackwater Logistics', '63 Doubloon Cove', 'Miami', 'FL', '35237', null, null

Select * from Vendors