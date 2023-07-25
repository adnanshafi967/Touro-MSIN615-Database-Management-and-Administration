use EmployeeData
go

select max(VacationHours) as maximun_vacation_hours from Employee

select * from Employee

select max(HireDate) as recent_hiredate from Employee where JobTitle like '%Manager'

select count(*) as num_of_empolyees, JobTitle from Employee group by JobTitle

select AgeCatagory = 
case 
when DATEDIFF(year,[BirthDate] ,GETDATE()) > 70 then 'CONSIDER RETIRING'
when DATEDIFF(year,[BirthDate] ,GETDATE()) > 60 then 'SENIOR'
when DATEDIFF(year,[BirthDate] ,GETDATE()) > 40 then 'EXPERIENCED'
when DATEDIFF(year,[BirthDate] ,GETDATE()) > 20 then 'YOUNG'
end, QtyEmployees = count(*)
from Employee group by
case 
when DATEDIFF(year,[BirthDate] ,GETDATE()) > 70 then 'CONSIDER RETIRING'
when DATEDIFF(year,[BirthDate] ,GETDATE()) > 60 then 'SENIOR'
when DATEDIFF(year,[BirthDate] ,GETDATE()) > 40 then 'EXPERIENCED'
when DATEDIFF(year,[BirthDate] ,GETDATE()) > 20 then 'YOUNG'
end

select max(DATEDIFF(year,[BirthDate] ,GETDATE())) as oldest_person_age ,year(HireDate) as hire_year from Employee group by year(HireDate)

select max(DATEDIFF(year,[BirthDate] ,GETDATE())) as oldest_person_age ,year(HireDate) as hire_year from Employee where JobTitle not like '%technician%' group by year(HireDate)


select count(*) as num_of_empolyees, JobTitle from Employee where SalariedFlag like '0' group by JobTitle having count(*) >= 5
select count(*) as num_of_empolyees, JobTitle from Employee where SalariedFlag like '0' group by JobTitle