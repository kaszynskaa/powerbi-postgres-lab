CREATE TABLE dim_date (
    date_key   INTEGER      PRIMARY KEY,
    full_date  DATE         NOT NULL,
    day_num    SMALLINT     NOT NULL,
    month_num  SMALLINT     NOT NULL,
    month_name VARCHAR(20)  NOT NULL,
    quarter    SMALLINT     NOT NULL,
    year_num   SMALLINT     NOT NULL,
    week_num   SMALLINT     NOT NULL,
    is_weekend BOOLEAN      NOT NULL
);

INSERT INTO dim_date (
    date_key, full_date, day_num, month_num, month_name, quarter, year_num, week_num, is_weekend
)
SELECT
    TO_CHAR(d, 'YYYYMMDD')::INTEGER,
    d::DATE,
    EXTRACT(DAY FROM d)::SMALLINT,
    EXTRACT(MONTH FROM d)::SMALLINT,
    TRIM(TO_CHAR(d, 'Month')),
    EXTRACT(QUARTER FROM d)::SMALLINT,
    EXTRACT(YEAR FROM d)::SMALLINT,
    EXTRACT(WEEK FROM d)::SMALLINT,
    CASE WHEN EXTRACT(DOW FROM d) IN (0, 6) THEN TRUE ELSE FALSE END
FROM generate_series(
    '2026-01-01'::DATE,
    '2026-12-31'::DATE,
    '1 day'::INTERVAL
) AS d;
