DECLARE @idx int = 0;

while 1=1 begin
	
	set @idx += 3
	if @idx % 9 = 0 begin
	continue;
	end
	if @idx > 100
	break
	print @idx
end
print 'Done'