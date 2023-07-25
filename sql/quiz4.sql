use EmployeeData
go

select * from Employee

select Name = FirstName+' '+LastName from Employee where LastName like 'B%' and Gender ='M'

select Name = FirstName+' '+LastName from Employee where DATEDIFF(YEAR,BirthDate,GETDATE()) >=45 

select Name = FirstName+' '+LastName,HireDate,JobTitle from Employee where MONTH(HireDate)=12 and (JobTitle like 'Production Technician%' or JobTitle like '%Tool Designer')

select Name = FirstName+' '+LastName,BirthDate from Employee where BirthDate like '197%'

select Name = FirstName+' '+LastName from Employee where VacationHours in (83,84,88,99)
