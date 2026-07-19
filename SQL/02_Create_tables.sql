USE Airbnb_Analytics;

CREATE TABLE Hosts (
    Host_ID INT PRIMARY KEY,
    Host_Name VARCHAR(100) NOT NULL,
    Host_Since DATE,
    Host_Rating DECIMAL(3,2),
    Is_Superhost VARCHAR(5),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Country VARCHAR(50)
);

CREATE TABLE Properties (
    Property_ID INT PRIMARY KEY,
    Host_ID INT NOT NULL,
    Property_Name VARCHAR(150) NOT NULL,
    Property_Type VARCHAR(50),
    Room_Type VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    Price_Per_Night DECIMAL(10,2),
    Bedrooms INT,
    Bathrooms INT,
    Max_Guests INT,
    FOREIGN KEY (Host_ID) REFERENCES Hosts(Host_ID)
);

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Country VARCHAR(50),
    Signup_Date DATE
);

CREATE TABLE Bookings (
    Booking_ID INT PRIMARY KEY,
    Property_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    Booking_Date DATE,
    Check_In_Date DATE,
    Check_Out_Date DATE,
    Number_Of_Nights INT,
    Guests INT,
    Booking_Status VARCHAR(30),
    Total_Revenue DECIMAL(12,2),
    FOREIGN KEY (Property_ID) REFERENCES Properties(Property_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Booking_ID INT UNIQUE,
    Payment_Method VARCHAR(50),
    Payment_Date DATE,
    Amount DECIMAL(12,2),
    Payment_Status VARCHAR(30),
    FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID)
);

CREATE TABLE Reviews (
    Review_ID INT PRIMARY KEY,
    Booking_ID INT,
    Review_Date DATE,
    Review_Rating DECIMAL(2,1),
    Review_Text TEXT,
    FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID)
);

CREATE TABLE Calendar (
    Date_ID INT PRIMARY KEY,
    Date DATE,
    Day INT,
    Month INT,
    Quarter INT,
    Year INT,
    Month_Name VARCHAR(20),
    Day_Name VARCHAR(20),
    Is_Weekend BOOLEAN,
    Is_Holiday BOOLEAN
);

CREATE INDEX idx_city
ON Properties(City);

CREATE INDEX idx_property_type
ON Properties(Property_Type);

CREATE INDEX idx_booking_date
ON Bookings(Booking_Date);

CREATE INDEX idx_checkin_date
ON Bookings(Check_In_Date);

CREATE INDEX idx_payment_method
ON Payments(Payment_Method);

SHOW TABLES();

DESCRIBE Hosts;
DESCRIBE Properties;
DESCRIBE Customers;
DESCRIBE Bookings;
DESCRIBE Payments;
DESCRIBE Reviews;
DESCRIBE Calendar;