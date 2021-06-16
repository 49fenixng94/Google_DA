-- Day of Week for Mostly Frequent Usage of Rides by Type of Users -- 

SELECT 
db.member_casual AS user_type,
day_of_week AS Day_of_Week,
count(ride_id) as num_users

FROM bike_share.dbo.[12mth_combined] AS db
group by db.member_casual, db.day_of_week
order by count(ride_id) desc