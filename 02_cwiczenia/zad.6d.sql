SELECT 
    name,
    ST_Perimeter(geometry) AS obwod,
    ST_Area(geometry) AS pole_pow
FROM buildings
ORDER BY pole_pow DESC
LIMIT 2;

