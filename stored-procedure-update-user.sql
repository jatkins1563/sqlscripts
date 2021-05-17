create or alter procedure UpdateUser
	@id int = 0,
	@username varchar(30),
	@password varchar(30),
	@firstname varchar(30),
	@lastname varchar(30),
	@phone varchar(12),
	@email varchar(255),
	@isreviewer bit,
	@isadmin bit
as
begin
	if not exists (Select 1 from Users where Id = @id)
	begin
		print 'User not found!';
		return -2;
	end;

	if exists (Select 1 from Users where Username = @username)
	begin
		print 'Username already in use!'
		return -3;
	end;

Update Users Set
	Username = @username,
	Password = @password,
	Firstname = @firstname,
	Lastname = @lastname,
	Phone = @phone,
	Email = @email,
	IsReviewer = @isreviewer,
	IsAdmin = @isadmin

	where Id = @id;
	return 0;
	
end;
go
exec UpdateUser 5, 'xy', 'yy', 'yy', 'yy', null, null, 0, 0;

Select * from Users