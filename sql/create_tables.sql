CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    region VARCHAR(50),
    sale_date DATE,
    quantity INTEGER,
    unit_price NUMERIC(10, 2)
);
