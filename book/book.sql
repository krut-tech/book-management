CREATE DATABASE BookDB;
GO
USE BookDB;
GO

-- AUTHOR TABLE
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    AuthorName NVARCHAR(100) NOT NULL
);

-- CATEGORY TABLE
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL
);

-- BOOK TABLE
CREATE TABLE Book (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    BookName NVARCHAR(100) NOT NULL,
    AuthorID INT NOT NULL,
    CategoryID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- AUTHORS
INSERT INTO Author (AuthorName) VALUES
('Chetan Bhagat'),
('J.K. Rowling'),
('Robin Sharma');

-- CATEGORIES
INSERT INTO Category (CategoryName) VALUES
('Fiction'),
('Motivation'),
('Education');

SELECT * FROM Author;
SELECT * FROM Category;
SELECT * FROM Book;