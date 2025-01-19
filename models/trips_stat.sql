SELECT
    COUNT(*) AS trips,
    COUNT (DISTINCT user_id) AS users,
    AVG(EXTRACT(EPOCH FROM (finished_at - started_at)) / 60) AS avg_duration_m,
    SUM(price) / 100 AS revenue_rub,
    SUM(
        CASE
            WHEN price = 0 OR price IS NULL THEN 1
            ELSE 0
        END
    ) / COUNT(*)::real * 100 AS free_trips_pct
--     count(price = 0 or null) / cast(count(*) as real) * 100 as free_trips_pct -- v2
FROM scooters_raw.trips