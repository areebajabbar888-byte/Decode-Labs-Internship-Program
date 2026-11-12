-- Create the database

CREATE DATABASE ecommerce_db;

-- Select the database

USE ecommerce_db;

-- Import the cleaned E-commerce dataset
-- The CSV file was imported using the Table Data Import Wizard
-- in MySQL Workbench.
-- The wizard created the table: cleaned_ecommerce_orders
-- View all records from the imported table

select * from cleaned_ecommerce_orders;

-- select specific column

SELECT
    OrderID,
    CustomerID,
    Product,
    Quantity,
    UnitPrice,
    TotalPrice
FROM cleaned_ecommerce_orders;

-- Filter completed orders using WHERE 

SELECT *
FROM cleaned_ecommerce_orders
WHERE OrderStatus = 'Completed';

-- Find high-value orders

SELECT
    OrderID,
    Product,
    TotalPrice
FROM cleaned_ecommerce_orders
WHERE TotalPrice > 1000;

-- Filter orders by payment method

SELECT *
FROM cleaned_ecommerce_orders
WHERE PaymentMethod = 'Credit Card';

-- Sort orders by total price

SELECT
    OrderID,
    Product,
    TotalPrice
FROM cleaned_ecommerce_orders
ORDER BY TotalPrice DESC;

-- Count total orders

SELECT
    COUNT(*) AS Total_Orders
FROM cleaned_ecommerce_orders;

-- Calculate total revenue

SELECT
    SUM(TotalPrice) AS Total_Revenue
FROM cleaned_ecommerce_orders;

-- Calculate average order value

SELECT
    AVG(TotalPrice) AS Average_Order_Value
FROM cleaned_ecommerce_orders;

-- Calculate total quantity sold

SELECT
    SUM(Quantity) AS Total_Quantity_Sold
FROM cleaned_ecommerce_orders;

-- Count orders by payment method

SELECT
    PaymentMethod,
    COUNT(*) AS Total_Orders
FROM cleaned_ecommerce_orders
GROUP BY PaymentMethod
ORDER BY Total_Orders DESC;

-- Calculate revenue by product

SELECT
    Product,
    SUM(TotalPrice) AS Total_Revenue
FROM cleaned_ecommerce_orders
GROUP BY Product
ORDER BY Total_Revenue DESC;

-- Analyze orders by status

SELECT
    OrderStatus,
    COUNT(*) AS Total_Orders
FROM cleaned_ecommerce_orders
GROUP BY OrderStatus
ORDER BY Total_Orders DESC;

-- Calculate average order value by payment method

SELECT
    PaymentMethod,
    AVG(TotalPrice) AS Average_Order_Value
FROM cleaned_ecommerce_orders
GROUP BY PaymentMethod
ORDER BY Average_Order_Value DESC;

-- Identify the top 5 highest-value orders

SELECT
    OrderID,
    Product,
    TotalPrice
FROM cleaned_ecommerce_orders
ORDER BY TotalPrice DESC
LIMIT 5;

-- Analyze completed order revenue by product

SELECT
    Product,
    COUNT(*) AS Total_Orders,
    SUM(TotalPrice) AS Total_Revenue,
    AVG(TotalPrice) AS Average_Order_Value
FROM cleaned_ecommerce_orders
WHERE OrderStatus = 'Completed'
GROUP BY Product
ORDER BY Total_Revenue DESC;
