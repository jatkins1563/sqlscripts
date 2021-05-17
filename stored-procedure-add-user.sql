create or alter procedure AddUser
	@username varchar(30) = '',
	@password varchar(30) = '',
	@firstname varchar(30) = '',
	@lastname varchar(30) = '',
	@phone varchar(12) = null,
	@email varchar(255) = null,
	@isreviewer bit = false,
	@isadmin bit = false
as
begin
	if @username = '' or @password = '' or
		@firstname = '' or @lastname = ''
	begin
		print 'Required data is not provided!';
		return -1;
	end;
	if exists (select 1 from Users where Username = @username)
	begin
		print 'Username already exists - select another!';
		return -2;
	end;

Insert into Users
	(Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin)
	values
	(@username, @password, @firstname, @lastname, @phone, @email, @isreviewer, @isadmin);
	return 0;
end
go
exec AddUser 'xx', 'xx', 'xx', 'xx', null, null, 0, 0;


select * from Users