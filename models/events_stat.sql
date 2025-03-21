SELECT
    SUM (
        CASE
            WHEN type = 'cancel_search' THEN 1
            ELSE 0
        END
    )::float
    /
    SUM (
    CASE
            WHEN type = 'start_search' THEN 1
            ELSE 0
        END
    )
    * 100 AS cancel_pct
FROM {{ ref("events_full") }}