Begin Transaction;

Insert Major (Code, Description, MinSAT)
	Values( 'UWBW', 'Basket Weaving', 400);

rollback Transaction;

Select * from Major;

Delete Major
	Where Code = 'UWBW'

Commit Transaction;