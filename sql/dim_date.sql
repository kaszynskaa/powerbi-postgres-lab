CREATE TABLE dim_date (
    date_key   INTEGER PRIMARY KEY,
    date       DATE        NOT NULL,
    day        SMALLINT    NOT NULL,
    month      SMALLINT    NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    quarter    SMALLINT    NOT NULL,
    year       SMALLINT    NOT NULL,
    week       SMALLINT    NOT NULL,
    is_weekend BOOLEAN     NOT NULL
);

INSERT INTO dim_date (
    date_key, date, day, month, month_name, quarter, year, week, is_weekend
)
SELECT
    TO_CHAR(d, 'YYYYMMDD')::INTEGER,
    d::DATE,
    EXTRACT(DAY     FROM d)::SMALLINT,
    EXTRACT(MONTH   FROM d)::SMALLINT,
    TRIM(TO_CHAR(d, 'Month')),
    EXTRACT(QUARTER FROM d)::SMALLINT,
    EXTRACT(YEAR    FROM d)::SMALLINT,
    EXTRACT(WEEK    FROM d)::SMALLINT,
    EXTRACT(DOW     FROM d) IN (0, 6)
FROM generate_series(
    '2026-01-01'::DATE,
    '2026-12-31'::DATE,
    '1 day'::INTERVAL
) AS d;
