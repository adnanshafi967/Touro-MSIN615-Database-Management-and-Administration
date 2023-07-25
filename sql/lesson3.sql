use PREMIERECO
go

select * from part

insert into PART ([PART_NUM],[PART_DESCRIPTION],[UNITS_ON_HAND],
[CATEGORY],[WAREHOUSE],[PRICE])
values ('XD93','baseball bat',100,'SG',2,200.00)

create table Manager (
Emp_num int not null,
DepartmentID int null,
constraint PK_MANAGER primary key (Emp_num))

insert into Manager (Emp_num) 
select EMP_Num 
from EMPLOYEE 
where EMP_Num= 10


create table #Warehouse1Parts (
Part_Num varchar(10) not null,
Part_Description varchar(30) not null,
Price smallmoney not null,
constraint PKWareHouse primary key (Part_Num)
)


insert into #Warehouse1Parts (part_num, part_description,price)
select part_num, part_description,price 
from part
where WAREHOUSE=1


delete from part where PART_NUM=''


insert into PART ([PART_NUM],[PART_DESCRIPTION],[UNITS_ON_HAND],
[CATEGORY],[WAREHOUSE],[PRICE])
values ('AT94','baseball bat',100,'SG',2,200.00)

select * from ORDERS

insert into orders ([ORDER_DATE],[CUST_NUM])
values (getdate(),150)


select * from ORDER_LINE

delete from part where PART_NUM ='AT94'

insert into ORDER_LINE ([ORDER_NUM],[PART_NUM],[QTY_ORDERED],
[QUOTED_PRICE],[Modified_Date])
values (99999,'AT94',2,200.00,GETDATE())

drop database AP

