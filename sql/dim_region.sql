CREATE TABLE dim_region (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO dim_region (region_name) VALUES
('North'),
('South'),
('East'),
('West');
