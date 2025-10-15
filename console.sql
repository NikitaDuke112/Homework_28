/*1*/
IF NOT EXISTS (
    SELECT name
    FROM sys.databases
    WHERE name = N'sales_database'
)
    BEGIN
        CREATE DATABASE sales_database;
    END
GO

USE sales_database;

/*2*/
CREATE TABLE sales (
    id INT PRIMARY KEY IDENTITY(1, 1),
    product VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL
);

/*3*/
INSERT INTO sales (product, price, quantity) VALUES
('Laptop', 1000.00, 5),
('Phone', 700.00, 3),
('Tablet', 500.00, 2),
('Printer', 300.00, 4);

/*4*/
SELECT *
FROM sales;

/*5*/
SELECT TOP 2 * FROM sales;

/*6*/
SELECT SUM(price * quantity) AS total_revenue
FROM sales;

/*7*/
SELECT
    product,
    SUM(quantity) AS total_quantity_sold,
    AVG(price) AS avarage_unit_price
FROM sales
GROUP BY product;

