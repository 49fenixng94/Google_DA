-- Membership type for Monthly Top3 Users by month--

-- As there are a certain number of outliers in this dataset,
-- I only take the data within the interquartile range (2nd+3rd quartiles) in this calculation  

SELECT 
Yr,
Mth,
ride_id,
member_casual,
ride_length
FROM

	(SELECT
	YEAR(subq2.started_at) as Yr,
	MONTH(subq2.started_at) as Mth,
	ride_id,
	member_casual,
	ride_length,
	ROW_NUMBER() over (partition by MONTH(subq2.started_at) order by ride_length desc) as rn
	FROM 
		(SELECT *
			FROM (SELECT *,
					NTILE(4) OVER (ORDER BY ride_length) as backets
					FROM bike_share.dbo.[12mth_combined]) subq
			WHERE subq.backets not in (1, 4)) subq2
			) subq3

WHERE rn <= 3
order by Yr, Mth, rn

