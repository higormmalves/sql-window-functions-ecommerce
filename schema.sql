--E-Commerce Analytics: Window Functions

-- Create orders table
 CREATE TABLE sales_orders (
	order_id INT,
	customer_id INT,
	order_date DATE,
	product_category VARCHAR(50),
	order_amount DECIMAL(10,2)
);

-- Insert data
INSERT INTO sales_orders VALUES
(1, 101, '2026-01-01', 'Electronics', 500.00),
(2, 102, '2026-01-01', 'Clothing', 50.00),
(3, 101, '2026-01-02', 'Electronics', 150.00),
(4, 103, '2026-01-02', 'Home', 300.00),
(5, 102, '2026-01-03', 'Clothing', 80.00),
(6, 101, '2026-01-04', 'Electronics', 200.00),
(7, 104, '2026-01-04', 'Home', 120.00),
(8, 103, '2026-01-05', 'Home', 450.00); 

