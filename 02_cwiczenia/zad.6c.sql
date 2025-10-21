SELECT 
    name,
    ST_Area(geometry) AS pole_pow
FROM buildings
ORDER BY name ASC;
