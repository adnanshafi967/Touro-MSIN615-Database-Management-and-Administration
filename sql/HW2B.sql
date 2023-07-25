use AP
go

select * from Vendors where VendorCity='fresno'

select VendorCity +', '+VendorState as location,count(*) as number_of_vendors from Vendors group by VendorState,VendorCity order by VendorState,VendorCity

select YEAR(InvoiceDate) as year, count(*) as numOfOrder from Invoices group by YEAR(InvoiceDate)

select MONTH(PaymentDate)as month,YEAR(PaymentDate) as Year, max(PaymentTotal) as MaxPayment from Invoices where PaymentDate is not null group by YEAR(PaymentDate),MONTH(PaymentDate)

select VendorID, sum(PaymentTotal) as totalPayment from Invoices group by VendorID

select count(*) as numOfVendorsWithPOAddress from Vendors where VendorAddress1 like '%PO Box%' or VendorAddress2 like '%PO Box%' or VendorAddress1 like '%P.O. Box%' or VendorAddress2 like '%P.O. Box%'

select terms =
case DefaultTermsID
when 1 then 'Net due 10 days'
when 2 then 'Net due 20 days'
when 3 then 'Net due 30 days'
when 4 then 'Net due 60 days'
when 5 then 'Net due 90 days'
end, count(*) as numOfVendors
from Vendors group by
case DefaultTermsID
when 1 then 'Net due 10 days'
when 2 then 'Net due 20 days'
when 3 then 'Net due 30 days'
when 4 then 'Net due 60 days'
when 5 then 'Net due 90 days'
end

select count(*) as numOfInvoices,TermsID from Invoices group by TermsID having count(*) >=10

select InvoiceLineItemDescription, count(InvoiceID) as numOfInvoices from InvoiceLineItems group by InvoiceLineItemDescription having count(InvoiceID)>1

select [InvoiceID],[CreditTotal] from Invoices

select max(InvoiceDate) as mostRecentInvoiceDate from Invoices

select count(distinct DefaultAccountNo) as numOfDefaultAccount from Vendors

select avg(PaymentTotal) as AvgPayment from Invoices

select DaysLate = 
case  
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate)<0 then 'EARLY'
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate)=0 then 'ONTIME'
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate)>30 then 'VERYLATE'
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate)>20 then  'LATE'
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate)>10 then 'SOMEWHAT LATE'
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate)>=1 then  'A BIT LATE'
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate) is null then 'NOT PAID YET'
end, count(*) as HowManyInvoices
from Invoices group by
case  
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate)<0 then 'EARLY'
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate)=0 then 'ONTIME'
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate)>30 then 'VERYLATE'
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate)>20 then  'LATE'
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate)>10 then 'SOMEWHAT LATE'
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate)>=1 then  'A BIT LATE'
when DATEDIFF(DAY,InvoiceDueDate,PaymentDate) is null then 'NOT PAID YET'
end

select max(PaymentDate) as RecentPaymentDate,VendorID from Invoices group by VendorID

select max(DATEDIFF(DAY,InvoiceDueDate,PaymentDate)) as DaysLate,VendorID from Invoices group by VendorID having max(DATEDIFF(DAY,InvoiceDueDate,PaymentDate))>=1

select count(*) as InvoicNotPaid from Invoices where PaymentDate is null

select InvoiceLineItemDescription, sum(InvoiceLineItemAmount) as totalAmount, MIN(InvoiceLineItemAmount) as leastAmount, MAX(InvoiceLineItemAmount) as largestAmount from InvoiceLineItems group by InvoiceLineItemDescription

select VendorContactLName from Vendors where VendorContactLName like '%a%'

select VendorContactLName from Vendors group by VendorContactLName having VendorContactLName like '%a%'

select VendorName from Vendors where VendorName like '%Co'

select VendorName from Vendors group by VendorName having VendorName like '%Co'

