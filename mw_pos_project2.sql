#The following project is a personal data cleaning and EDA that I have wanted to do for a long time but never knowig which tools to use to extract the info i needed. After learning SQL and passing the Comptia Data+ certification, I have now acquired the knowledge to attempt extracting the information. 

#Key objectives are to calculate how many individual elements of POS have been sent to print since I have started working at MW but also the ability to filter it out by year and month. 

#Also would like to understand the percentage increase per month.

#Starting by having a look at all 3 tables
SELECT * 
FROM mw_pos
;

SELECT * 
FROM anl_pos
;

SELECT * 
FROM ems_pos
;

#I need to add a column to each of the 3 tables called BRAND so whn i join all 3 of them together, I can differentiate between them all. Currently there is no such column.
 ALTER TABLE mw_pos
 ADD Brand varchar(255);
#Set the value to every row as MW
UPDATE mw_pos
	SET Brand = 'MW';
    
 ALTER TABLE anl_pos
 ADD Brand varchar(255);
#Set the value to every row as MW
UPDATE anl_pos
	SET Brand = 'ANL';

 ALTER TABLE ems_pos
 ADD Brand varchar(255);
#Set the value to every row as MW
UPDATE ems_pos
	SET Brand = 'EMS';
    
#Inserting all rows from the anl_pos and ems_pos tables to mw_pos. Putting all information into 1 table.
INSERT INTO mw_pos
SELECT * 
FROM anl_pos
;

INSERT INTO mw_pos
SELECT * 
FROM ems_pos
;

#Check to see if it worked
SELECT * 
FROM mw_pos
;

#Fix the 'id' column so the name does not contain incorrect characters
ALTER TABLE pos.mw_pos 
RENAME COLUMN `ï»¿ ID` TO `ID`;

#Deleting columns I don't need
ALTER TABLE pos.mw_pos
DROP COLUMN Q,
DROP COLUMN C,
DROP COLUMN P,
DROP COLUMN J,
DROP COLUMN A,
DROP COLUMN D,
DROP COLUMN I,
DROP COLUMN `Del Job No`,
DROP COLUMN `Split From`,
DROP COLUMN `Group`,
DROP COLUMN `PO Nums`
;

#Check to see if it worked
SELECT * 
FROM mw_pos
;

#The 'Required' column should be a date column but it has come in as a text column. Using DESC to check the field types.
DESC mw_pos;

#Create a date column using the 'Required column and then dropping the Required column.
ALTER TABLE mw_pos
ADD COLUMN realdate DATE;
UPDATE mw_pos
SET realdate = STR_TO_DATE(Required, '%d/%m/%Y');

#Now i don't need the required column
ALTER TABLE pos.mw_pos
DROP COLUMN Required
;

#Using the 'realdate' column, I am able to extract the first 3 letters of the month name and the year and put this into it's own column but also capitalise the entire column.
SELECT *, UPPER(CONCAT(LEFT(MONTHNAME(realdate),3), ' ', YEAR(realdate))) AS 'PR NAME'
FROM mw_pos
;


#Creating a new column called 'PR NAME' and updating the table with values
ALTER TABLE mw_pos
ADD COLUMN `PR NAME` varchar(255);

UPDATE mw_pos
SET `PR NAME` = UPPER(CONCAT(LEFT(MONTHNAME(realdate),3), ' ', YEAR(realdate)));

SELECT * 
FROM mw_pos
;

#Now I can look at the 'Name' column and look for the entries that include the word 'MASTER' in it. I am also looking for a particular pattern using regular expressions.
SELECT ID, UPPER(Name) AS Name, Items AS `POS Quantity`, Brand, realdate, `PR NAME`
FROM mw_pos
WHERE
Name REGEXP '[A-Z]{3}[0-9]{2}' 
OR Name LIKE 'DEC%' 
OR Name LIKE '%Master%' 
;

SELECT *
FROM mw_pos
;

#Getting the information on solely the NEW STORE pos print projects
SELECT Brand, SUM(Items) AS no_of_new_store_pos
FROM mw_pos
WHERE Name Like '%new_store%'
GROUP BY Brand
;
    


