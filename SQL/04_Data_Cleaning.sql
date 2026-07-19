USE Airbnb_Analytics;

SELECT *
FROM Bookings
WHERE Booking_ID IS NULL;

DELETE b1
FROM Bookings b1
JOIN Bookings b2
ON b1.Booking_ID = b2.Booking_ID
AND b1.Booking_ID > b2.Booking_ID;

UPDATE Hosts
SET Host_Name = 'Unknown'
WHERE Host_Name IS NULL;

UPDATE Customers
SET Customer_Name = 'Unknown'
WHERE Customer_Name IS NULL;

UPDATE Properties
SET City = 'Unknown'
WHERE City IS NULL;

UPDATE Bookings
SET Booking_Status = 'Pending'
WHERE Booking_Status IS NULL;

UPDATE Payments
SET Payment_Status = 'Pending'
WHERE Payment_Status IS NULL;

UPDATE Reviews
SET Review_Rating = 0
WHERE Review_Rating IS NULL;

UPDATE Properties
SET Price_Per_Night = 0
WHERE Price_Per_Night IS NULL;

UPDATE Bookings
SET Total_Revenue = 0
WHERE Total_Revenue IS NULL;

UPDATE Hosts
SET Host_Name = TRIM(Host_Name);

UPDATE Customers
SET Customer_Name = TRIM(Customer_Name);

UPDATE Properties
SET Property_Name = TRIM(Property_Name);

UPDATE Properties
SET City = UPPER(City);

UPDATE Properties
SET Country = UPPER(Country);

SELECT COUNT(*) AS Hosts
FROM Hosts;

SELECT COUNT(*) AS Properties
FROM Properties;

SELECT COUNT(*) AS Customers
FROM Customers;

SELECT COUNT(*) AS Bookings
FROM Bookings;

SELECT COUNT(*) AS Payments
FROM Payments;

SELECT COUNT(*) AS Reviews
FROM Reviews;