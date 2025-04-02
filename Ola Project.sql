use ola;
drop table bookings;

use ola;

#1. Retrieve all successful bookings:
Create view Sucessful_Bookings As
select * from bookings
WHERE Booking_Status = 'Success';

Select * from Sucessful_Bookings;

#2. Find the average ride distance for each vehicle type:
Create view average_ride_distance_for_each_vehicle As
Select Vehicle_Type, avg(Ride_Distance)
from bookings
group by Vehicle_Type;

#2. Find the average ride distance for each vehicle type:
Select * from average_ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers As
Select count(*)
From bookings
WHERE Booking_Status = 'Canceled by Customer';

Select * from cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
create view customers_with_highest_no_of_rides as 
Select Customer_ID, count(Booking_ID) as bookcount
from bookings
Group by Customer_ID
order by bookcount DESC
Limit 5;

Select * from customers_with_highest_no_of_rides;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers AS
Select count(*)
from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

Select * from rides_cancelled_by_drivers;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_and_min_drivers_rating as
Select max(Driver_Ratings), min(Driver_Ratings)
from bookings
WHERE Vehicle_Type = 'Prime Sedan';

Select * from max_and_min_drivers_rating;

#7. Retrieve all rides where payment was made using UPI:
Create view UPI_payments as
Select * From bookings
Where Payment_Method = 'UPI';

Select * from UPI_payments;

#8. Find the average customer rating per vehicle type:
 create view avg_cust_rating as
 Select Vehicle_Type, avg(Customer_Rating)
 from bookings
 group by Vehicle_Type;

Select * from avg_cust_rating;

#9. Calculate the total booking value of rides completed successfully:
create view successfull_total_booking_value as
select sum(Booking_Value) as value
from bookings
Where Booking_Status = 'Success';

Select * from successfull_total_booking_value;

#10. List all incomplete rides along with the reason:
create view incomplete_rides as 
select Booking_ID, Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes';

select * from incomplete_rides;