-- Average Ride Length (in minutes) User Mostly Spent On by Type of Users & Day of Week -- 

SELECT 
db.member_casual AS user_type,
day_of_week AS Day_of_Week,
count(ride_id) as num_users,
avg(DATEDIFF(minute, db.started_at, db.ended_at)) as avg_min_ride_length

FROM bike_share.dbo.[12mth_combined] AS db
group by db.member_casual, db.day_of_week
order by avg_min_ride_length desc