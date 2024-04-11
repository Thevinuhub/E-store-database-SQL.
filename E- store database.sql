CREATE DATABASE OnlineStore;

USE OnlineStore;

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Products (product_name, price, stock_quantity) VALUES
    ('Laptop', 800.00, 10),
    ('Smartphone', 500.00, 15),
    ('Headphones', 50.00, 20);

INSERT INTO Customers (customer_name, email, phone) VALUES
    ('Alice', 'alice@example.com', '123-456-7890'),
    ('Bob', 'bob@example.com', '987-654-3210');

INSERT INTO Orders (customer_id, order_date) VALUES
    (1, '2024-04-10'),
    (2, '2024-04-12');

INSERT INTO OrderDetails (order_id, product_id, quantity, total_price) VALUES
    (1, 1, 2, 1600.00),
    (1, 2, 1, 500.00),
    (2, 3, 3, 150.00);
