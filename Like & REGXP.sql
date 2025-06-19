-- QUESTION -1:Create a database named library and a table named books with the following columns:-- 
create database library;
use library;


create table books(
id INT Primary Key auto_increment,
title VARCHAR(255),
author VARCHAR(100),
year int,
genre VARCHAR(100)
);

-- QUESTION-2: Insert the following book records into the books table:-- 

insert into books(id,title,author,year,genre)
values (1, "The Great Gatsby", "F.Scott Fitzgerald", 1925, "Fiction"),
       (2, "Pride and Prejudice", "Jane Austen", 1813, "Romance"),
       (3, "To Kill a Mockingbird", "Harper Lee", 1960, "Fiction"),
       (4, "1984", "George Orwell", 1949, "Dystopian"),
       (5, "Moby Dick", "Herman Melville", 1851, "Adventure");
       
-- QUESTION -3:Write a query to select all books where the title starts with the letter 'T' using the LIKE operator.-- 
select * from books where title like "T%";

-- QUESTION -4:Write a query to find all books where the author's last name ends with 'son' using the LIKE operator.-- 
select * from books where author like "%son";

-- QUESTION -5:Write a query to find all books where the title contains the word 'and' using the LIKE operator.-- 
select * from books where title like "%and%";

-- QUESTION- 6:Write a query to retrieve all books where the title ends with the word 'bird' using the LIKE operator.-- 
select * from books where title like "%bird";

-- QUESTION -7:Write a query to find all books where the title has exactly 3 characters using the REGEXP operator.-- 

-- QUESTION -8:Write a query to select all books where the title contains a number using the REGEXP operator.-- 
select * from books where title regexp "^[0-9]";

-- QUESTION-9:Write a query to retrieve all books where the author's name starts with any letter between 'A' and 'J' using the REGEXP operator.-- 
select * from books where author regexp "^[A-J]";

-- QUESTION-10:	Write a query to select all books where the genre is either 'Fiction' or 'Adventure' using the REGEXP operator.-- 
select * from books where genre regexp "fiction|adventure";

-- QUESTION-11:Write a query to find all books where the title contains at least one uppercase letter using the REGEXP operator.-- 
select * from books where title regexp"^[A-Z]";

-- QUESTION -12:Write a query to find all books where the year of publication is between 1800 and 1950 using the LIKE operator.--  
select * from books where year between "1800" and "1950";

SELECT * FROM library.books;

-- QUESTION -13:Write a query to retrieve all books where the author's name contains exactly two words using the REGEXP operator.--
SELECT * FROM books WHERE author REGEXP '^[^ ]+ [^ ]+$';

-- QUESTION -14:Write a query to find all books where the title starts with the letter 'P' and contains exactly two words using the REGEXP operator.-- 
select * from books where title regexp '^P[^ ]+ [^ ]+ $';

-- QUESTION -15:Write a query to find all books where the title contains any special characters (e.g., '!', '@', '#', etc.) using the REGEXP operator.-- 
select * FROM books WHERE title REGEXP '[!@#\\$%\\^&\\*()_+\\-=\\[\\]{};:\'",.<>?/|`~]';


