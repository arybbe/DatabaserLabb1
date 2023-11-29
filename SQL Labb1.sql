--CREATE DATABASE BookStoreDb;
--USE BookStoreDb;

--CREATE TABLE Authors (
--	Id int PRIMARY KEY Identity,
--	FirstName nvarchar(40) NOT NULL,
--	LastName nvarchar(40),
--	Birthdate DATE,
--);


--CREATE TABLE Books(
--	ISBN nvarchar(13) PRIMARY KEY,
--	Title nvarchar(max) NOT NULL,
--	Pages int,
--	[Language] nvarchar(50) NOT NULL,
--	Price decimal,
--	ReleaseDate DATE,
--	AuthorId int FOREIGN KEY REFERENCES Authors(Id), 
--);

--CREATE TABLE Stores(
--	Id int PRIMARY KEY Identity,
--	[Name] nvarchar(50) NOT NULL,
--	[Address] nvarchar(50) NOT NULL,
--);

--CREATE TABLE Inventory(
--	[StoreId] int NOT NULL,
--	[ISBN] nvarchar(13) NOT NULL,
--	[Quantity] int NOT NULL,
--	CONSTRAINT PK_InventoryBalance PRIMARY KEY ([StoreId], [ISBN]),
--	CONSTRAINT FK_StoreId_Store FOREIGN KEY ([StoreId]) REFERENCES Stores(Id),
--	CONSTRAINT FK_ISBN_Books FOREIGN KEY ([ISBN]) REFERENCES Books(ISBN),
--);

--CREATE TABLE Customers(
--	Id int PRIMARY KEY Identity,
--	FirstName nvarchar(50) NOT NULL,
--	LastName nvarchar(50),
--	City nvarchar(50) NOT NULL,
--);

--CREATE TABLE Orders(
--	Id int PRIMARY KEY Identity,
--	CustomerId int FOREIGN KEY REFERENCES Customers(Id),
--	StoreId int FOREIGN KEY REFERENCES Stores(Id),
--	AuthorId int FOREIGN KEY REFERENCES Authors(Id),
--	ISBN nvarchar(13) FOREIGN KEY REFERENCES Books(ISBN)
--);

--INSERT INTO Authors (FirstName, LastName, Birthdate)
--VALUES 
--('Astrid', 'Lindgren', '1907-11-14'),
--('John', 'Tolkien', '1892-01-03'),
--('George', 'Martin', '1948-09-20'),
--('George', 'Lucas', '1944-05-14'),
--('Andrzej', 'Sapkowski', '1948-06-21'),
--('Joanne', 'Rowling', '1965-07-31'),
--('Francis', 'Fitzgerald', '1896-09-24')
--;
SELECT *
FROM Authors;


INSERT INTO Books (ISBN, Title, Pages, Language, Price, IssueDate, AuthorId)
VALUES
('9789113084930', 'Silmarillion', 400, 'Svenska', 229, '2019-08-28', 2),
('9789129687316', 'Stora Emilboken', 381, 'Svenska', 199, '2013-03-21', 1),
('9789129711929', 'Pippi firar jul', 20, 'Svenska', 79, '2018-10-19', 1),
('9789113084893', 'Hobbiten', 283, 'Svenska', 199, '2019-08-29', 2),
