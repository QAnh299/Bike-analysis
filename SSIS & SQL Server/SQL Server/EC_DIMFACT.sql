--DIM
/*CREATE TABLE Dim_Category (
    category_key INT IDENTITY(1,1) PRIMARY KEY,
    category_id INT,
    category_name NVARCHAR(255)
);
CREATE TABLE Dim_Brand (
    brand_key INT IDENTITY(1,1) PRIMARY KEY,
    brand_id INT,
	brand_name NVARCHAR(255),
);*/
CREATE TABLE Dim_Geography (
    geography_key INT IDENTITY(1,1) PRIMARY KEY,
    city NVARCHAR(50),
    state NVARCHAR(25)
);
CREATE TABLE Dim_Customer (
    customer_key INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    first_name NVARCHAR(255),
    last_name NVARCHAR(255),
    phone NVARCHAR(25),
    email NVARCHAR(255),
    geography_key INT
);
CREATE TABLE Dim_Product (
    product_key INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT,
    product_name NVARCHAR(255),
    model_year SMALLINT,
    brand_name NVARCHAR(255),
    category_name NVARCHAR(255)
);
CREATE TABLE Dim_Store (
    store_key INT IDENTITY(1,1) PRIMARY KEY,
    store_id INT,
    store_name NVARCHAR(255),
    phone NVARCHAR(25),
    email NVARCHAR(255),
    geography_key INT
);
CREATE TABLE Dim_Staff (
    staff_key INT IDENTITY(1,1) PRIMARY KEY,
    staff_id INT,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    email NVARCHAR(255),
    phone NVARCHAR(25),
    active TINYINT,
    store_key INT
);
CREATE TABLE Dim_Date (
    date_key INT IDENTITY(1,1) PRIMARY KEY,
    date_id INT,
    full_date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT,
    is_weekend INT,
    is_holiday INT
);

--FACT
CREATE TABLE Fact_Sales (
    store_key INT,
    product_key INT,
	date_key INT,
	total_sales decimal(18,2),
    total_orders int,
    total_quantity int,
    PRIMARY KEY (store_key, date_key, product_key)
);
CREATE TABLE Fact_Customer (
    date_key int,
    customer_key int,
    total_quantity int,
    total_sales decimal(18,2),
    PRIMARY KEY (date_key, customer_key)
);
CREATE TABLE Fact_Staff (
    date_key int,
    staff_key int,
    total_orders int,
    total_revenue decimal(18,2),
    PRIMARY KEY (date_key, staff_key)
);

/*
--khoá ngoại
ALTER TABLE Dim_Customer
ADD CONSTRAINT FK_Dim_Customer_Geography
FOREIGN KEY (geography_key)
REFERENCES Dim_Geography(geography_key);

ALTER TABLE Dim_Product
ADD CONSTRAINT FK_Dim_Product_Brand
FOREIGN KEY (brand_key)
REFERENCES Dim_Brand(brand_key);

ALTER TABLE Dim_Product
ADD CONSTRAINT FK_Dim_Product_Category
FOREIGN KEY (category_key)
REFERENCES Dim_Category(category_key);

ALTER TABLE Dim_Store
ADD CONSTRAINT FK_Dim_Store_Geography
FOREIGN KEY (geography_key)
REFERENCES Dim_Geography(geography_key);

ALTER TABLE Dim_Staff
ADD CONSTRAINT FK_Dim_Staff_Store
FOREIGN KEY (store_key)
REFERENCES Dim_Store(store_key);

ALTER TABLE Fact_Sales
ADD CONSTRAINT FK_Fact_Sales_Product
FOREIGN KEY (product_key)
REFERENCES Dim_Product(product_key);

ALTER TABLE Fact_Sales
ADD CONSTRAINT FK_Fact_Sales_Store
FOREIGN KEY (store_key)
REFERENCES Dim_Store(store_key);

ALTER TABLE Fact_Sales
ADD CONSTRAINT FK_Fact_Sales_Date
FOREIGN KEY (date_key)
REFERENCES Dim_Date(date_key);

ALTER TABLE Fact_Customer
ADD CONSTRAINT FK_Fact_Customer_Customers
FOREIGN KEY (customer_key)
REFERENCES Dim_Customer(customer_key);

ALTER TABLE Fact_Customer
ADD CONSTRAINT FK_Fact_Customer_Date
FOREIGN KEY (date_key)
REFERENCES Dim_Date(date_key);

ALTER TABLE Fact_Staff
ADD CONSTRAINT FK_Fact_Staff_Staffs
FOREIGN KEY (staff_key)
REFERENCES Dim_Staff(staff_key);

ALTER TABLE Fact_Staff
ADD CONSTRAINT FK_Fact_Staff_Date
FOREIGN KEY (date_key)
REFERENCES Dim_Date(date_key);

ALTER TABLE Fact_Staff
ADD CONSTRAINT FK_Fact_Staff_Store
FOREIGN KEY (store_key)
REFERENCES Dim_Customer(store_key);*/


SELECT * FROM Dim_Product
SELECT * FROM Dim_Store
SELECT * FROM Dim_Customer
SELECT * FROM Dim_Geography
SELECT * FROM Dim_Staff
SELECT * FROM Dim_Date

SELECT * FROM Fact_Sales
SELECT * FROM Fact_Customer
SELECT * FROM Fact_Staff;

CREATE TABLE DataMart_Customer (
    full_date DATE,
    customer_id INT,
    customer_name NVARCHAR(511),
    total_quantity INT,
    total_sales INT
);

CREATE TABLE DataMart_Sales(
	full_date date,
	product_id int ,
	product_name NVARCHAR(255),
	store_name NVARCHAR(255),
	total_orders int,
	total_quantity int,
	total_sales decimal(18,2)
);

CREATE TABLE Datamart_Staff (
    full_date DATE,
    staff_id INT,
    staff_name NVARCHAR(150),  
    store_name NVARCHAR(255), 
    total_orders INT,
    total_revenue DECIMAL(18,2)
);

SELECT * FROM Datamart_Sales
SELECT * FROM Datamart_Customer
SELECT * FROM Datamart_Staff