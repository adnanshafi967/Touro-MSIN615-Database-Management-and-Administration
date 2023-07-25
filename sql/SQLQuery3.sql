use PREMIERECO
go

select * from PART

select [PART_DESCRIPTION],[PRICE] from PART

select distinct([CATEGORY]) from PART

select [CUST_NAME] from CUSTOMER where LEFT([CUST_NAME],1)= 'A'

select [CUST_NAME] from CUSTOMER where [CUST_NAME] like '__e%'

select [CUST_NAME], LEN([CUST_NAME]) as CUS_NAME_LEN from CUSTOMER

select [CUST_NAME] as OWES_MORE_THAN_5000 from CUSTOMER where [CUST_BALANCE] > 5000.00

select [CUST_NAME], [CREDIT_LIMIT]-[CUST_BALANCE] as REMAINING_BALANCE from CUSTOMER

select [CUST_NAME], [CREDIT_LIMIT], [CREDIT_LIMIT]+([CREDIT_LIMIT]*3)/100 as INCREASES_LIMIT from CUSTOMER

select DATEADD(DAY,5,[ORDER_DATE]) as estimated_ship_date from ORDERS

select datediff(DAY,[ORDER_DATE],getdate()) as ordered_days_ago,[ORDER_NUM], [ORDER_DATE] from ORDERS

select [CUST_NAME],[REP_NUM] ,REP_NAME =
case [REP_NUM]
when '20' then 'Valerie Kaiser'
when '35' then 'Richard Hull'
when '65' then 'Juan Perez'
end
from CUSTOMER

select PART_DESCRIPTION from PART where CATEGORY like 'HW' and UNITS_ON_HAND < 25

select PART_DESCRIPTION from PART where WAREHOUSE in (1,2)

select distinct(PART_NUM) from ORDER_LINE

select distinct(ORDER_NUM) from ORDER_LINE where [PART_NUM] in ('DR93', 'DW11' , 'KL62', 'KT03')

select [CUST_NAME], [CUST_BALANCE] from CUSTOMER where [CUST_BALANCE] > 2500.00 and [CUST_BALANCE] < 6000.00

select [FNAME] +' '+ [LNAME] as Emp_full_name from EMPLOYEE

select LEFT([FNAME],1) + LEFT([LNAME],1) + cast(DAY([BirthDate]) as char) as loginName from EMPLOYEE

select [EMP_Num], [FNAME] +' '+ [LNAME] as Emp_full_name from EMPLOYEE where [loginName] is null