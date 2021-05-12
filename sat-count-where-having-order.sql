--display states and # of students in each with SAT above 1000 and only displays states with more than 1 student

Select
	count(*) 'Count', s.StateCode
	from Student s
	where s.SAT < 1000
	group by s.StateCode
	having count(*) > 1
	order by Count(*) desc