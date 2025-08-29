## Create Republican_Party_Primary_Polling Table
CREATE TABLE Republican_Party_Primary_Polling (
Candidate varchar(255),
Polling DECIMAl(5,2),
Pollster varchar(255),
Nationwide bool,
State varchar(255),
Sample_Size int,
Voter_Type varchar(255),
DMY DATE,
Link varchar (255))