WITH 

new_buildings AS (
    SELECT 
        t9.gid,
        t9.polygon_id,
        t9.name,
        t9.type,
        t9.height,
        NULL::numeric AS old_height,      
        NULL::numeric AS height_diff,     
        'nowy'::text AS status,
        t9.geom
    FROM t2019_kar_buildings t9
    LEFT JOIN t2018_kar_buildings t8
        ON t9.geom = t8.geom
    WHERE t8.geom IS NULL
),


changed_buildings AS (
    SELECT 
        t9.gid,
        t9.polygon_id,
        t9.name,
        t9.type,
        t9.height,
        t8.height AS old_height,
        t9.height - t8.height AS height_diff,
        'zmieniony'::text AS status,
        t9.geom
    FROM t2019_kar_buildings t9
    JOIN t2018_kar_buildings t8
        ON t9.polygon_id = t8.polygon_id  
    WHERE 
        (t9.height <> t8.height OR t9.name <> t8.name OR t9.type <> t8.type)
)

SELECT * FROM new_buildings
UNION ALL
SELECT * FROM changed_buildings;

