CREATE TABLE IF NOT EXISTS magdalena_szczuka.intersects AS
SELECT a.rast, b.municipality
FROM rasters.dem AS a, vectors.porto_parishes AS b
WHERE ST_Intersects(a.rast, b.geom) AND b.municipality ilike 'porto';

alter table magdalena_szczuka.intersects
add column rid SERIAL PRIMARY KEY;

CREATE INDEX idx_intersects_rast_gist ON magdalena_szczuka.intersects
USING gist (ST_ConvexHull(rast));

SELECT AddRasterConstraints('magdalena_szczuka'::name, 'intersects'::name,'rast'::name);

