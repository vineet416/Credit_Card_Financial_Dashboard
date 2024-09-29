-- SQL Query to create and import data from csv files:

-- 0. Create a database 
CREATE DATABASE ccdb;
USE ccdb;

-- 1. Create cc_detail table

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date VARCHAR(20),
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

-- 2. Copy csv data into SQL

-- Load data in cc_detail table

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/credit_card.csv'
INTO TABLE cc_detail
FIELDS TERMINATED BY ','
IGNORE 1 LINES;


SELECT * FROM cc_detail;

-- 3. Create cust_detail table

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);


-- 4. Copy csv data into SQL

-- Load data in cust_detail table

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer.csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

SELECT * FROM cust_detail;


-- 5. Load new data in cc_detail table

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cc_add.csv'
INTO TABLE cc_detail
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

Select * from cc_detail;


-- 6. Load new data in cust_detail table

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cust_add.csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

SELECT * FROM cust_detail;