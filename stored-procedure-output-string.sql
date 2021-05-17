create or alter procedure Fullname
	@firstname varchar(30),
	@lastname varchar(30),
	@fn varchar(60) output
as
begin
	set @fn = @firstname;
	set @fn += ' ';
	set @fn += @lastname;
end;
go
declare @fullname varchar(60);
exec Fullname 
	@firstname = 'Noah', @lastname = 'Phence', @fn = @fullname out

print @fullname