DROP DATABASE IF EXISTS Shopping_management;
CREATE DATABASE Shopping_management;
USE Shopping_management;

CREATE TABLE customers (
    Customers_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customers_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Phone_Number VARCHAR(10) NOT NULL,
    Age TINYINT UNSIGNED CHECK (Age > 0),
    Country VARCHAR(50) DEFAULT 'India',
    City VARCHAR(50) NOT NULL,
    Pincode CHAR(6) DEFAULT '201301',
    Registration_Date DATE DEFAULT (CURRENT_DATE),
    Registration_Time TIME DEFAULT (CURRENT_TIME),
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Address VARCHAR(250),
    Customers_Status ENUM('Active', 'Inactive', 'Blocked')
        DEFAULT 'Active',
    Customers_Notes TEXT
);
select * from customers;

INSERT INTO customers
(
    Customers_Id, Customers_Name, Email, Phone_Number,
    Age, Country, City, Registration_Date,
    Registration_Time, Created_At, Address,
    Customers_Status, Customers_Notes
)
VALUES
(
    1, 'Amit', 'amit@example.com', '8979695632',
    19, 'India', 'Noida', '2022-09-12',
    '10:30:00', CURRENT_TIMESTAMP, 'Sector 18, Noida',
    'Active', 'Regular customer'
),
(
    2, 'Sumit', 'sumit@example.com', '8979698965',
    18, 'India', 'Noida', '2022-09-19',
    '09:30:00', CURRENT_TIMESTAMP, 'Sector 16, Noida',
    'Active', 'Regular customer'
);

SELECT * FROM customers;
DESCRIBE customers;


CREATE TABLE orders (
    Order_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Id INT NOT NULL,
    Order_Date DATE DEFAULT (CURRENT_DATE),
    Order_Amount DECIMAL(10,2) NOT NULL,

    Order_Status ENUM(
        'Pending', 'Processing', 'Shipped',
        'Delivered', 'Cancelled'
    ) DEFAULT 'Pending',

    Payment_Method ENUM(
        'Cash', 'Card', 'UPI', 'Net Banking'
    ) DEFAULT 'UPI',

    Payment_Status ENUM(
        'Pending', 'Paid', 'Failed'
    ) DEFAULT 'Pending',

    Shipping_Address VARCHAR(250) NOT NULL,

    Delivery_Pincode CHAR(6)
        CHECK (
            Delivery_Pincode IS NULL
            OR Delivery_Pincode REGEXP '^[0-9]{6}$'
        ),

    Quantity INT NOT NULL CHECK (Quantity > 0),

    Discount_Amount DECIMAL(10,2) DEFAULT 0.00,
    Delivery_Date DATE DEFAULT NULL,
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Tracking_Number VARCHAR(30) UNIQUE,

    Delivery_Status ENUM(
        'Not Dispatched', 'In Transit',
        'Delivered', 'Returned'
    ) DEFAULT 'Not Dispatched',
      Order_Notes VARCHAR(250),
	
    CONSTRAINT fk_orders_customers
        FOREIGN KEY (Customer_Id)
        REFERENCES customers(Customers_Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

SHOW TABLES;
DESCRIBE customers;
DESCRIBE orders;


SELECT * FROM customers;
SELECT * FROM orders;






