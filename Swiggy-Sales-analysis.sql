-- Create Database
CREATE DATABASE Swiggy_sales;
GO

USE Swiggy_sales;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount INT,
    CONSTRAINT FK_Customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

-- Insert Customers
INSERT INTO Customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Neha', 'Mumbai'),
(3, 'Rahul', 'Bangalore'),
(4, 'Priya', 'Pune'),
(5, 'Ankit', 'Hyderabad');

-- Insert Orders
INSERT INTO Orders VALUES
(101, 1, '2024-01-01', 500),
(102, 2, '2024-01-02', 750),
(103, 3, '2024-01-03', 300),
(104, 1, '2024-01-05', 900),
(105, 4, '2024-01-06', 450),
(106, 5, '2024-01-07', 650);

-- Analysis Queries
-- Join
SELECT c.CustomerName, c.City, o.OrderDate, o.Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Total Sales
SELECT SUM(Amount) AS Total_Sales FROM Orders;

-- Customer-wise Spend
SELECT c.CustomerName, SUM(o.Amount) AS Total_Spent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;