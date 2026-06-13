SELECT
    id,
    product_name,
    category,
    region,
    sale_date,
    quantity,
    unit_price,
    quantity * unit_price AS revenue
FROM sales
ORDER BY sale_date;
