select c.Id, Code, Subject, Section, concat(Firstname, ' ', Lastname) 'Name'
	from Class c
	left join Instructor i
		on c.InstructorId = i.Id
	where Section between 300 and 399
	order by Section asc