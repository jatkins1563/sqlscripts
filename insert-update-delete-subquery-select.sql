select * from Student

Insert into Student (Firstname, Lastname, StateCode, SAT, GPA, MajorId)
	Values
	(
		'Noah', 'Phense', 'GA', 1235, 3.15,
		(
			Select Id from Major
				where Code = 'MATH'
		)
	)

Update Student
	Set
	MajorId =
	(
		Select Id from Major
			where Code = 'ACCT'
	), 
	GPA = 3.51
		Where Firstname = 'Noah' and Lastname = 'Phense'

Delete from Student
	where Firstname = 'Noah' and Lastname = 'Phense'