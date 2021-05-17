create or alter procedure DeleteUser
	@id int = 0

as
begin
	if not exists (Select 1 from Users where Id = @id)
	begin
		print 'User not found!';
		return -2;
	end;

Delete from Users
	where Id = @id;
end;
go
exec DeleteUser 0;

select * from Users