USE Airbnb_Analytics;

CREATE VIEW Revenue_By_City AS
SELECT
    p.City,
    SUM(b.Total_Revenue) AS Revenue
FROM Properties p
JOIN Bookings b
ON p.Property_ID=b.Property_ID
GROUP BY p.City;

CREATE VIEW Revenue_By_Property_Type AS
SELECT
    p.Property_Type,
    SUM(b.Total_Revenue) AS Revenue
FROM Properties p
JOIN Bookings b
ON p.Property_ID=b.Property_ID
GROUP BY p.Property_Type;

CREATE VIEW Monthly_Revenue AS
SELECT
    MONTH(Check_In_Date) AS Month_Number,
    MONTHNAME(Check_In_Date) AS Month,
    SUM(Total_Revenue) AS Revenue
FROM Bookings
GROUP BY Month_Number, Month
ORDER BY Month_Number;

CREATE VIEW Top_Hosts AS
SELECT
    h.Host_Name,
    SUM(b.Total_Revenue) AS Revenue
FROM Hosts h
JOIN Properties p
ON h.Host_ID=p.Host_ID
JOIN Bookings b
ON p.Property_ID=b.Property_ID
GROUP BY h.Host_Name;

CREATE VIEW Occupancy_By_City AS
SELECT
    p.City,
    COUNT(b.Booking_ID) AS Total_Bookings
FROM Properties p
JOIN Bookings b
ON p.Property_ID=b.Property_ID
GROUP BY p.City;

SELECT * FROM Revenue_By_City;

SELECT * FROM Revenue_By_Property_Type;

SELECT * FROM Monthly_Revenue;

SELECT * FROM Top_Hosts;

SELECT * FROM Occupancy_By_City;