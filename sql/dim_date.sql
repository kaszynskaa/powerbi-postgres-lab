CREATE TABLE dim_date (
    date_key INTEGER PRIMARY KEY,
    full_date DATE NOT NULL,
    day_num SMALLINT NOT NULL,
    month_num SMALLINT NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    quarter_num SMALLINT NOT NULL,
    year_num SMALLINT NOT NULL,
    week_num SMALLINT NOT NULL,
    is_weekend BOOLEAN NOT NULL
);

INSERT INTO dim_date (
    date_key, full_date, day_num, month_num, month_name, quarter_num, year_num, week_num, is_weekend
)
SELECT
    TO_CHAR(d, 'YYYYMMDD')::INTEGER AS date_key,
    d::DATE AS full_date,
    EXTRACT(DAY FROM d)::SMALLINT AS day_num,
    EXTRACT(MONTH FROM d)::SMALLINT AS month_num,
    TRIM(TO_CHAR(d, 'Month')) AS month_name,
    EXTRACT(QUARTER FROM d)::SMALLINT AS quarter_num,
    EXTRACT(YEAR FROM d)::SMALLINT AS year_num,
    EXTRACT(WEEK FROM d)::SMALLINT AS week_num,
    EXTRACT(DOW FROM d) IN (0, 6) AS is_weekend
FROM GENERATE_SERIES(
    '2026-01-01'::DATE,
    '2026-12-31'::DATE,
    '1 day'::INTERVAL
) AS d;
