--Statistical Summary of users by year & month in the past 12 months (between April 2020 - March 2021)--

--create a temp table for summarized monthly data
WITH monthly_num(mth_num) AS 
	(SELECT count(ride_id) as mth_num
	FROM bike_share.dbo.[12mth_combined] AS db
	GROUP BY MONTH(db.started_at))

SELECT

max(mth_num) as max_num,
min(mth_num) as min_num,
avg(mth_num) as avg_num,
round(stdev(mth_num), 2) as std_num

FROM monthly_num
