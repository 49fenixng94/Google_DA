--Statistical Summary of users by year & month in the past 12 months (between April 2020 - March 2021)--

-- As there are a certain number of outliers in this dataset,
-- I only take the data within the interquartile range (2nd+3rd quartiles) in this calculation 

--create a temp table for summarized monthly data
WITH monthly_num(mth_num) AS 
	(SELECT count(ride_id) as mth_num
	FROM 
	(SELECT *
		FROM (SELECT *,
				NTILE(4) OVER (ORDER BY ride_length) as backets
				FROM bike_share.dbo.[12mth_combined]) subq
		WHERE subq.backets not in (1, 4)) db
	GROUP BY MONTH(db.started_at))

SELECT

max(mth_num) as max_num,
min(mth_num) as min_num,
avg(mth_num) as avg_num,
round(stdev(mth_num), 2) as std_num

FROM monthly_num
