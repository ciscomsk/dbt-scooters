SELECT
    st_transform(hex.geom, 4326) as geom,
    COUNT(*) as trips
FROM {{ ref("trips_geom") }} as t
CROSS JOIN st_hexagongrid(500, st_transform(t.start_point, 3587)) as hex
WHERE st_intersects(st_transform(t.start_point, 3587), hex.geom)
GROUP BY geom