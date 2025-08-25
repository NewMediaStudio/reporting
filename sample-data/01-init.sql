-- Sample data for Metabase prototype dashboard
-- This represents a typical business scenario with sales, customers, and products

-- Create customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    company VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    created_date DATE DEFAULT CURRENT_DATE
);

-- Create products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    cost DECIMAL(10,2),
    supplier VARCHAR(100)
);

-- Create orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    order_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) DEFAULT 'completed',
    total_amount DECIMAL(10,2)
);

-- Create order_items table
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    product_id INTEGER REFERENCES products(product_id),
    quantity INTEGER,
    unit_price DECIMAL(10,2)
);

-- Insert sample customers
INSERT INTO customers (first_name, last_name, email, company, city, country) VALUES
('John', 'Smith', 'john.smith@email.com', 'TechCorp', 'New York', 'USA'),
('Sarah', 'Johnson', 'sarah.j@email.com', 'DataFlow Inc', 'London', 'UK'),
('Michael', 'Brown', 'mike.brown@email.com', 'InnovateTech', 'Toronto', 'Canada'),
('Emily', 'Davis', 'emily.davis@email.com', 'CloudSoft', 'Sydney', 'Australia'),
('David', 'Wilson', 'david.wilson@email.com', 'NextGen Solutions', 'Berlin', 'Germany'),
('Lisa', 'Anderson', 'lisa.anderson@email.com', 'Digital Dynamics', 'Paris', 'France'),
('Robert', 'Taylor', 'robert.taylor@email.com', 'Smart Systems', 'Tokyo', 'Japan'),
('Jennifer', 'Martinez', 'jen.martinez@email.com', 'Future Tech', 'São Paulo', 'Brazil');

-- Insert sample products
INSERT INTO products (product_name, category, price, cost, supplier) VALUES
('Laptop Pro X1', 'Electronics', 1299.99, 800.00, 'TechSuppliers Inc'),
('Wireless Mouse', 'Electronics', 29.99, 15.00, 'TechSuppliers Inc'),
('Office Chair', 'Furniture', 199.99, 120.00, 'OfficeFurn Co'),
('Desk Lamp', 'Furniture', 49.99, 25.00, 'OfficeFurn Co'),
('Coffee Mug', 'Kitchen', 12.99, 5.00, 'Kitchen Essentials'),
('Notebook Set', 'Office Supplies', 24.99, 12.00, 'PaperCo'),
('USB Cable', 'Electronics', 9.99, 3.00, 'TechSuppliers Inc'),
('Plant Pot', 'Home & Garden', 19.99, 8.00, 'GreenThumb Ltd');

-- Insert sample orders
INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, '2024-01-15', 'completed', 1329.98),
(2, '2024-01-16', 'completed', 79.98),
(3, '2024-01-17', 'completed', 249.98),
(4, '2024-01-18', 'completed', 62.98),
(5, '2024-01-19', 'completed', 39.98),
(1, '2024-01-20', 'completed', 49.99),
(6, '2024-01-21', 'completed', 1299.99),
(7, '2024-01-22', 'completed', 89.97),
(8, '2024-01-23', 'completed', 199.99),
(2, '2024-01-24', 'completed', 24.99);

-- Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1299.99),
(1, 2, 1, 29.99),
(2, 2, 1, 29.99),
(2, 7, 5, 9.99),
(3, 3, 1, 199.99),
(3, 4, 1, 49.99),
(4, 4, 1, 49.99),
(4, 5, 1, 12.99),
(5, 7, 4, 9.99),
(6, 4, 1, 49.99),
(7, 1, 1, 1299.99),
(8, 2, 3, 29.99),
(9, 3, 1, 199.99),
(10, 6, 1, 24.99);

-- Create some additional sample data for time series analysis
INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(3, '2024-02-01', 'completed', 89.97),
(4, '2024-02-02', 'completed', 1299.99),
(5, '2024-02-03', 'completed', 39.98),
(6, '2024-02-04', 'completed', 199.99),
(7, '2024-02-05', 'completed', 24.99),
(8, '2024-02-06', 'completed', 79.98),
(1, '2024-02-07', 'completed', 49.99),
(2, '2024-02-08', 'completed', 1329.98);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(11, 7, 9, 9.99),
(12, 1, 1, 1299.99),
(13, 7, 4, 9.99),
(14, 3, 1, 199.99),
(15, 6, 1, 24.99),
(16, 2, 1, 29.99),
(16, 7, 5, 9.99),
(17, 4, 1, 49.99),
(18, 1, 1, 1299.99),
(18, 2, 1, 29.99);
