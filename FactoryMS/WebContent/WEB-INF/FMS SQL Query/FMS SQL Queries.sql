CREATE TABLE Jobs
(
	JobsID CHAR(8) ,
	Job_Title VARCHAR(50),
	Create_Date DATE,
	Basic_Salary DECIMAL,
	Salary_Payment_Methoed VARCHAR(10),
	ETF_Rate DECIMAL,
    EPF_Rate DECIMAL,
	Over_Time_Rate DECIMAL,
	
	CONSTRAINT  Pk_job PRIMARY KEY(JobsID)
	
);

CREATE TABLE Employee
(
	EmpID CHAR(8),
	JobsID CHAR(8),
	Employee_Name VARCHAR(100) NOT NULL UNIQUE,
	DOB DATE,
	NIC CHAR(10),
	Gender VARCHAR(8) NOT NULL ,
	Marital_Status VARCHAR(10),
	Email VARCHAR(100) NOT NULL,
	Contact_No CHAR(10) NOT NULL,
	Address VARCHAR(255) NOT NULL,
	Job_Title VARCHAR(50),
	Date_Joined DATE,
	Qualification VARCHAR(255),
	
	CONSTRAINT Pk_Emp PRIMARY KEY(EmpID),
	CONSTRAINT Fk_Job FOREIGN KEY(JobsID) REFERENCES Jobs(JobsID)
	
);

CREATE TABLE Perfomance_Tracking
(
	EPTID CHAR(8),
	EmpID CHAR(8),
	Emp_Job_Title VARCHAR(50) NOT NULL,
	Emp_Name VARCHAR(50) NOT NULL,
	Month VARCHAR(30) NOT NULL,
	Date DATE NOT NULL,
	Time_In TIME,
	Lunch_In TIME,
	Lunch_Out TIME,
	Time_Out TIME,
	Over_Time TIME,
	Performace TINYINT, 
	Description VARCHAR(255),
	
	CONSTRAINT Pk_Ept PRIMARY KEY(EPTID),
	CONSTRAINT Fk_Emp FOREIGN KEY(EmpID) REFERENCES Employee(EmpID)

);

CREATE TABLE E_Leave
(
	LeaveID CHAR(8),
	EmpID CHAR(8),
	Emp_Name VARCHAR(50) NOT NULL,
	Job_Title VARCHAR(50) NOT NULL,
	Date DATE,
	Month VARCHAR(30),
	Leave_Status VARCHAR(30),
	
	CONSTRAINT Pk_Eleave PRIMARY KEY(LeaveID),
	CONSTRAINT Fk_Empid FOREIGN KEY(EmpID) REFERENCES Employee(EmpID)
	
);

CREATE TABLE Salary
(
	Sal_ID CHAR(8),
	EmpID CHAR(8),
	date DATE ,
	Insurance VARCHAR(30),
	medical FLOAT,
	Bonus FLOAT,
	Over_Time_Hours TIME,
	net_salary DECIMAL,
	Tax DECIMAL ,
	Absent CHAR(5),
	Total_allowance DECIMAL,
	Total_deduction DECIMAL,

	CONSTRAINT Pk_Sal PRIMARY KEY(Sal_ID),
	CONSTRAINT Fk_EmpI FOREIGN KEY(EmpID) REFERENCES Employee(EmpID)

	
);

CREATE TABLE Account 
(
	AccID CHAR(8),
	EmpID CHAR(8),
	Employee_Name VARCHAR(50) NOT NULL unique,
	UserName VARCHAR(50) NOT NULL unique,
	Password varchar(15) NOT NULL unique ,
	Status VARCHAR(30),
	AccountType VARCHAR(30),
	Profile_Image MEDIUMBLOB,
	
	
	CONSTRAINT Pk_Acc PRIMARY KEY(AccID),
	CONSTRAINT Fk_EmpTid FOREIGN KEY(EmpID) REFERENCES Employee(EmpID)
	
);

CREATE TABLE Payment 
(
	PaymenID CHAR(8),
	SupID CHAR(8),
	Date DATE,
	Month VARCHAR(255),
	Name VARCHAR(255),
	Rate DECIMAL,
	Value DECIMAL,
	Final_Amount DECIMAL,
	Ispaid CHAR(10),
	Payment_Type VARCHAR(10),

	CONSTRAINT Pk_Pay PRIMARY KEY(PaymenID),
	CONSTRAINT Fk_Supid FOREIGN KEY(SupID) REFERENCES TeaLeaf_Supplier(SupID)

	
);

CREATE TABLE TeaLeaf_Supplier
(
	SupID CHAR(8),
	Name VARCHAR(50),
	NIC CHAR(10),
	Contact_No CHAR(10),
	Address VARCHAR(30),
	License_No CHAR(15),
	Estate VARCHAR(50),

	CONSTRAINT Pk_TeaSup PRIMARY KEY(SupID)

	
);

CREATE TABLE TeaLeaves
(
	TLID CHAR(8),
	PaymenID CHAR(8),
	SupID CHAR(8),
	Supplier_Name VARCHAR(50),
	Quantity CHAR(5),
	Unit_Price DECIMAL ,
	Paid CHAR(8),
	
	CONSTRAINT Pk_TeaL PRIMARY KEY(TLID),
	CONSTRAINT Fk_pay FOREIGN KEY(PaymenID) REFERENCES Payment(PaymenID),
	CONSTRAINT Fk_Sup FOREIGN KEY(SupID) REFERENCES TeaLeaf_Supplier(SupID)
	
);

CREATE TABLE Tea_Grades
(
	TeaGrade_ID CHAR(8) primary key,
	Tea_Grade_Name VARCHAR(50)

	
);

CREATE TABLE Tea_Stock
(
	Tea_StockID CHAR(8) primary key,
	TeaGrade_ID CHAR(8),
	Storing_Date DATE,
	Tea_Grades VARCHAR(30),
	Tea_Grades_Quantity DECIMAL,
	Storing_Location VARCHAR(30),
	
	CONSTRAINT Fk_TeaGe FOREIGN KEY(TeaGrade_ID) REFERENCES Tea_Grades(TeaGrade_ID)
	
);

CREATE TABLE Sales_ReleaseStock
(
	ReleaseStock_ID CHAR(8) primary key,
	TeaStockID CHAR(8),
	ReleasedDate DATE,
	Tea_Grades_Quantity DECIMAL,
	Tea_Grades VARCHAR(30),
	
	CONSTRAINT Fk_TeaSt FOREIGN KEY(TeaStockID) REFERENCES Tea_Stock(Tea_StockID)
	
);



CREATE TABLE Production
(
	ProductID int(11) PRIMARY KEY,
	TeaGrade_ID char(8),
	teaGrade varchar(50) DEFAULT NULL,
	wastageType varchar(50) DEFAULT NULL,
	leavesWastage varchar(50) DEFAULT NULL,
	teaWastage varchar(50) DEFAULT NULL,
	Quantity decimal(10,0) DEFAULT NULL,
	finalAmmount double DEFAULT NULL,
	Date date DEFAULT NULL,

	
	CONSTRAINT Fk_TeaGeP FOREIGN KEY(TeaGrade_ID) REFERENCES Tea_Grades(TeaGrade_ID)
	
);

CREATE TABLE Wastage
(
	WastageID CHAR(8) primary key,
	ProductID int(11),
	TeaGrade_ID CHAR(8),
	Wastage_Type VARCHAR(30),
	Date DATE,
	
	CONSTRAINT Fk_Pro FOREIGN KEY(ProductID) REFERENCES Production(ProductID),
	CONSTRAINT Fk_TeaGeW FOREIGN KEY(TeaGrade_ID) REFERENCES Tea_Grades(TeaGrade_ID)
	
);

CREATE TABLE Tea_Grade_Price
(
	Tea_Grade_Price_ID CHAR(8) primary key,
	TeaGrade_ID CHAR(8),
	Tea_Grade VARCHAR(50),
	Date DATE,
	Price DECIMAL,

	CONSTRAINT Fk_TeaGePr FOREIGN KEY(TeaGrade_ID) REFERENCES Tea_Grades(TeaGrade_ID)

);

CREATE TABLE Factory_Sales
(
	Factory_Sales_ID INTEGER primary key,
	Tea_Grade_PriceID CHAR(8),
	Date DATE,
	Tea_Grade VARCHAR(30),
	Selling_Quantity DECIMAL,
	Sales_Type VARCHAR(30),
	Month VARCHAR(15),

	CONSTRAINT Fk_TeaPri FOREIGN KEY(Tea_Grade_PriceID) REFERENCES Tea_Grade_Price(Tea_Grade_Price_ID)

	
);

CREATE TABLE Sales_Revenue
(
	Sales_RevenueID INTEGER primary key,
	Factory_SalesID INTEGER,
	Date DATE,
	Tea_Grade VARCHAR(30),
	Sold_Quantity DECIMAL,
	Sales_Type VARCHAR(30),
	Amount DECIMAL,
	Month VARCHAR(15),

	CONSTRAINT Fk_SaleR FOREIGN KEY(Factory_SalesID) REFERENCES Factory_Sales(Factory_Sales_ID)

);

CREATE TABLE Sales_Return
(
	Sales_ReturnID CHAR(8) primary key,
	Factory_SalesID CHAR(8),
	Date DATE,
	Tea_Grade VARCHAR(8),
	Return_Quantity DECIMAL,
	Sales_Type VARCHAR(30),
	Month VARCHAR(15),

	CONSTRAINT Fk_SaleRet FOREIGN KEY(Factory_SalesID) REFERENCES Factory_Sales(Factory_Sales_ID)

	
);

create table expenses(
	id INTEGER(11)PRIMARY KEY,
	date VARCHAR(50),
	exp_type VARCHAR(50),
	discrp VARCHAR(50),
	ammount DOUBLE,
	sup_name VARCHAR(50),
	p_method  VARCHAR(50),
	chk_no VARCHAR(50)
);

CREATE TABLE esupplier(
	id INTEGER(11)PRIMARY KEY,
	dealerName VARCHAR(50),
	tep INTEGER(10),
	Address VARCHAR(80),
	status VARCHAR(50),
	remark VARCHAR(100)
);

CREATE TABLE dealingstatus
(
	id INTEGER(11) primary key,
	dstatus VARCHAR(50)
);

CREATE TABLE payment_mothod
(
	id INTEGER(11) primary key,
	p_method VARCHAR(25)
); 


CREATE TABLE qulity (
  quality_id int(11)  primary key,
  quality varchar(50) NOT NULL
);
