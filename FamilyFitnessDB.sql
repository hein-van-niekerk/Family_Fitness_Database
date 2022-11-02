CREATE DATABASE FamilyFitnessDB
ON PRIMARY
(NAME=FamilyFitnessDataFile1,
FILENAME='C:\SQL Data PRJ\FamilyFitnessDataFile1.mdf',
SIZE=20MB,
MAXSIZE=UNLIMITED,
FILEGROWTH=10%
),
FILEGROUP SECONDARY
(NAME=StudentLogFile2,
FILENAME='C:\SQL Data PRJ\FamilyFitnessLogFile2.ndf',
SIZE=10MB,
MAXSIZE=5GB,
FILEGROWTH=5%
)
LOG ON
(NAME=FamilyFitnessDBLogFile1,
FILENAME='C:\SQL Data PRJ\FamilyFitnessLogFile1.ldf',
SIZE=10MB,
MAXSIZE=1GB,
FILEGROWTH=10MB
);

GO
USE FamilyFitnessDB

CREATE TABLE Customer
(CustomerID INT IDENTITY PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
EmailAddress VARCHAR(50) NOT NULL,
PhoneNumber VARCHAR(10) NOT NULL UNIQUE,
City VARCHAR(50),
Suburb VARCHAR(50),
Street VARCHAR(50) NOT NULL
);

INSERT INTO [FamilyFitnessDB].[dbo].[Customer]
VALUES ('Hein','van Niekerk','hein3000vn@gmail.com','0717603259','Kempton Park','Norkem Park','Bennie Jacobs Avenue');

INSERT INTO [FamilyFitnessDB].[dbo].[Customer]
VALUES ('Frik','van der Merwe','Frik3@gmail.com','0824567890','Brakpan','Brenthurst','Alwyn Street');

INSERT INTO [FamilyFitnessDB].[dbo].[Customer]
VALUES ('Japie','Joubert','Japie63@gmail.com','0822349078','Boksburg','Boksburg West','Pomelo Street');

INSERT INTO [FamilyFitnessDB].[dbo].[Customer]
VALUES ('Sipho','Tshabalala','Sipho1234@gmail.com','0825423597','Sandton','Sandhurst','Albert Street');

INSERT INTO [FamilyFitnessDB].[dbo].[Customer]
VALUES ('Sibusisu','Mhlabane','sMhlabane@gmail.com','0834876549','Kempton Park','Birchleigh','Potato Street');

CREATE TABLE Employee
(EmployeeID INT IDENTITY PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR (50) NOT NULL,
EmailAddress VARCHAR(50) NOT NULL,
PhoneNumber VARCHAR(10) NOT NULL UNIQUE,
City VARCHAR(50),
Suburb VARCHAR(50),
Street VARCHAR(50)
);

INSERT INTO [FamilyFitnessDB].[dbo].[Employee] 
VALUES('Frik','Van der Merwe','frik@mweb.co.za','0832695847','Pta','North','Rachel de Beur St')

INSERT INTO [FamilyFitnessDB].[dbo].[Employee]
VALUES('John','West','jwest123@gmail.com','0723451523','Jhb','Norch','Color Way St')

INSERT INTO [FamilyFitnessDB].[dbo].[Employee]
VALUES('Westly','Koetz','WestKoetz@gmail.com','0733551513','Jhb','Gemini','One Drive St')

INSERT INTO [FamilyFitnessDB].[dbo].[Employee]
VALUES('Lessely','Snow','lsnowl@gmail.com','0772367159','Jhb','Lilianton','Calla St')

INSERT INTO [FamilyFitnessDB].[dbo].[Employee]
VALUES('Julias','Malema','malema66@gmail.com','0823940523','Jhb','Norch','Color Way St')

CREATE TABLE Supplier
(SupplierID INT IDENTITY PRIMARY KEY,
EmailAddress VARCHAR(50) NOT NULL,
PhoneNumber VARCHAR(10) NOT NULL UNIQUE,
City VARCHAR(50) NOT NULL,
Suburb VARCHAR(50) NOT NULL,
Company VARCHAR(50) NOT NULL
);

INSERT INTO [FamilyFitnessDB].[dbo].[Supplier] (EmailAddress, PhoneNumber, City, Suburb, Company)
VALUES('technoGym@gmail.com','0661234567','jhb','Bedfordview','Techno Gym')

INSERT INTO [FamilyFitnessDB].[dbo].[Supplier]
VALUES('MiFitness@gmail.com','0117046711','jhb','Sunninghill','MiFitness')

INSERT INTO [FamilyFitnessDB].[dbo].[Supplier]
VALUES('fitnessnetwork@gmail.com','0104650019','jhb','Bryanston','Fitness Network')

INSERT INTO [FamilyFitnessDB].[dbo].[Supplier]
VALUES('fortfitness@gmail.com','0837780234','Benoni','Brentwood Park','Fort Fitness')

INSERT INTO [FamilyFitnessDB].[dbo].[Supplier]
VALUES('originfitnesswarehouse@gmail.com','0114400699','jhb','Eastleigh','Origin Fitness Warehouse')

CREATE TABLE Membership
(MembershipID INT IDENTITY PRIMARY KEY,
MembershipType VARCHAR(20) NOT NULL
);

insert into [FamilyFitnessDB].[dbo].[Membership] 
values('Bronze')

insert into [FamilyFitnessDB].[dbo].[Membership]
values('Silver')

insert into [FamilyFitnessDB].[dbo].[Membership]
values('Gold')

CREATE TABLE Branch
(BranchID INT IDENTITY PRIMARY KEY,
BranchName VARCHAR(20)
);

INSERT INTO [FamilyFitnessDB].[dbo].[Branch]
VALUES('Norkem Park')

INSERT INTO [FamilyFitnessDB].[dbo].[Branch]
VALUES('Avion')

INSERT INTO [FamilyFitnessDB].[dbo].[Branch]
VALUES('Brentwood')

CREATE TABLE CustomerMembership
(CustomerID INT REFERENCES Customer(CustomerID),
MembershipID INT REFERENCES Membership(MembershipID),
PRIMARY KEY(CustomerID,MembershipID)
);

INSERT INTO [FamilyFitnessDB].[dbo].[CustomerMembership] (CustomerID,MembershipID)
VALUES('2', '1')

INSERT INTO [FamilyFitnessDB].[dbo].[CustomerMembership] (CustomerID,MembershipID)
VALUES('1', '3')

INSERT INTO [FamilyFitnessDB].[dbo].[CustomerMembership] (CustomerID,MembershipID)
VALUES('3', '2')

INSERT INTO [FamilyFitnessDB].[dbo].[CustomerMembership] (CustomerID,MembershipID)
VALUES('4', '1')

INSERT INTO [FamilyFitnessDB].[dbo].[CustomerMembership] (CustomerID,MembershipID)
VALUES('5', '3')

CREATE TABLE CustomerBranch
(CustomerID INT REFERENCES Customer(CustomerID),
BranchID INT REFERENCES Branch(BranchID),
PRIMARY KEY(CustomerID,BranchID)
);

INSERT INTO [FamilyFitnessDB].[dbo].[CustomerBranch] (CustomerID,BranchID)
VALUES('1', '3')

INSERT INTO [FamilyFitnessDB].[dbo].[CustomerBranch] (CustomerID,BranchID)
VALUES('2', '2')

INSERT INTO [FamilyFitnessDB].[dbo].[CustomerBranch] (CustomerID,BranchID)
VALUES('3', '1')

INSERT INTO [FamilyFitnessDB].[dbo].[CustomerBranch] (CustomerID,BranchID)
VALUES('4', '1')

INSERT INTO [FamilyFitnessDB].[dbo].[CustomerBranch] (CustomerID,BranchID)
VALUES('5', '3')

CREATE TABLE EmployeeBranch
(EmployeeID INT REFERENCES Employee(EmployeeID),
BranchID INT REFERENCES Branch(BranchID),
PRIMARY KEY(EmployeeID,BranchID)
);

INSERT INTO [FamilyFitnessDB].[dbo].[EmployeeBranch] (EmployeeID,BranchID)
VALUES('1','3')

INSERT INTO [FamilyFitnessDB].[dbo].[EmployeeBranch] (EmployeeID,BranchID)
VALUES('2','1')

INSERT INTO [FamilyFitnessDB].[dbo].[EmployeeBranch] (EmployeeID,BranchID)
VALUES('3','1')

INSERT INTO [FamilyFitnessDB].[dbo].[EmployeeBranch] (EmployeeID,BranchID)
VALUES('4','2')

INSERT INTO [FamilyFitnessDB].[dbo].[EmployeeBranch] (EmployeeID,BranchID)
VALUES('5','3')

CREATE TABLE SupplierBranch
 (SupplierID INT FOREIGN KEY REFERENCES Supplier(SupplierID),
  BranchID INT FOREIGN KEY REFERENCES Branch(BranchID),
  PRIMARY KEY(SupplierID,BranchID)
  );

INSERT INTO [FamilyFitnessDB].[dbo].[SupplierBranch] (SupplierID,BranchID)
VALUES('1','2')

INSERT INTO [FamilyFitnessDB].[dbo].[SupplierBranch] (SupplierID,BranchID)
VALUES('2','1')

INSERT INTO [FamilyFitnessDB].[dbo].[SupplierBranch] (SupplierID,BranchID)
VALUES('3','2')

INSERT INTO [FamilyFitnessDB].[dbo].[SupplierBranch] (SupplierID,BranchID)
VALUES('4','3')

INSERT INTO [FamilyFitnessDB].[dbo].[SupplierBranch] (SupplierID,BranchID)
VALUES('5','3')

CREATE TABLE EmployeeSalary
(EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
 Salary MONEY
 );

 INSERT INTO [FamilyFitnessDB].[dbo].[EmployeeSalary] (EmployeeID,Salary)
 VALUES('1','3000')

 INSERT INTO [FamilyFitnessDB].[dbo].[EmployeeSalary] (EmployeeID,Salary)
 VALUES('2','2800')

 INSERT INTO [FamilyFitnessDB].[dbo].[EmployeeSalary] (EmployeeID,Salary)
 VALUES('3','3750')

 INSERT INTO [FamilyFitnessDB].[dbo].[EmployeeSalary] (EmployeeID,Salary)
 VALUES('4','4800')

 INSERT INTO [FamilyFitnessDB].[dbo].[EmployeeSalary] (EmployeeID,Salary)
 VALUES('5','5200')

--	queries (The question stated marks will be awarded for complexity, we broke our brains writing this so I think we deserve marks)
USE FamilyFitnessDB

GO
--This query is made to display which branch each customer has a membership at
SELECT CustomerBranch.CustomerID,Customer.Name,Customer.PhoneNumber, CustomerBranch.BranchID, Branch.BranchName
FROM CustomerBranch
  INNER JOIN Customer ON Customer.CustomerID=CustomerBranch.CustomerID
  INNER JOIN Branch ON Branch.BranchID=CustomerBranch.BranchID;

GO
--This query is made to display which branch each employee works at
SELECT EmployeeBranch.EmployeeID,Employee.FirstName,Employee.PhoneNumber, EmployeeBranch.BranchID, Branch.BranchName
FROM EmployeeBranch
  INNER JOIN Employee ON Employee.EmployeeID=EmployeeBranch.EmployeeID
  INNER JOIN Branch ON Branch.BranchID=EmployeeBranch.BranchID;

GO
--This query is made to display which membership each customer has
SELECT CustomerMembership.CustomerID,Customer.Name,Customer.PhoneNumber, CustomerMembership.MembershipID, Membership.MembershipType 
FROM CustomerMembership
  INNER JOIN Customer ON Customer.CustomerID=CustomerMembership.CustomerID
  INNER JOIN Membership ON Membership.MembershipID=CustomerMembership.MembershipID;

GO
--This view is made to display which supplier supplies which branch
CREATE VIEW [Supplier_Branch] 
AS

 SELECT SupplierBranch.SupplierID, Supplier.Company, Branch.BranchID, Branch.BranchName
 FROM SupplierBranch
 INNER JOIN Branch ON SupplierBranch.BranchID=Branch.BranchID
 INNER JOIN Supplier ON Supplier.SupplierID=SupplierBranch.SupplierID;
 
GO
--This query is made to display customers who reside in Kempton Park
SELECT City, Name, LastName, PhoneNumber
FROM Customer
WHERE City IN ('Kempton Park')

GO
--This view is made to show the employees first name, last name and salary
CREATE VIEW EmpSalary
AS
    SELECT E.FirstName, E.EmployeeID, ES.Salary
    FROM Employee E
    JOIN EmployeeSalary ES ON E.EmployeeID=ES.EmployeeID

GO

SELECT * FROM EmpSalary

GO
--This procedure is made to filter employees by their suburb
CREATE PROCEDURE SelectCustomerSuburb @Suburb nvarchar(30)
AS
SELECT * FROM Customer WHERE Suburb = @Suburb

EXEC SelectCustomerSuburb @Suburb = 'Norkem Park'

GO
--This procedure is made to display employees and their salaries filtered by amount
CREATE PROCEDURE SalaryFiltering @Salary money
AS
SELECT Employee.FirstName, Employee.PhoneNumber, EmployeeSalary.EmployeeID, EmployeeSalary.Salary
FROM EmployeeSalary 
 INNER JOIN Employee ON EmployeeSalary.EmployeeID=Employee.EmployeeID
WHERE Salary = @Salary

EXEC SalaryFiltering @Salary=3000

GO
--This procedure is made to update/ change the last name of the specified employee
CREATE PROCEDURE updtEmployee
 @empcode VARCHAR(30)
AS
SELECT Employee.LastName
FROM Employee
WHERE EmployeeID=4 

   BEGIN
      UPDATE Employee 
      SET LastName='Wick' WHERE FirstName='Lessely'
    END

GO

EXECUTE updtEmployee @empcode = FirstName

SELECT * FROM Employee

GO
--This trigger is made to show the data before and after the update
CREATE TRIGGER trEmpSalary
ON EmployeeSalary
AFTER UPDATE
AS
  BEGIN
    SELECT * FROM deleted;
    SELECT * FROM inserted;
  END

GO

UPDATE EmployeeSalary
SET Salary=3100
WHERE EmployeeID=2

GO
--A trigger to restrict deletion of important relationship tables
CREATE TRIGGER trDeleteCustomerBranch
On CustomerBranch
INSTEAD OF DELETE
AS
BEGIN
 PRINT 'Deleting not allowed due to relationship needs'
 END

 GO
 --A trigger to restrict deletion of important relationship tables
 CREATE TRIGGER trDeleteCustomerMembership
 On CustomerMembership
 INSTEAD OF DELETE
 AS
 BEGIN
  PRINT 'Deleting not allowed due to relationship needs'
  END

GO
--A trigger to restrict deletion of important relationship tables
CREATE TRIGGER trDeleteEmployeeBranch
 On EmployeeBranch
 INSTEAD OF DELETE
 AS
 BEGIN
  PRINT 'Deleting not allowed due to relationship needs'
 END

GO
--A trigger to restrict deletion of important relationship tables
CREATE TRIGGER trDeleteEmployeeSalary
 On EmployeeSalary
 INSTEAD OF DELETE
 AS
 BEGIN
  PRINT 'Deleting not allowed due to relationship needs'
 END

 GO
 --A trigger to restrict deletion of important relationship tables
 CREATE TRIGGER trDeleteSupplierBranch
 On SupplierBranch
 INSTEAD OF DELETE
 AS
 BEGIN
  PRINT 'Deleting not allowed due to relationship needs'
  END

GO
--This cursor is made to generate fax numbers 
DECLARE @EmpID INT, @EmpSurname VARCHAR(30), @EmpFax VARCHAR(10)
 DECLARE cur1 CURSOR FOR SELECT EmployeeID, LastName, CAST(RAND()*1000000 AS VARCHAR(10)) FROM Employee
 OPEN cur1
 FETCH NEXT FROM cur1 INTO @EmpID, @EmpSurname, @EmpFax

 WHILE @@FETCH_STATUS=0
   BEGIN
      PRINT CONCAT (@EmpID, CHAR(9), @EmpSurname, CHAR(9), @EmpFax)

      FETCH NEXT FROM cur1 INTO @EmpID, @EmpSurname, @EmpFax
   END
CLOSE cur1
DEALLOCATE cur1

GO

BACKUP DATABASE FamilyFitnessDB
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL12.HEINSQLSERVER\MSSQL\Backup\FamilyFitnessDB.bak';