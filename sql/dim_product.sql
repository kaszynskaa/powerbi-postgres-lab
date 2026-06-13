CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL,
    unit_price NUMERIC(10, 2) NOT NULL
);

INSERT INTO dim_product (product_name, category, unit_price) VALUES
('Laptop', 'Electronics', 4500.00),
('Monitor', 'Electronics', 1200.00),
('Tablet', 'Electronics', 2800.00),
('Smartphone', 'Electronics', 3200.00),
('Printer', 'Electronics', 900.00),
('Keyboard', 'Accessories', 300.00),
('Mouse', 'Accessories', 150.00),
('Headphones', 'Accessories', 450.00),
('Webcam', 'Accessories', 350.00),
('USB Hub', 'Accessories', 120.00),
('Laptop Stand', 'Accessories', 200.00),
('Office License', 'Software', 800.00),
('Antivirus', 'Software', 250.00),
('Design Suite', 'Software', 1500.00),
('Desk', 'Furniture', 1800.00),
('Chair', 'Furniture', 1200.00);
