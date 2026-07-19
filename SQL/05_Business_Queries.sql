USE Airbnb_Analytics;

SELECT COUNT(*) AS Total_Bookings
FROM Bookings;

SELECT SUM(Total_Revenue) AS Total_Revenue
FROM Bookings;

SELECT ROUND(AVG(Price_Per_Night),2) AS ADR
FROM Properties;

SELECT ROUND(AVG(Total_Revenue),2) AS Average_Revenue
FROM Bookings;

SELECT City,
COUNT(*) AS Total_Bookings
FROM Properties p
JOIN Bookings b
ON p.Property_ID=b.Property_ID
GROUP BY City
ORDER BY Total_Bookings DESC;

SELECT City,
SUM(Total_Revenue) AS Revenue
FROM Properties p
JOIN Bookings b
ON p.Property_ID=b.Property_ID
GROUP BY City
ORDER BY Revenue DESC;

SELECT Property_Type,
SUM(Total_Revenue) AS Revenue
FROM Properties p
JOIN Bookings b
ON p.Property_ID=b.Property_ID
GROUP BY Property_Type
ORDER BY Revenue DESC;

SELECT Room_Type,
COUNT(*) AS Bookings
FROM Properties p
JOIN Bookings b
ON p.Property_ID=b.Property_ID
GROUP BY Room_Type;

SELECT MONTH(Check_In_Date) AS Month,
SUM(Total_Revenue) AS Revenue
FROM Bookings
GROUP BY Month
ORDER BY Month;

SELECT Host_Name,
SUM(Total_Revenue) AS Revenue
FROM Hosts h
JOIN Properties p
ON h.Host_ID=p.Host_ID
JOIN Bookings b
ON p.Property_ID=b.Property_ID
GROUP BY Host_Name
ORDER BY Revenue DESC
LIMIT 10;

SELECT Property_Name,
SUM(Total_Revenue) AS Revenue
FROM Properties p
JOIN Bookings b
ON p.Property_ID=b.Property_ID
GROUP BY Property_Name
ORDER BY Revenue DESC
LIMIT 10;

SELECT Booking_Status,
COUNT(*) AS Total
FROM Bookings
GROUP BY Booking_Status;

SELECT Payment_Method,
SUM(Amount) AS Total_Amount
FROM Payments
GROUP BY Payment_Method;

SELECT ROUND(AVG(Number_Of_Nights),2) AS Avg_Stay
FROM Bookings;

SELECT ROUND(AVG(Review_Rating),2) AS Average_Rating
FROM Reviews;

SELECT Country,
COUNT(*) AS Properties
FROM Properties
GROUP BY Country;

SELECT City,
ROUND(AVG(Price_Per_Night),2) AS Average_Price
FROM Properties
GROUP BY City;

SELECT Property_Type,
ROUND(AVG(Price_Per_Night),2) AS Average_Price
FROM Properties
GROUP BY Property_Type;

SELECT MONTHNAME(Check_In_Date) AS Month,
COUNT(*) AS Bookings
FROM Bookings
GROUP BY Month
ORDER BY MONTH(Check_In_Date);

SELECT Customer_ID,
SUM(Total_Revenue) AS Total_Spent
FROM Bookings
GROUP BY Customer_ID
ORDER BY Total_Spent DESC
LIMIT 10;