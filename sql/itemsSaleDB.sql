use master
go 
 create database ItemsSaleDB
 go 
 use ItemsSaleDB
 go

  create table SUPPLIERS(
	SupplierID int not null,
	SupplierName varchar(45) not null,
	SupplierPhoneNum char(10),
	website varchar(45) not null,
	constraint [PK_Supplier] primary key (SupplierID),
	constraint [UIX_SupplierName] unique (SupplierName),
	constraint [UIX_website] unique (website)
 )

 create table ItemTypes(
	ItemTypeID int not null,
	ItemTypeDescription varchar(45) not null,
	constraint [PK_ItemType] primary key (ItemTypeID),
	constraint [UIX_ItemTypeDesc] unique (ItemTypeDescription)
 )

 create table Items(
	ItemID int not null,
	ItemDesc varchar(45) not null,
	CurrentPrice decimal(5,2) not null default (1),
	UnitsOnHand int not null default (0),
	ReOrderLevel int not null,
	SupplierID int not null,
	ItemTypeID int not null,
	Taxable binary(1),
	constraint [PK_Item] primary key (ItemID),
	constraint [FK_Items_SUPPLIERS] foreign key (SupplierID) references SUPPLIERS (SupplierID),
	constraint [FK_Items_ItemTypes] foreign key (ItemTypeID) references ItemTypes (ItemTypeID),
	constraint [CHK_CurrentPrice] check (CurrentPrice >= 0),
	constraint [CHK_UnitsOnHand] check (UnitsOnHand >= 0),
	constraint [CHK_ReOrderLevel] check (ReOrderLevel >= 5)
 )

 create table WeekSales(
	SalesID int not null identity(1,1),
	ItemID int not null,
	SalesPrice decimal(5,2) not null,
	StartDate date not null,
	EndDate as dateadd(day,7,StartDate),
	constraint [PK_WeekSales] primary key (SalesID),
	constraint [FK_WeekSales_Items] foreign key (ItemID) references Items (ItemID),
	constraint [UIX_SaleEvent] unique (ItemID,StartDate),
	constraint [CHK_StartDate] check (StartDate < getdate())
 )

 insert into SUPPLIERS([SupplierID],[SupplierName],[website])
 values 
 (1,'General Mills','www.generalmills.com'),
 (2,'HERRS','www.herrs.com'),
 (3,'PROCTOR & GAMBLE','us.pg.com'),
 (4,'DOLE','www.dole.com')

insert into ItemTypes
values
(1,'BAKERY'),
(2,'CANDY'),
(3,'MEATS'),
(4,'GROCERY'),
(5,'PAPER GOODS'),
(6,'PRODUCE')

insert into Items
values
(1,'COCOA PUFFS',4.99,100,50,1,4,0),
(2,'RIPPLES POTATO CHIPS 1oz',0.30,300,100,2,2,0),
(3,'PAPER TOWELS',1.99,400,200,3,5,1)

insert into WeekSales
values
(1,2.99,'2019-03-25'),
(3,1.00,'2019-03-25')


-- Answer of the question a: One item only can be sale one time a day.

-- Answer of the question b: Will give Foreign key error as supplierID 1 exits in the item table

delete from SUPPLIERS where SupplierName like 'DOLE'
-- Answer of the question c: It will not cause any problem as it is not used any other table.

update SUPPLIERS set website='https://us.pg.com' where SupplierName like 'PROCTOR & GAMBLE'

select * from SUPPLIERS
select * from ItemTypes
select * from Items
select * from WeekSales