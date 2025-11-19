create table magdalena_szczuka.tpi30 as
select ST_TPI(a.rast,1) as rast
from rasters.dem a;

CREATE INDEX idx_tpi30_rast_gist ON magdalena_szczuka.tpi30

USING gist (ST_ConvexHull(rast));

SELECT AddRasterConstraints('magdalena_szczuka'::name,
'tpi30'::name,'rast'::name);