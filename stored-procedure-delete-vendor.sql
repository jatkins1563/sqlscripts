create or alter procedure DeleteVendor
	@Id int = 0

as
begin
	if not exists (Select 1 from Vendors where Id = @Id)
	begin
		print 'Vendor not found!'
		return -1;
	end;

Delete from Vendors
	where Id = @Id;
end;
go
exec DeleteVendor 0;

Select * from Vendors