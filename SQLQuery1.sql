Use Training_13Aug19_Pune
Go

select * from Employee_46003367

Create Proc [dbo].[SelectEmployeeNew_46003367]
@ID int
As
	Begin
		Select *
		from Employee_46003367 where ID = @ID
	End
Go 

Create Proc [dbo].[SelectEmployees_46003367]
As
	Begin
		Select *
		from Employee_46003367
	End
Go 

Create Proc [dbo].[InsertEmployee_46003367]
@ID int,
@Name varchar(50),
@Designation int,
@Department int
As
	Begin
		Insert Into Employee_46003367 values (@ID,@Name,@Designation,@Department)
	End
Go 

Create Proc [dbo].[UpdateEmployee_46003367]
@ID int,
@Name varchar(50),
@Designation int,
@Department int
As
	Begin
		Update Employee_46003367 Set Name=@Name,Designation=@Designation,Department=@Department where ID=@ID
	End
Go

Create Proc [dbo].[DeleteEmployee_46003367]
@ID int
As
	Begin
		Delete From Employee_46003367 where ID=@ID
	End
Go