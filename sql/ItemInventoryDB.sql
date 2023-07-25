-- Answer of the Question A & B:

use master
go 
 create database ItemInventoryDB
 go 
 use ItemInventoryDB
 go

 create table ITEMTYPES(
	ItemTypeID int not null identity(1,1),
	ItemTypeDescription varchar(45) not null,
	constraint [PK_ITEMTYPES] primary key (ItemTypeID),
	constraint [UIX_ITEMTYPEDESC] unique (ItemTypeDescription)
 )

 create table BUILDING(
	BuildingID int not null,
	BuildingName varchar(45) not null,
	ManagerID int,
	constraint [PK_BUILDING] primary key (BuildingID),
	constraint [UIX_BUILDINGNAME] unique (BuildingName),
	constraint [UIX_MANAGER] unique (ManagerID)
 )

 create table ROOM(
	RoomID int not null,
	BuildingID int not null,
	RoomNum int not null,
	FloorNum char(1) not null,
	constraint [PK_ROOM] primary key (RoomID),
	constraint [FK_ROOM_BUILDING] foreign key (BuildingID) references BUILDING (BuildingID),
	constraint [UIX_ROOMID] unique (BuildingID,RoomNum),
	constraint [CHK_FloorNum] check (FloorNum in ('B','1','2','3','4','5'))
 )

 create table ITEM(
	ItemID int not null,
	[Description] varchar(45) not null,
	DataReceived as getdate(),
	Cost decimal(5,2) not null default(0),
	ItemTypeID int not null,
	RoomID int,
	constraint [PK_ITEM] primary key (ItemID),
	constraint [FK_ITEM_ITEMTYPES] foreign key (ItemTypeID) references ITEMTYPES (ItemTypeID),
	constraint [FK_ITEM_ROOM] foreign key (RoomID) references ROOM (RoomID),
	constraint [CHK_Cost] check (Cost > 0.00 and Cost < 40000.00)
 )

 -- Answer of the Question C:

 insert into ITEMTYPES
 values 
 ('Printers'),('Computers'),('Phones'),('Furniture'),('Cabinets')

 insert into BUILDING
 values
(1,'Freedom Hall',500),
(2,'Jones Hall',504)

-- Answer of the Question D:

-- 1. No, There is no building ID 3. it will give a foreign key error.
-- 2. No, Cause The BuildingID + RoomNum must be unique.


-- Answer of the Question E:

select ITEM.ItemID, ITEM.DataReceived, ROOM.RoomNum, ITEM.ItemTypeID 
from ITEM
INNER JOIN ROOM ON ITEM.RoomID=ROOM.RoomID;