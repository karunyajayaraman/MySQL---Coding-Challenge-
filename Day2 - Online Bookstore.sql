-- Day 2: SQL Coding Challenge – Online Bookstore 
-- Question 1: CREATE TABLE with PRIMARY & FOREIGN KEY

-- creating a database
create database Online_Bookstore;
Use Online_Bookstore;
Create table Books(
BookID INTEGER PRIMARY KEY,
Title VARCHAR (100) NOT NULL,
Author VARCHAR(50) NOT NULL,
ISBN VARCHAR(20) UNIQUE, -- unique constraint
Price DECIMAL(8,2) CHECK(Price > 0)
);

-- `online_bookstore`
Create table Orders(
OrderID INTEGER PRIMARY KEY,
BookID INTEGER ,
OrderDate DATE NOT NULL,
Quantity INTEGER CHECK(Quantity > 0),
FOREIGN KEY(BookID) REFERENCES Books(BookID)
);


-- Question 2: ALTER TABLE – Add Default Constraint

ALTER TABLE Books
modify ISBN VARCHAR(20) DEFAULT 'Not Assigned' ;
commit;

-- Question 3: INSERT, RETRIEVE & UPDATE with Constraints

Select * from Books;

INSERT INTO Books(BookID, Title, Author,ISBN, Price)
VALUES 
(1, 'SQL Basics', 'John Smith', 'ISBN101', 450),

(2, 'Power BI Guide', 'David Lee', 'ISBN102', 600),

(3, 'Python for Data', 'Sarah Khan', 'ISBN103', 750),

(4, 'Excel Analytics', 'Robert Joe','ISBN104', 500),

(5, 'Database Concepts', 'James Miller','ISBN105', 900);


INSERT INTO Books(BookID, Title, Author, ISBN, Price) -- UNIQUE constraint attempted
VALUES (8, 'Data Science', 'John', '', 700);

INSERT INTO Books(BookID, Title, Author, ISBN, Price) -- UNIQUE constraint attempted
VALUES (9, 'Excel ', 'Robert ', 'ISBN109',500);

/*
INSERT INTO Books(BookID, Title, Author, Price) -- UNIQUE constraint attempted
VALUES 
(7, 'Javascript', 'Allen', 350);

Error Code: 1062. Duplicate entry 'Not Assigned' for key 'books.ISBN'	
*/

INSERT INTO Books(BookID, Title, Author,ISBN, Price)
VALUES
(7, 'Machine Learning Basics', 'Andrew Cole', 'Not Assigned', 1200);

INSERT INTO Books(BookID, Title, Author,ISBN, Price)
VALUES
(8, 'Advanced MySQL', 'Rachel Green', 'Not Assigned', 950);

/*
Error Code: 1064. You have an error in your SQL syntax; 
check the manual that corresponds to your MySQL server version for the right syntax to use near
 '8, 'Advanced MySQL', 'Rachel Green', 'Not Assigned', 950)' at line 1	
*/

-- Update DML command
/*
UPDATE books
SET price = 0
WHERE bookid = 6;

Error Code: 3819. Check constraint 'books_chk_1' is violated.
*/

UPDATE books
SET price = 50
WHERE bookid = 6; -- Check constraint attempt

-- Question 4: DELETE vs TRUNCATE

DELETE FROM books -- Deleted bookid =5 row
WHERE bookid = 5;

Select * from Books;

Select * from orders;
INSERT INTO Orders (OrderID, BookID, OrderDate, Quantity)
VALUES
(101, 1, '2026-05-20', 2),

(102, 2, '2026-05-21', 1),

(103, 3, '2026-05-22', 4),

(104, 6, '2026-05-23', 3),

(105, 7, '2026-05-24', 2);

TRUNCATE books;

/* Error Code: 1701. 
Cannot truncate a table referenced in a foreign key constraint (`online_bookstore`.`orders`, CONSTRAINT `orders_ibfk_1`)
*/
