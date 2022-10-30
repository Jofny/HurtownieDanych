SELECT TOP 1 [date]
  FROM [cwiczenia4_staging].[dbo].[Orders]
  order by [date]


DECLARE @StartDate  date = '20150101';

DECLARE @CutoffDate date = DATEADD(DAY, -1, DATEADD(YEAR, 10, @StartDate));

;WITH seq(n) AS 
(
  SELECT 0 UNION ALL SELECT n + 1 FROM seq
  WHERE n < DATEDIFF(DAY, @StartDate, @CutoffDate)
),
d(d) AS 
(
  SELECT DATEADD(DAY, n, @StartDate) FROM seq
),
src AS
(
  SELECT
    TheQuarter      = DATEPART(Quarter,   d),
	TheYear         = DATEPART(YEAR,      d),
	TheMonth        = DATEPART(MONTH,     d),
	TheWeek         = DATEPART(WEEK,      d),
    TheDate         = CONVERT(date, d) 
  FROM d
)
SELECT * 
	INTO DIMDate
	FROM src
  ORDER BY TheDate
  OPTION (MAXRECURSION 0);