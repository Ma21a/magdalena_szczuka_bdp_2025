CREATE TABLE magdalena_szczuka.paranhos_slope AS
SELECT a.rid,ST_Slope(a.rast,1,'32BF','PERCENTAGE') as rast
FROM magdalena_szczuka.paranhos_dem AS a;
