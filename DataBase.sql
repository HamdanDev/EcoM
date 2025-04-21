-- Create the database
CREATE DATABASE ECommercePlatform;

-- Switch to the database
\c ECommercePlatform;

-- Create Users table
CREATE TABLE Users (
    UserId SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Products table
CREATE TABLE Products (
    ProductId SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Orders table
CREATE TABLE Orders (
    OrderId SERIAL PRIMARY KEY,
    UserId INT NOT NULL,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

-- Create OrderItems table
CREATE TABLE OrderItems (
    OrderItemId SERIAL PRIMARY KEY,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);

-- Create Inventory table
CREATE TABLE Inventory (
    InventoryId SERIAL PRIMARY KEY,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);

-- Create Payments table
CREATE TABLE Payments (
    PaymentId SERIAL PRIMARY KEY,
    OrderId INT NOT NULL,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    Status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);

-- Create Notifications table
CREATE TABLE Notifications (
    NotificationId SERIAL PRIMARY KEY,
    UserId INT NOT NULL,
    Message TEXT NOT NULL,
    SentAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsRead BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

-- Create Analytics table
CREATE TABLE Analytics (
    AnalyticsId SERIAL PRIMARY KEY,
    EventName VARCHAR(100) NOT NULL,
    EventData JSONB,
    EventTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);