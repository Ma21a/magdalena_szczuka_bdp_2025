SELECT 
    name,
    ST_AsText(geometry) AS wtk,
    ST_Area(geometry) AS pole,
    ST_Perimeter(geometry) AS obwod
FROM buildings
WHERE name = 'BuildingA';
