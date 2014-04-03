-- Builds a calendar of how many events exist in a year
SELECT * FROM crosstab(
  'SELECT extract(year from starts) as year, extract(month from starts) as month, count(*) FROM events GROUP BY year, month',
	'SELECT * FROM generate_series(1,12)'
) AS (
  year int,
  jan int, feb int, mar int, apr int, may int, jun int, jul int, aug int, sep int, oct int, nov int, dec int
);
