create or alter procedure FindUserByUsernameandPassword
	@username varchar(30) = '',
	@password varchar(30) = ''

as

begin
	if @username = ''
	begin
		print 'Username is required!'
		return
	end;
	if @password <> ''
	begin
		Select *
			from Users
				where Username = @username and Password = @password;
	end
	else
	begin
		Select *
			from Users
				where Username = @username;
	end;
end;
go
exec FindUserByUsernameandPassword 'Spellthief', ''