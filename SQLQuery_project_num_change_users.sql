--Number of change in users by year & month in the past 12 months (between April 2020 - March 2021)--

SELECT 
YEAR(db.started_at) AS yr,
MONTH(db.started_at) AS mth,
COUNT(ride_id) AS num_users,
LAG(COUNT(ride_id)) OVER (ORDER BY MONTH(db.started_at)) AS gap,
COUNT(ride_id) -LAG(COUNT(ride_id)) OVER (ORDER BY month(db.started_at)) AS num_of_change 


FROM bike_share.dbo.[12mth_combined] AS db
WHERE YEAR(db.started_at) = 2020
GROUP BY YEAR(db.started_at), MONTH(db.started_at)

UNION

SELECT 
YEAR(db.started_at) AS yr,
MONTH(db.started_at) AS mth,
COUNT(ride_id) AS num_users,
LAG(COUNT(ride_id)) OVER (ORDER BY MONTH(db.started_at)) AS gap,
COUNT(ride_id) - LAG(COUNT(ride_id)) OVER (ORDER BY MONTH(db.started_at)) AS num_of_change 


FROM bike_share.dbo.[12mth_combined] AS db
WHERE YEAR(db.started_at) = 2021
GROUP BY YEAR(db.started_at), MONTH(db.started_at)

ORDER BY YEAR(db.started_at), MONTH(db.started_at)



