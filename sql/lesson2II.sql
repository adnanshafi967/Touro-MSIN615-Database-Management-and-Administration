use PREMIERECO
go

select rep_num, cust_no = count(REP_NUM) from CUSTOMER group by REP_NUM

select CUST_NUM, total_order = count(CUST_NUM) from ORDERS group by CUST_NUM

select Max_customer_balance = MAX([CUST_BALANCE]) from CUSTOMER
 
select avg_credit_limit = AVG([CREDIT_LIMIT]) from CUSTOMER

select total_order_by_148 = count(*) from ORDERS where [CUST_NUM] = 148

select No_of_product = count(PART_NUM) from PART where CATEGORY != 'SG'

select order_num, sum(Subtotal) as Total from ORDER_LINE group by ORDER_NUM

select cust_num, max(ORDER_DATE) as most_recent_order_date from orders group by CUST_NUM

select part_num, count(*)  as each_part_total_ordered from ORDER_LINE group by part_NUM

select part_num, sum(Subtotal) as total_value from ORDER_LINE group by PART_NUM

select part_num as total_qty from ORDER_LINE group by PART_NUM having sum(QTY_ORDERED) >=6

select WAREHOUSE,sum(UNITS_ON_HAND*PRICE) as product_value from PART group by WAREHOUSE

select min(PRICE) as smallest_priced_product from PART

select count(distinct CATEGORY) as number_of_category from PART

select year(ORDER_DATE) as year,count(*) as orders_per_year from ORDERS group by year(ORDER_DATE)

select product_price = 
case 
when price < 100.00 then 'cheap'
when price < 200.00 then 'reasonable'
when price < 400.00 then 'fair'
when price < 800.00 then 'expensive'
when price < 2000.00 then 'very expensive'
end,
sum(UNITS_ON_HAND) as total_quantity_of_products
from PART group by 
case 
when price < 100.00 then 'cheap'
when price < 200.00 then 'reasonable'
when price < 400.00 then 'fair'
when price < 800.00 then 'expensive'
when price < 2000.00 then 'very expensive'
end


select year(ORDER_DATE) as year,count(*) as orders_per_year from ORDERS where CUST_NUM !='408' group by year(ORDER_DATE) having count(*) >=7

select 
case
when DATEDIFF(year,HIRE_Date,GETDATE()) >=20 then  'long term'
when DATEDIFF(year,HIRE_Date,GETDATE()) >=10 then  'mid term'
when DATEDIFF(year,HIRE_Date,GETDATE()) >=5 then  'short term'
when DATEDIFF(year,HIRE_Date,GETDATE()) <5 then  'new hires'
end
as year_worked, count(*) as number_of_emps from EMPLOYEE group by
case
when DATEDIFF(year,HIRE_Date,GETDATE()) >=20 then  'long term'
when DATEDIFF(year,HIRE_Date,GETDATE()) >=10 then  'mid term'
when DATEDIFF(year,HIRE_Date,GETDATE()) >=5 then  'short term'
when DATEDIFF(year,HIRE_Date,GETDATE()) <5 then  'new hires'
end

select CUST_ZIP,avg([CREDIT_LIMIT]) as avg_credit_limit from CUSTOMER group by CUST_ZIP

select count(CUST_NUM) as number_of_customers,sum(CUST_BALANCE) as total_cust_owe from CUSTOMER group by CUST_ZIP having sum(CUST_BALANCE)>2500.00