use master
go 
 create database TrafficViolationsDB
 go 
 use TrafficViolationsDB
 go

 create table PERSON(
	PersonID int not null identity(1,1),
	FirstName varchar(15) not null,
	LastName varchar(20) not null,
	PhoneNumber char(10) not null,
	constraint [PK_Person] primary key (PersonID),
	constraint [UIX_PHone] unique (PhoneNumber)
 )

 insert into PERSON (FirstName,LastName,PhoneNumber)
 values ('Attah','hussain','3298797765')


 create table COMPANY(
	CompanyID int not null identity(1000,1),
	CompanyName varchar(30) not null,
	EIN nchar(10) not null,
	constraint [PK_Company] primary key (CompanyID),
	constraint [UIX_CompanyName] unique (CompanyName),
	constraint [UIX_EIN] unique (EIN)
 )

 create table OWNERS (
	OwnerID int not null,
	Street varchar (15) not null,
	City varchar (25) not null,
	USState char (2) not null 
	constraint [DFLT_State] default ('NY'),
	constraint [PK_Owners] primary key (OwnerID),

 )

 alter table Owners
 add constraint [FK_Owners_Person] foreign key (OwnerID)
 references Person (PersonID)

 create table VEHICLE (
	VIN char(17) not null,
	YearBuilt int not null,
	Make varchar (20) not null,
	Model varchar (25) not null,
	OwnerID int not null,
	LicensePlateID varchar (15) not null,
	LicensePlateState char (2) not null,
	constraint [PK_VEHICLE] primary key (VIN),
	constraint [UIX_LicensePlate] unique (LicensePlateID,LicensePlateState),
	constraint [FK_VEHICLE_OWNER] foreign key (OwnerID) references OWNERS (OwnerID)
 )
 

 create table MOTORIST (
 DriverLicense varchar (16) not null,
 DriverLicenseState char (2) not null,
 ExpirationDate as dateadd(year,10,getdate()),
 LicenseType char(2) not null,
 DriverID int not null,
 constraint [PK_MOTORIST] primary key (DriverLicense,DriverLicenseState),
 constraint [CHK_licenseType] check (LicenseType in ('A','B','C','D','M','DJ')),
 constraint [FK_MOTORIST_PERSON] foreign key (DriverID) references PERSON (PersonID)
 )

 create table VIOLATIONTYPE(
	ViolationTypeID int not null,
	ViolationTypeDesc varchar (20) not null,
	CurrentFee decimal (5,2) not null,
	constraint [PK_VIOLATIONTYPE] primary key (ViolationTypeID),
	constraint [UIX_VIOLATIONDESC] unique (ViolationTypeDesc),
	constraint [CHK_FEE] check (CurrentFee > 0.00 and CurrentFee <= 500.00)
 )

 create table SUMMONS(
   SummonsID int not null,
   DateOfSummons date not null,
   DueDate as dateadd(day, 30, DateOfSummons),
   ViolationTypeID int not null,
   VIN char(17) not null,
   FeeCharged decimal(5,2) not null,
   constraint[PK_Summons] primary key (SummonsID),
   constraint[FK_SUMMONS_VEHICLE] foreign key (VIN) references VEHICLE(VIN), 
   constraint [FK_SUMMONS_VIOLATIONTYPE] foreign key(ViolationTypeID) references VIOLATIONTYPE(ViolationTypeID)
)
