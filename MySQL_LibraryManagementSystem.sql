create database LibraryDB;

use LibraryDB;

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    available TINYINT DEFAULT 1
);

CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    borrower_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE DEFAULT NULL,

    FOREIGN KEY (book_id)
        REFERENCES Books(book_id),

    FOREIGN KEY (borrower_id)
        REFERENCES Borrowers(borrower_id)
);

INSERT INTO Books (title, author, available)
VALUES
('Java Programming', 'James Gosling', 1),
('Python Crash Course', 'Eric Matthes', 0),
('Clean Code', 'Robert C Martin', 1),
('The Pragmatic Programmer', 'Andrew Hunt', 0),
('Database System Concepts', 'Abraham Silberschatz', 1),
('Learning SQL', 'Alan Beaulieu', 1),
('Head First Java', 'Kathy Sierra', 0),
('Effective Java', 'Joshua Bloch', 1),
('C Programming Language', 'Dennis Ritchie', 1),
('Artificial Intelligence', 'Stuart Russell', 0),
('Data Structures and Algorithms', 'Mark Allen Weiss', 1),
('Operating System Concepts', 'Abraham Silberschatz', 1),
('Computer Networks', 'Andrew Tanenbaum', 0),
('Spring Boot in Action', 'Craig Walls', 1),
('Design Patterns', 'Erich Gamma', 1);

select * from Books;

INSERT INTO Borrowers (borrower_id, name, email)
VALUES
(101, 'Hariharan', 'hariharan@gmail.com'),
(102, 'Zayan', 'zayan@gmail.com'),
(103, 'Princee', 'princee@gmail.com'),
(104, 'Karthik', 'karthik@gmail.com'),
(105, 'Ram', 'ram@gmail.com'),
(106, 'Selva', 'selva@gmail.com'),
(107, 'Dhanu', 'dhanu@gmail.com'),
(108, 'Safiq', 'safiq@gmail.com'),
(109, 'Madesh', 'madesh@gmail.com'),
(110, 'Sherlin', 'sherlin@gmail.com');

select * from Borrowers;

INSERT INTO Loans
(loan_id, book_id, borrower_id, loan_date, return_date)
VALUES
(1, 2, 101, '2026-10-01', NULL),
(2, 4, 102, '2026-10-03', NULL),
(3, 7, 103, '2026-10-05', '2026-10-10'),
(4, 10, 104, '2026-10-07', NULL),
(5, 13, 105, '2026-10-09', NULL),
(6, 1, 106, '2026-10-11', '2026-10-15'),
(7, 5, 101, '2026-10-12', NULL),
(8, 8, 102, '2026-10-14', '2026-10-20'),
(9, 9, 107, '2026-10-16', '2026-10-19'),
(10, 3, 108, '2026-10-18', NULL),
(11, 6, 103, '2026-10-20', '2026-10-25'),
(12, 11, 101, '2026-10-22', NULL);

select * from Loans;

-- Basic SQL Operations
select * from Books;
select title, author from Books;
select * from books where author = 'Abraham Silberschatz';
select * from books where available = 1;
select * from borrowers order by name;

-- Filtering and sorting
select * from books where title like '%Java%';
select * from books where available = 0;
select * from borrowers where name like 'S%';
select * from books limit  5;
select * from books limit 5 offset 5; -- this will return next five records
select * from books order by title desc;
select * from books where author in ('Abraham Silberschatz', 'James Gosling');
SELECT * FROM Loans WHERE loan_date BETWEEN '2026-10-05' AND '2026-10-20';
SELECT * FROM Loans WHERE loan_date >= '2026-10-05' AND loan_date <= '2026-10-20';
SELECT DISTINCT author FROM Books;

-- Aggregate Functions
select count(title) from books;
select count(name) from borrowers;
select min(loan_date) from loans;
select max(loan_date) from loans;

-- joins
SELECT
    b.book_id,
    b.title,
    br.borrower_id,
    br.name
FROM Books AS b
INNER JOIN Loans AS l
    ON b.book_id = l.book_id
INNER JOIN Borrowers AS br
    ON l.borrower_id = br.borrower_id;
    
SELECT
    br.borrower_id,
    br.name,
    l.loan_id,
    l.book_id,
    l.loan_date
FROM Borrowers AS br
LEFT JOIN Loans AS l
    ON br.borrower_id = l.borrower_id;
    
SELECT
    b.book_id,
    b.title,
    l.loan_id,
    l.loan_date
FROM Loans AS l
RIGHT JOIN Books AS b
    ON l.book_id = b.book_id;