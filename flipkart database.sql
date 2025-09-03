PRODUCT TABLE
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Price DECIMAL(10, 2),
    Description TEXT,
    ImageURL VARCHAR(255)
);

CATAGORY TABLE
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    ParentCategoryID INT,
    FOREIGN KEY (ParentCategoryID) REFERENCES Categories(CategoryID)
);

Product Categories Table
CREATE TABLE ProductCategories (
    ProductID INT,
    CategoryID INT,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

Product Variants Table
CREATE TABLE ProductVariants (
    ProductVariantID INT PRIMARY KEY,
    ProductID INT,
    VariantName VARCHAR(255),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


IMAGE TABLE
CREATE TABLE Images (
    ImageID INT PRIMARY KEY,
    ProductID INT,
    ImageURL VARCHAR(255),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

Product Ratings Table
CREATE TABLE ProductRatings (
    ProductID INT,
    Rating DECIMAL(1,0),
    PRIMARY KEY (ProductID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CUSTOMER TABLE
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20)
);


ORDER TABLE
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

ORDERED ITEMS TABLE
CREATE TABLE OrderItems (
    OrderedItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

PAYMENT TABLE
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    PaymentAmount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);



SHIPPING TABLE
CREATE TABLE Shipping (
    ShippingID INT PRIMARY KEY,
    OrderID INT,
    ShippingDate DATE,
    ShippingCost DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

RETURN TABLE
CREATE TABLE Returns (
    ReturnID INT PRIMARY KEY,
    OrderID INT,
    ReturnDate DATE,
    ReturnReason TEXT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


REFUND TABLE
CREATE TABLE Refunds (
    RefundID INT PRIMARY KEY,
    ReturnID INT,
    RefundAmount DECIMAL(10, 2),
    FOREIGN KEY (ReturnID) REFERENCES Returns(ReturnID)
);

PRODUCT SPECIFICATIONS TABLE
CREATE TABLE ProductSpecifications (
    ProductSpecificationID INT PRIMARY KEY,
    ProductID INT,
    SpecificationName VARCHAR(255),
    SpecificationValue TEXT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

PRODUCT REVIEW TABLE
CREATE TABLE ProductReviews (
    ProductReviewID INT PRIMARY KEY,
    ProductID INT,
    ReviewText TEXT,
    Rating DECIMAL(1,0),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

PRODUCT RATINGS TABLE
CREATE TABLE ProductRatings (
    ProductRatingID INT PRIMARY KEY,
    ProductID INT,
    Rating DECIMAL(1,0),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

PRODUCT CATAGORIES TABLE
CREATE TABLE ProductCategories (
    ProductCategoryID INT PRIMARY KEY,
    ProductID INT,
    CategoryID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

USER LOG IN TABLE 
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);