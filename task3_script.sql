DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Order_Items;
DROP TABLE IF EXISTS Payments;
-- Customers Table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT UNIQUE,
    phone TEXT,
    address TEXT
);

-- Products Table
CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    description TEXT,
    price REAL,
    stock INTEGER
);

-- Orders Table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    order_date TEXT DEFAULT CURRENT_TIMESTAMP,
    status TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    price REAL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER,
    payment_method TEXT,
    payment_date TEXT DEFAULT CURRENT_TIMESTAMP,
    amount REAL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert sample customers
INSERT INTO Customers (name, email, phone, address)
VALUES 
('Sriram', 'sriram@example.com', '1234567890', 'Hyderabad'),
('Aarav', 'aarav@example.com', '9876543210', 'Bangalore'),
('Priya', 'priya@example.com', '9988776655', 'Chennai');

-- Insert sample products
INSERT INTO Products (name, description, price, stock)
VALUES 
('Keyboard', 'Mechanical Keyboard', 1500.00, 50),
('Mouse', 'Wireless Mouse', 700.00, 100),
('Monitor', '24-inch Full HD', 11000.00, 30);

-- Insert sample orders
INSERT INTO Orders (customer_id, status)
VALUES (1, 'Placed'), (2, 'Shipped');

-- Insert sample order items
INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES 
(1, 1, 2, 3000.00), 
(2, 3, 1, 11000.00);

-- Insert sample payments
INSERT INTO Payments (order_id, payment_method, amount)
VALUES 
(1, 'UPI', 3000.00),
(2, 'Credit Card', 11000.00);

-- SELECT queries using AND, OR, LIKE, BETWEEN

-- AND
SELECT * FROM Products WHERE price > 100 AND stock > 20;

-- OR
SELECT * FROM Customers WHERE name = 'Sriram' OR address = 'Chennai';

-- LIKE
SELECT * FROM Customers WHERE name LIKE 'S%'; 

-- BETWEEN
SELECT * FROM Products WHERE price BETWEEN 700 AND 1500;

-- Other required SELECT queries
SELECT * FROM Customers;
SELECT name, price FROM Products WHERE price > 1000;
SELECT * FROM Orders WHERE status = 'Placed';
SELECT * FROM Products ORDER BY price DESC;
SELECT * FROM Customers LIMIT 2;
