create database if not exists suspect;
use suspect;

create table Hair(
hairID int primary key not null,
Color varchar(15) ,
HairHeight varchar (10),
HairShape varchar(20)
);
create table Face (
faceID int  primary key not null,
forehead varchar (10) not null,
eyebrows varchar (10) not null,
eyeColor varchar (10) not null,
nose varchar (10) not null, 
mouth varchar (10) not null,
chin varchar (10) not null,
faceShape varchar (20) not null,
HairId int not null,
foreign key (hairID) references Hair (hairID)
);
create table Hands (
handID int primary key not null,
FingerNumbers int not null,
HandShpae varchar (10) not null,
FingerPrints varchar (3) not null,
HandNumber int not null
);
create table Feet(
feetID int primary key not null,
FingerNumbers int not null,
FootShape varchar (10) not null,
FootSize int not null,
FeetNumber int not null
);
create table Body(
BodyID int primary key not null,
Height decimal (3,2) not null,
Weight decimal (3,3) not null,
BodyShape varchar(20) not null,
HandID int not null,
FeetID int not null,
FaceID int not null,
foreign key(handId) references Hands (HandID),
foreign key (FeetId) references Feet (FeetID),
foreign key (faceID) references Face (FaceID)
);

create table Building(
BuildingID int primary key not null,
FloorNb int not null
);
create table Apartment (
ApartmentNb int not null,
BuildingID  int not null,
ApartmentPhoneNb varchar (10) not null,
primary key (ApartmentNb, BuildingID),
foreign key (BuildingId) references building (BuildingID)
);
create table Location(
LocationId int primary key not null,
City varchar (25) not null,
Country varchar (25) not null,
Address varchar (25) not null,
BuildingID int not null,
foreign key (buildingId) references Building (BuildingID)
);

create table Doctor (
DoctorId int primary key not null,
FirstName varchar(25) not null,
LastName varchar (25) not null,
Specailty varchar (25) not null
);
Create table HospitalRecord(
HospitalID int primary key not null,
Record varchar (3)
);
create table Working(
HospitalID int not null,
DoctorID int not null,
primary key (HospitalID, DoctorID),
foreign key (HospitalID) references HospitalRecord (HospitalID),
foreign key (DoctorID) references Doctor (DoctorID)
);
create table Examination (
hospitalID int not null,
TypeOFExamination varchar (25),
foreign key (hospitalID) references hospitalRecord (HospitalID)
);

create table Victim(
VictimId int primary key not null,
FisrtName varchar(250) not null,
LastName varchar (20) not null,
Gender varchar (10) not null,
Age int not null
);
create table CriminalRecord (
CrimeID int primary key not null,
Record varchar(3),
CrimeType varchar (25),
DateOfCrime date,
LocationOfCrime varchar(25),
VictimID int not null,
HospitalId int not null,
foreign key (VictimID) references Victim (VictimId),
foreign key (HospitalId) references hospitalRecord (HospitalId)
);

create table MotherInfo(
MotherID int primary key not null,
FisrtName varchar (25) not null,
MiddleName varchar (25) not null,
LastName varchar (25) not null,
PhoneNumber varchar(8) not null
);
create table WifeInfo(
WifeID int primary key not null,
firstName varchar (25) not null,
LastName varchar (25) not null,
PhoneNumber varchar(8) not null
);

create table Suspect(
SuspectID int primary key not null,
FisrtName varchar(25) not null,
MiddleName varchar(25) not null,
LastName varchar(25) not null,
Gender varchar(3) not null,
DateOfBirth date not null,
BodyID int not null,
LocationID int not null,
CrimeID int not null,
MotherID int not null,
WifeID int not null
);
create table SuspectPhoneNb(
PersonalPhoneNb int not null,
suspectID int not null,
primary key (PersonalPhoneNb, SuspectID),
foreign key (suspectId) references suspect (suspectID)
); 
create table Witness(
witness int not null,
acclaimed int not null,
foreign key (witness) references suspect (suspectId),
foreign key (acclaimed) references suspect (suspectId)
);
#--------------------------------------------------------------------------------------#
#Inserting data:
insert into Hair values (1,"Brown", "Tall", "Straight");
insert into Hair values (2,"Brown", "Short", "Wavy");
insert into Hair values (3,"Black", "HalfCut", "Straight");
insert into Hair values (4,"Red", "Short", "Curly");
insert into Hair values (5,"Black", "Tall", "Straight");
insert into Hair values (6,"Black", "Tall", "Wavy");
insert into Hair values (7,"Blond", "Tall", "Straight");
insert into Hair values (8,"Blond", "Short", "Curly");

insert into Hands values (1, 10, "Big", "Yes", 2);
insert into Hands values (2, 10, "Normal", "Yes", 2);
insert into Hands values (3, 9, "Normal", "No", 2);
insert into Hands values (4, 10, "Small", "Yes", 2);
insert into Hands values (5, 5, "Normal", "Yes", 1);
insert into Hands values (6, 10, "Normal", "Yes", 2);
insert into Hands values (7, 10, "Small", "Yes", 2);
insert into Hands values (8, 7, "Small", "No", 2);
insert into Hands values (9, 4, "Normal", "No",1);

insert into feet values (1, 9, "Big", "43", 2); 
insert into feet values (2, 10, "Medium", "39", 2); 
insert into feet values (3, 10, "Big", "46", 2); 
insert into feet values (4, 10, "Small", "35", 2); 
insert into feet values (5, 5, "Medium", "41", 1);
insert into feet values (6, 9, "Medium", "43", 2); 
insert into feet values (7, 8, "Big", "42", 2);
insert into feet values (8, 10, "Medium", "40", 10); 
insert into feet values (9, 10, "Medium", "41", 10);   

insert into face values (1,"Broad", "Thick","Brown", "Straight", "Small", "Long", "Circular", 1);
insert into face values (2, "Broad", "Thick", "Brown", "Curved", "Normal", "long", "triangular", 2);
insert into face values (3, "Broad", "Thick", "Green", "Straight", "Small", "Narrow", "Square", 1);
insert into face values (4, "Curved", "Thin", "OliveGreen","Convex", "Normal", "Narrow", "Square", 3);
insert into face values (5, "Sharp", "Thin", "HoneyBrown", "Lowered", "Normal", "Square", "Rectangular" , 4);
insert into face values (6, "Narrow", "Traingular", "Balck", "Straight", "Normal", "Narrow", "Circular", 4);
insert into face values (7, "M-Shaped", "Straight", "Blue", "Concave", "Normal", "Receding","Circular", 7);
insert into face values (8, "M-Shaped", "Straight", "Grey", "Concave", "Small", "Receding", "Traingular", 8);
insert into face values (9, "Fuzi-Mount", "Traingular", "LightBlue", "Lowered", "Small","Normal", "Traingular", 5);

alter table Body modify Weight decimal (5,2) not null;
insert into Body values (1, 1.60, 63.0, "Pear", 1, 3, 1);
insert into body values (2, 1.67, 73.4, "Apple", 1, 2, 3);
insert into body values (3, 1.68, 70.7, "Mascular", 3, 2, 5);
insert into body values (4, 1.50, 40.0, "Traingular", 5, 6, 9);
insert into body values (5, 1.56, 66.4,"Round", 7, 3, 9);
insert into body values (6, 1.88, 83.2, "Mascular", 6, 8, 2);
insert into body values (7, 1.85, 68.7,"Pear", 9, 4, 9);
insert into body values (8, 1.71, 86.8, "Round", 5, 3, 8);
insert into body values (9, 1.59, 80.5, "Round", 4, 2, 6);

update body set Bodyshape = "Muscular" where bodyId in (3,6);
update body set bodyshape = "Triangular" where bodyid = 4;

insert into Building values (1, 3);
insert into Building values (2, 1);
insert into Building values (3, 4);
insert into Building values (4, 15);
insert into Building values (5, 6);
insert into Building values (6, 10);
insert into Building values (7, 11);
insert into Building values (8, 12);
insert into Building values (9, 13);
insert into Building values (10,5);

insert into Apartment values (101, 1, "01-875953");
insert into Apartment values (205, 8, "03-875453");
insert into Apartment values (310, 2, "05-235953");
insert into Apartment values (415, 7, "01-736457");
insert into Apartment values (506, 3, "08-546187");
insert into Apartment values (626, 5, "01-983456");
insert into Apartment values (719, 4, "06-875953");
insert into Apartment values (821, 6, "01-984563");
insert into Apartment values (930, 10, "01-653847");
insert into Apartment values (107, 9, "03-345627");
insert into Apartment values (104, 1, "01-647536");
insert into Apartment values (302, 4, "03-867454");
insert into Apartment values (616, 5, "03-635478");
insert into Apartment values (526, 3, "05-411564");

insert into Location values (1, "Akkar", "Lebanon", "Jouma",2);
insert into Location values (2, "Baalbak", "Lebanon", "Wadi",4);
insert into Location values (3, "Beirut", "Lebanon", "Ain El-Mreisse",6);
insert into Location values (4, "Beirut", "Lebanon", "Snoubra",1);
insert into Location values (5, "Akkar", "Lebanon", "Qaitea",1);
insert into Location values (6, "Beirut", "Lebanon", "Hamra",6);
insert into Location values (7, "Nabatieh", "Lebanon","Raoucheh",7);
insert into Location values (8, "Beirut", "Lebanon", "Ain El-Tine",5);
insert into Location values (9, "Beirut", "Lebanon", "Ras Beirut",10);
insert into Location values (10, "Baalbak", "Lebanon", "Brazil Street",3);

insert into Doctor values (1,  "Ali", "Mohammad", "Surgery");
insert into Doctor values (2,  "Ahmad", "Asi", "Psychiatry");
insert into Doctor values (3,  "Joe", "Rida", "Surgery");
insert into Doctor values (4,  "Ali", "Hussein", "Neurology");
insert into Doctor values (5,  "Mortada", "Mozanar", "Nursing");
insert into Doctor values (6,  "Abbass", "Mortada", "Cardiology");
insert into Doctor values (7,  "Nour", "Jouni", "Emergency");
insert into Doctor values (8,  "Cristine", "Awela", "Dermatology");
insert into Doctor values (9,  "Fatima", "Ahmad", "Surgery");
insert into Doctor values (10,  "Rami", "Sherbel", "Cardiology");

insert into hospitalrecord values (1, "Yes");
insert into hospitalrecord values (2, "No");
insert into hospitalrecord values (3, "Yes");
insert into hospitalrecord values (4, "No");
insert into hospitalrecord values (5, "No");
insert into hospitalrecord values (6, "No");
insert into hospitalrecord values (7, "Yes");
insert into hospitalrecord values (8, "Yes");
insert into hospitalrecord values (9, "Yes");
insert into hospitalrecord values (10, "Yes");
insert into hospitalrecord values (11, "Yes");
insert into hospitalrecord values (12, "No");
insert into hospitalrecord values (13, "Yes");

insert into working values (1,1);
insert into working values (3,1);
insert into working values (5,8);
insert into working values (1,7);
insert into working values (8,4);
insert into working values (9,9);
insert into working values (10,2);
insert into working values (11,6);
insert into working values (4,5);
insert into working values (2,10);
insert into working values (13,2);
insert into working values (13,1);

insert into Examination values (1, "Hand Surgery");
insert into Examination values (3, "Brain Surgery");
insert into Examination values (7, "Heart Attack");
insert into Examination values (8, "Hnad Movement");
insert into Examination values (9, "Heart Surgery");
insert into Examination values (13, "Bullet Removing");
insert into Examination values (10, "Signs of Schizophrenia");
insert into Examination values (11, "Heart Checking");
insert into Examination values (10, "Signs for Narcissism");

insert into Victim values (1, "Nour", "Gani", "Female", 32);
insert into Victim values (2, "Shadi", "Mohsen", "Male", 28);
insert into Victim values (3, "Lamar", "Sherri", "Female", 17);
insert into Victim values (4, "Elena", "Tawil", "Female", 25);
insert into Victim values (5, "Ali", "Makki", "Male", 55);
insert into Victim values (6, "Joseph", "Bardi", "Male", 27);
insert into Victim values (7, "Silia", "Yaakoub", "Female", 44);
insert into Victim values (8, "shaza", "Harisi", "Female", 23);
insert into Victim values (9, "Ayman", "Jondi", "Male", 19);


Alter table CriminalRecord Modify VictimId int;
insert into CriminalRecord values (1, "Yes", "Killed Teenager", "2015-01-11","Beirut", 3, 2);
insert into CriminalRecord values (2, "Yes", "Killed Adult", "2009-05-23", "Beirut", 5, 10);
insert into CriminalRecord values (3, "Yes", "Drug Dealing", "2006-10-15", "Sour", null, 13);
insert into CriminalRecord values (4, "No", null, null, null, null, 12);
insert into CriminalRecord values (5, "No", null, null, null, null, 4);
insert into CriminalRecord values (6, "Yes", "Drug Dealing", "2019-03-23", "Syda", 9, 10);
insert into CriminalRecord values (7, "No", null, null, null,null, 2);
insert into CriminalRecord values (8, "Yes", "Killed Adult", "2022-11-11", "Nabatiyeh", 4, 6);
insert into CriminalRecord values (9, "No", null, null, null, null, 2);
insert into CriminalRecord values (10, "Yes", "Assualt", "2010-08-17", "Beirut", 8, 5);
insert into CriminalRecord values (11, "Yes", "Killed Adult", "2023-06-15", "Baalbak", 1, 3);
insert into CriminalRecord values (12, "No", null, null, null, null, 7);

alter table MotherInfo modify phoneNumber varchar(10) not null;
insert into MotherInfo values (1, "Maha", "Ismail", "Mohammad", "76-123765");
insert into MotherInfo values (2, "Mariam", "Noah", "Aliweyeh", "76-763544");
insert into MotherInfo values (3, "Aliyeh", "Liam", "Nour ElDine", "81-983546");
insert into MotherInfo values (4, "Sara", "Joseph", "Hasan", "70-635472");
insert into MotherInfo values (5, "Hiba", "Henry", "Fakih", "71-924536");
insert into MotherInfo values (6, "Jasmine", "Abbass", "Halal", "80-963447");
insert into MotherInfo values (7, "Clara", "Mahdi", "Shebaa", "30-025647");
insert into MotherInfo values (8, "Emily", "Yasin", "Mostafa", "81-564785");

alter table wifeinfo modify phoneNumber varchar(10) not null;
insert into WifeInfo values (1, "Jana", "Mortadah", "76-256748");
insert into WifeInfo values (2, "Emily", "James", "71-973456");
insert into WifeInfo values (3, "Mariam", "Hammoud", "32-639254");
insert into WifeInfo values (4, "Clara", "Smeaa", "03-276482");
insert into WifeInfo values (5, "Lara", "Srour", "81-368946");

alter table suspect modify MotherId int;
alter table suspect modify wifeid int;
alter table suspect modify gender varchar (10) not null;
insert into Suspect values (1, "Anas", "Mahdi", "Ballout", "Male", "2001-01-03", 3, 10, 1, null, null);
insert into Suspect values (2, "Amir", "Mostafa", "Baidar","Male", "1998-06-25", 5, 9, 7, 8,5);
insert into Suspect values (3, "Elie", "Saleh", "Marjeh","Male", "1964-12-12", 6, 3, 3, 3,1);
insert into Suspect values (4, "Liza", "Leonardo", "Tawil", "Female", "1996-03-01", 9, 2, 6, 7, null);
insert into Suspect values (5, "Ghofran", "Rasoul", "Hashem", "Male", "1999-12-15", 1, 6, 5, 4, 4);
insert into Suspect values (6, "Jousef", "Levi", "Yaakoub", "Male", "1992-10-09", 3, 7, 8, 6, null);
insert into Suspect values (7, "Meriam", "William", "Kansou", "Female", "2000-02-02", 4, 1, 2, null, null);
insert into Suspect values (8, "Yasin", "Alexander", "Lakis",  "Male", "1999-01-22", 6, 4, 4, 5, 2); 
insert into Suspect values (9, "Mohammad", "Hassan", "Mohsen",  "Male", "1964-11-23", 7, 5, 10, 2, 3);
insert into Suspect values (10, "Yousef", "Michael", "Yousef", "Male", "2000-04-30", 2, 8, 1, null, null);
insert into Suspect values (11, "Gamila", "Mostfah", "Baidar", "Female", "1960-05-07", 8, 8, 12, 8, null);
insert into Suspect values (12, "Tony", "Issa", "Khalil", "Male", "1999-03-12", 2, 7, 11, null, null);

alter table suspectPhonenb modify personalPhoneNb varchar (10) not null;
insert into SuspectPhoneNb values ("76-984567", 2);
insert into SuspectPhoneNb values ("76-875345", 1);
insert into SuspectPhoneNb values ("81-287425", 2);
insert into SuspectPhoneNb values ("03-532297", 4);
insert into SuspectPhoneNb values ("81-395427", 6);
insert into SuspectPhoneNb values ("71-356743", 7);
insert into SuspectPhoneNb values ("76-338812", 8);
insert into SuspectPhoneNb values ("32-220054", 12);
insert into SuspectPhoneNb values ("80-100423", 12);

insert into Witness values (1, 12);
insert into Witness values (11, 9);
insert into Witness values (2, 10);
insert into Witness values (12, 4);
insert into Witness values (6, 7);
insert into Witness values (8, 2);
#-----------------------------------------------------------------------------------#
#1
select * from suspect limit 5;
#2
select FirstName, LastNAme from suspect order by firstName;
#3
insert into Witness values (1,10);
#4
delete from witness where witness = 1;
#5
select * from motherinfo order by firstname desc;
#6
select * from wifeinfo where firstName like '%a%';
#7
select City, country from location where city = "Beirut";
#8
select * from hands where fingerprints = "yes";
#9
select * from face where eyecolor = "Blue" and faceshape = "circular";
#10
update witness set witness = 9 where acclaimed = 2;
select * from witness;
#---------------------------------------------------------------------------------------#
#Sub-queries:
#1
Select FirstName, lastName from doctor where doctorId = (select HospitalID from working where hospitalId = 3);
#2
Select * from suspectPhoneNb
 where suspectId = (select suspectID from suspect where WifeId 
 = (select wifeId from wifeInfo where FirstName = "Emily" and LastName = "James"));
#3
 select firstName, middleName, lastName from suspect where locationId 
 in (select locationId from location where City = "Nabatieh");
 #4
 select firstname, lastname from wifeinfo where wifeid =
 (select wifeid from suspect where suspectid = 5);
 #5
 select firstname, lastname, Specailty from doctor where doctorid 
 in (select DoctorId from working where hospitalId 
 = (select hospitalId from hospitalRecord where hospitalid = 3));
 #-------------------------------------------------------------------------------------#
 #Join queries 
 #1
 Select v.fisrtName, v.lastName from victim as v 
 inner join criminalRecord as c on v.victimID = c.victimID
 inner join suspect as s on s.crimeID = c.CrimeID where s.FirstName = "Liza" and s.lastNAme = "Tawil";
 #2
 Select s.firstName, s.LastName from suspect as s 
 inner join body as b on b.bodyid = s.bodyid 
 inner join face as f on f.FaceID = b.FaceID where f.eyeColor = "Green" or f.faceShape = "Rectangular" or f.mouth = "small";
 #3
 Select firstName, middleName, lastName, c.dateOfCrime from suspect as s 
 inner join criminalRecord as c on c.crimeId = s.CrimeID where c.dateOfCrime  = "2022-11-11";
 #4
 Select s.firstName, s.middleName, s.lastName from suspect as s 
 inner join location as l on l.LocationID = s.locationID 
 inner join building as b on b.buildingid = l.buildingid where b.floorNB = 10;
 #5
 Select s.firstName, s.MiddleName, s.LastName, m.FirstName as motherFirstName, m.LastName as MotherLastName from suspect as s 
 left join motherinfo as m on m.motherId = s.motherID;
 #----------------------------------------------------------------------------------------------------------3
 #Creating views 
 #1
 Create view Suspects_With_CriminalRecord as
 select s.FirstName, s.Middlename, s.lastname, s.gender, s.DateOfBirth, c.CrimeType from suspect as s 
 inner join CriminalRecord as c on c.CrimeId = s.CrimeID where c.Record = "Yes";
 select * from Suspects_With_CriminalRecord;
 #2
 create view Mother_whose_Kid_did_Crime as 
 select m.FirstName, m.lastname, m.phoneNumber from motherinfo as m 
 inner join suspect as s on m.MotherID = s.MotherId
 inner join criminalrecord as c on c.CrimeID = s.CrimeID where c.record = "Yes";
 select * from Mother_whose_Kid_did_Crime;
 #3
 create view Wife_Married_To_Criminal as 
  select w.FirstName, w.lastname, w.phoneNumber from wifeinfo as w
 inner join suspect as s on w.wifeid = s.wifeid
 inner join criminalrecord as c on c.CrimeID = s.CrimeID where c.record = "Yes";
 select * from Wife_Married_To_Criminal;
 #4
 create view Suspects_With_Multiple_PhoneNb as
 select s.firstname, s.middlename, s.lastname from suspect as s
 inner join suspectphonenb as sp on sp.suspectID = s.SuspectID
 group by sp.suspectID having count(personalPhoneNb) > 1;
 select * from Suspects_With_Multiple_PhoneNb;
 #5
 create view Suspects_with_Round_Body as 
 select s.firstName, s.middlename, s.lastName, b.height, b.weight from suspect as s
 inner join body as b on b.bodyId = s.BodyID where b.bodyshape = "Round" order by s.FirstName asc;
 select * from Suspects_with_Round_Body;
 #------------------------------------------------------------------------------------------------------#
 #Stored procedures
 #1
 DELIMITER $$ 
 create Procedure getSuspects() begin
 select firstName, Middlename, lastName, personalPhoneNb 
 from suspect as s inner join suspectphonenb as sp 
 on sp.suspectID = s.SuspectID 
 order by firstname;
 end $$
 delimiter ;
 call getSuspects();
 #2
 DELIMITER //
 create procedure getLocation() begin
 select s.firstname, s.middlename, s.lastname, l.city, l.country, l.address, b.floornb, a.apartmentnb
 from suspect as s inner join location as l on l.LocationId = s.LocationID
 inner join building as b on b.BuildingID = l.BuildingID 
 inner join apartment as a on a.BuildingID = b.BuildingID;
 end //
 DELIMITER ;
 call getLocation();
#3
DELIMITER //
create procedure getNumberOfEachCrime() begin
Declare nbOfCrime int default 0;
select count(crimeType) into nbOfCrime 
from criminalrecord;

select nbofcrime;
end //
DELIMITER ;
call getNumberOfEachCrime();
#4
DELIMITER //
create procedure getMother_Wife_Info() begin
select s.firstname as SFIrstName, s.LastName as SLastName, 
m.FirstName as MFirstName, m.lastName as MLastName,
w.FirstName as WFirstName, w.LastName as WLastName
from suspect as s
inner join wifeinfo as w on s.wifeId = w.WifeID 
inner join motherinfo as m on m.MotherID= s.MotherId;
end //
DELIMITER ;
call getMother_Wife_Info();
#5
DELIMITER $$ 
create procedure getSuSpectWithOneHand() begin 
select firstname, lastname from suspect as s 
inner join body as b on s.bodyId = b.BodyID
inner join hands as h on h.handID = b.HandID 
where h.HandNumber = 1;
end $$
DELIMITER ;
call getSuSpectWithOneHand();
#-------------------------------------------------------------------#
#Creating Triggers
#1
DELIMITER //
create trigger After_insert_Suspect
after insert on suspect 
for each row begin
if new.wifeId < 4 
then   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wife Id must be less than 4';
end if;
end //
DELIMITER ;
insert into suspect values (13 , "Hadi", "Dawoud", "Nororozi", "Male", "1994-02-03", 2, 3, 4, 5 , 3);
#---------------------------------------------------------------------#
#Creating users 
create user nour@"localhost" identified by "admin" with
max_connections_per_hour 100 
max_queries_per_hour 1000 
max_updates_per_hour 200
max_user_connections 5;

create user ali@"localhost" identified by "ali1234" with
max_connections_per_hour 80
max_queries_per_hour 1100 
max_updates_per_hour 230
max_user_connections 12;

create user mahdi@'%' identified by "@3412$" with
max_connections_per_hour 90
max_queries_per_hour 500
max_updates_per_hour 20 
max_user_connections 5;

create user zeinab@'%' identified by 'zizi@345$'with
max_connections_per_hour 30
max_queries_per_hour 800 
max_updates_per_hour 130 
max_user_connections 9;

create user nano@'localhost' identified by 'n8n0'with 
max_connections_per_hour 200
max_queries_per_hour 3000
max_updates_per_hour 500
max_user_connections 8;

grant select, update, delete on suspect.* to nour@'localhost';
grant usage on suspect.* to mahdi@'%';
grant select on suspect.suspect to ali@'localhost';
grant select, update, create on suspect.body to zeinab@'%';
grant all on *.* to nano@'localhost';

show grants for nour@'localhost';
show grants for ali@'localhost';
show grants for zeinab@'%';
show grants for mahdi@'%';
show grants for nano@'localhost';