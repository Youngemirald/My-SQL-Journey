CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    CopiesAvailable INT DEFAULT 1 CHECK (CopiesAvailable >= 0));

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    LoanDate DATE DEFAULT (CURRENT_DATE) NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID));

INSERT INTO Books (BookID, Title, Author, Genre, CopiesAvailable) VALUES
(101, 'Things Fall Apart', 'Chinua Achebe', 'Fiction', 5),
(102, 'Half of a Yellow Sun', 'Chimamanda Adichie', 'Fiction', 3),
(103, 'The Concubine', 'Elechi Amadi', 'Fiction', 2),
(104, 'Introduction to Database Systems', 'C.J. Date', 'Non-Fiction', 4),
(105, 'SQL for Beginners', 'Alice Smith', 'Non-Fiction', 1);

INSERT INTO Members (MemberID, MemberName, Email) VALUES
(201, 'Adebayo Johnson', 'adebayo.j@gmail.com'),
(202, 'Chioma Okonkwo', 'chioma.o@gmail.com'),
(203, 'Emeka Ibrahim', 'emeka.i@yahoo.com'),
(204, 'Folake Adeleke', 'folake.a@yahoo.com');

INSERT INTO Loans (LoanID, MemberID, BookID, LoanDate, ReturnDate) VALUES
(301, 201, 101, '2023-01-05', '2023-01-20'),
(302, 201, 102, '2023-01-10', '2023-01-25'),
(303, 202, 103, '2023-01-15', NULL),
(304, 203, 104, '2023-01-20', '2023-02-05'),
(305, 204, 105, '2023-01-25', NULL),
(306, 201, 101, '2023-02-01', '2023-02-15'),
(307, 202, 102, '2023-02-05', '2023-02-20'),
(308, 203, 103, '2023-02-10', '2023-02-25'),
(309, 204, 104, '2023-02-15', '2023-03-02'),
(310, 201, 105, '2023-02-20', '2023-03-07');

-- Inserting a new book
INSERT INTO Books (BookID, Title, Author, Genre, CopiesAvailable)
VALUES (106, 'Purple Hibiscus', 'Chimamanda Adichie', 'Fiction', 4);

-- Selecting all books
SELECT * FROM Books;

-- Updating CopiesAvailable for a specific BookID
UPDATE Books
SET CopiesAvailable = 2
WHERE BookID = 103;

-- Deleting one book by BookID
UPDATE Books
SET CopiesAvailable = 0
WHERE BookID = 105;

-- Filtering And Sorting
SELECT * FROM Books
WHERE Genre = 'Fiction'
ORDER BY Title ASC;

-- Aggregation (COUNT total loans per book)
SELECT b.BookID, b.Title, COUNT(l.LoanID) AS TotalLoans
FROM Books b
LEFT JOIN Loans l ON b.BookID = l.BookID
GROUP BY b.BookID, b.Title;

-- AVG CopiesAvailable across all books
SELECT AVG(CopiesAvailable) AS AverageCopiesAvailable
FROM Books;

-- Members with active loans
SELECT m.MemberID, m.MemberName, COUNT(l.LoanID) AS ActiveLoans
FROM Members m
JOIN Loans l ON m.MemberID = l.MemberID
WHERE l.ReturnDate IS NULL
GROUP BY m.MemberID, m.MemberName
HAVING COUNT(l.LoanID);

-- GROUP BY + HAVING to find members with > 2 active loans
SELECT m.MemberID,
m.MemberName,
COUNT(l.LoanID) AS ActiveLoans
FROM Members m
JOIN Loans l ON m.MemberID = l.MemberID
WHERE l.ReturnDate IS NULL
GROUP BY m.MemberID, m.MemberName
HAVING COUNT(l.LoanID) > 2
ORDER BY ActiveLoans DESC;

