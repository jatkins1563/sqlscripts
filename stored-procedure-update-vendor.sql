create or alter procedure UpdateVendor
	@Id int = 0,
	@Code varchar(30),
	@Name varchar(30),
	@Address varchar(30),
	@City varchar(30),
	@State char(2),
	@Zip char(5),
	@Phone varchar(12),
	@Email varchar(255)

as
begin
	if not exists (Select 1 from Vendors where Id = @Id)
	begin
		print 'Provided ID does not correspond to existing vendor!'
	return -1;
	end;

Update Vendors Set
	Code = @Code,
	Name = @Name,
	Address = @Address,
	City = @City,
	State = @State,
	Zip = @Zip,
	Phone = @Phone,
	Email = @Email

	Where Id = @Id;
	return 0;

end;
go
exec UpdateVendor 4, 'BLG', 'Bilgewater Logistics', '63 Doubloon Cove', 'Miami', 'FL', '35237', null, null

Select * from Vendors