Use EdDb;
DECLARE @MinSAT int = 1494;

Select * from Student
	where SAT > @MinSAT
	order by SAT desc;